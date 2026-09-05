#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use FindBin;
use Fcntl qw(:flock);
use JSON::PP;
use POSIX qw(strftime);
use open qw(:std :encoding(UTF-8));

my ($action, $claim_id, $stage, @fields) = @ARGV;
die "Usage: $0 start|stop|mark CLAIM_ID STAGE [name=value ...]\n"
    unless ($action // '') =~ /^(?:start|stop|mark)$/
        && ($claim_id // '') =~ /^prophecy-\d{3}$/
        && ($stage // '') =~ /^[a-z][a-z0-9_]*$/;

my %allowed_stage = map { $_ => 1 } qw(
    total research drafting adversarial_review review_resolution
    publication_copy rendering_validation checkpoint
);
die "Unknown stage '$stage'\n" unless $allowed_stage{$stage};

my %details;
for my $field (@fields) {
    my ($name, $value) = split /=/, $field, 2;
    die "Expected name=value, got '$field'\n"
        unless defined $value && $name =~ /^[a-z][a-z0-9_]*$/;
    $value = 0 + $value if $value =~ /^-?(?:\d+(?:\.\d+)?|\.\d+)$/;
    $details{$name} = $value;
}

my $path = "$FindBin::Bin/../data/production-metrics.jsonl";
open my $fh, '>>:encoding(UTF-8)', $path or die "Cannot append $path: $!\n";
flock($fh, LOCK_EX) or die "Cannot lock $path: $!\n";
my $now = time;
my $event = {
    schema_version => 1,
    event => $action,
    claim_id => $claim_id,
    stage => $stage,
    epoch => $now,
    timestamp => strftime('%Y-%m-%dT%H:%M:%SZ', gmtime($now)),
    details => \%details,
};
print {$fh} JSON::PP->new->canonical->encode($event), "\n";
close $fh or die "Cannot close $path: $!\n";
print "$action $claim_id $stage at $event->{timestamp}\n";
