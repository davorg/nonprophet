#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use FindBin;
use JSON::PP;
use List::Util qw(sum);
use open qw(:std :encoding(UTF-8));

my $root = "$FindBin::Bin/..";
my $path = "$root/data/production-metrics.jsonl";
my $json = JSON::PP->new;
open my $fh, '<:encoding(UTF-8)', $path or die "Cannot read $path: $!\n";
my (@events, $line_number);
while (my $line = <$fh>) {
    $line_number++;
    next unless $line =~ /\S/;
    my $event = eval { $json->decode($line) };
    die "$path line $line_number is invalid JSON: $@" unless $event;
    die "$path line $line_number has invalid event\n"
        unless ($event->{schema_version} // 0) == 1
            && ($event->{event} // '') =~ /^(?:start|stop|mark)$/
            && ($event->{claim_id} // '') =~ /^prophecy-\d{3}$/
            && ($event->{stage} // '') =~ /^[a-z][a-z0-9_]*$/
            && ($event->{epoch} // '') =~ /^\d+$/
            && ref($event->{details}) eq 'HASH';
    push @events, $event;
}
close $fh;

if (@ARGV && $ARGV[0] eq '--check') {
    print "Production metrics valid (" . scalar(@events) . " events)\n";
    exit 0;
}

my (%open, %claim_stage_seconds, %resources, %completed);
for my $event (sort { $a->{epoch} <=> $b->{epoch} } @events) {
    my $key = join "\0", $event->{claim_id}, $event->{stage};
    if ($event->{event} eq 'start') {
        push @{$open{$key}}, $event;
    } elsif ($event->{event} eq 'stop') {
        my $start = shift @{$open{$key} // []};
        die "Stop without start for $event->{claim_id} $event->{stage}\n" unless $start;
        next if $event->{details}{exclude};
        my $seconds = $event->{epoch} - $start->{epoch};
        $claim_stage_seconds{$event->{stage}}{$event->{claim_id}} += $seconds;
        for my $name (keys %{$event->{details}}) {
            next if $name eq 'correction';
            my $value = $event->{details}{$name};
            $resources{$name}{$event->{claim_id}} += $value
                if !ref($value) && $value =~ /^-?(?:\d+(?:\.\d+)?|\.\d+)$/;
        }
    } elsif ($event->{event} eq 'mark') {
        if ($event->{stage} eq 'checkpoint'
            && ($event->{details}{status} // '') eq 'complete') {
            $completed{$event->{claim_id}} = 1;
        }
        for my $name (keys %{$event->{details}}) {
            next if $name eq 'correction';
            my $value = $event->{details}{$name};
            $resources{$name}{$event->{claim_id}} += $value
                if !ref($value) && $value =~ /^-?(?:\d+(?:\.\d+)?|\.\d+)$/;
        }
    }
}

my $ready = 0;
for my $record_path (glob "$root/editorial/records/prophecy-*.json") {
    open my $record_fh, '<:encoding(UTF-8)', $record_path or die $!;
    local $/;
    my $record = $json->decode(<$record_fh>);
    close $record_fh;
    $ready++ if ($record->{status} // '') eq 'ready_to_publish';
}
my $remaining = 351 - $ready;

print "Non-Prophet production metrics\n\n";
print "Corpus: 351 claims; ready to publish: $ready; remaining: $remaining\n";
print "Measured completed claims: " . scalar(keys %completed) . "\n";
my @completed_totals = sort { $a <=> $b }
    map { $claim_stage_seconds{total}{$_} // 0 } keys %completed;
if (@completed_totals) {
    my @values = @completed_totals;
    my $mean = sum(@values) / @values;
    my $middle = int(@values / 2);
    my $median = @values % 2
        ? $values[$middle]
        : ($values[$middle - 1] + $values[$middle]) / 2;
    printf "Mean elapsed per claim: %.1f min; median: %.1f min\n", $mean / 60, $median / 60;
    printf "Projected remaining elapsed work: %.1f hours\n", $remaining * $mean / 3600;
    print "Projection warning: fewer than 10 measured claims; treat as directional only\n"
        if @values < 10;
} else {
    print "Elapsed-time projection: unavailable until one instrumented claim completes\n";
}

print "\nStages\n";
for my $stage (sort keys %claim_stage_seconds) {
    my @values = values %{$claim_stage_seconds{$stage}};
    printf "  %-22s n=%d mean=%.1f min\n", $stage, scalar(@values), sum(@values) / @values / 60;
}

print "\nConstrained resources (recorded values only)\n";
for my $name (sort keys %resources) {
    my @values = values %{$resources{$name}};
    my @completed_values = map { $resources{$name}{$_} // 0 } keys %completed;
    my $mean = @completed_values ? sum(@completed_values) / @completed_values : 0;
    printf "  %-22s total=%.0f", $name, sum(@values);
    printf " mean/completed-claim=%.1f projected-remaining=%.0f",
        $mean, $mean * $remaining if @completed_values;
    print "\n";
}
print "  Primary-agent tokens are unknown unless the runtime exposes and records them.\n";

my @unfinished = sort map {
    my ($claim, $stage) = split /\0/;
    @{$open{$_}} ? "$claim:$stage" : ()
} keys %open;
print "\nOpen timers: " . (@unfinished ? join(', ', @unfinished) : 'none') . "\n";
