#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use FindBin;
use Getopt::Long qw(GetOptions);
use JSON::PP;
use POSIX qw(strftime);
use open qw(:std :encoding(UTF-8));

my $root = "$FindBin::Bin/..";
my $date = strftime('%Y-%m-%d', gmtime);
my $dry_run = 0;
GetOptions('date=s' => \$date, 'dry-run' => \$dry_run) or die "Usage: $0 [--date YYYY-MM-DD] [--dry-run]\n";
die "Invalid publication date: $date\n" unless $date =~ /^\d{4}-\d{2}-\d{2}$/;

my $json = JSON::PP->new->canonical->pretty;

sub read_json {
    my ($path) = @_;
    open my $fh, '<:encoding(UTF-8)', $path or die "Cannot read $path: $!\n";
    local $/;
    return $json->decode(<$fh>);
}

my $publication_path = "$root/data/publication.json";
my $publication = read_json($publication_path);
my %ready;
for my $path (glob "$root/editorial/records/*.json") {
    my $record = read_json($path);
    $ready{$record->{claim_id}} = 1
        if ($record->{status} // '') eq 'ready_to_publish'
        && length($record->{publication_copy}{title} // '');
}

my @eligible = sort {
    ($a->{claim_id} =~ /(\d+)$/)[0] <=> ($b->{claim_id} =~ /(\d+)$/)[0]
} grep { ($_->{state} // '') eq 'withheld' && $ready{$_->{claim_id}} } @{$publication->{entries}};

my $next = shift @eligible;
if ($next) {
    $next->{state} = 'published';
    $next->{scheduled_date} = $date;
    $next->{published_url} = "https://nonprophet.app/claims/$next->{claim_id}/";

    unless ($dry_run) {
        my $temporary_path = "$publication_path.tmp";
        open my $fh, '>:encoding(UTF-8)', $temporary_path or die "Cannot write $temporary_path: $!\n";
        print {$fh} $json->encode($publication);
        close $fh or die "Cannot close $temporary_path: $!\n";
        rename $temporary_path, $publication_path or die "Cannot replace $publication_path: $!\n";
    }
}

my $remaining = scalar @eligible;
my $low = $remaining < 5 ? 'true' : 'false';
print 'claim_id=' . ($next ? $next->{claim_id} : '') . "\n";
print "remaining=$remaining\n";
print "low=$low\n";
print "dry_run=" . ($dry_run ? 'true' : 'false') . "\n";
