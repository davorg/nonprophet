#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use FindBin;
use File::Path qw(make_path);
use JSON::PP;
use POSIX qw(strftime);
use open qw(:std :encoding(UTF-8));

my $root = "$FindBin::Bin/..";
my $claim_id = shift @ARGV // '';
die "Usage: $0 CLAIM_ID [--verse OSIS ...] [--output PATH]\n"
    unless $claim_id =~ /^prophecy-\d{3}$/;

my (@extra_verses, $output);
while (@ARGV) {
    my $option = shift @ARGV;
    if ($option eq '--verse') {
        push @extra_verses, shift(@ARGV) // die "--verse requires an OSIS ID\n";
    } elsif ($option eq '--output') {
        $output = shift(@ARGV) // die "--output requires a path\n";
    } else {
        die "Unknown option: $option\n";
    }
}
my $date = strftime('%Y-%m-%d', gmtime(time));
$output //= "$root/editorial/review-prompts/$claim_id-adversarial-$date.md";
$output = "$root/$output" unless $output =~ m{^/};

my $json = JSON::PP->new->canonical->pretty;
sub read_json {
    my ($path) = @_;
    open my $fh, '<:encoding(UTF-8)', $path or die "Cannot read $path: $!\n";
    local $/;
    return $json->decode(<$fh>);
}
sub read_text {
    my ($path) = @_;
    open my $fh, '<:encoding(UTF-8)', $path or die "Cannot read $path: $!\n";
    local $/;
    return <$fh>;
}

my $record = read_json("$root/editorial/records/$claim_id.json");
my $claims = read_json("$root/data/claims.json");
my ($claim) = grep { $_->{id} eq $claim_id } @{$claims->{entries}};
die "Unknown canonical claim $claim_id\n" unless $claim;
my $scripture = read_json("$root/data/scripture/bsb-v5.9.json");

my @canonical;
push @canonical, "Seed-list wording: $claim->{seed_claim}";
push @canonical, "OT reference: $claim->{ot_passage}{normalized}";
for my $verse (@{$claim->{ot_text}{verses}}) {
    push @canonical, "$verse->{osis}: $verse->{text}";
    push @canonical, map { "  Note: $_" } @{$verse->{notes}};
}
for my $index (0 .. $#{$claim->{nt_passages}}) {
    push @canonical, "NT reference: $claim->{nt_passages}[$index]{normalized}";
    for my $verse (@{$claim->{nt_texts}[$index]{verses}}) {
        push @canonical, "$verse->{osis}: $verse->{text}";
        push @canonical, map { "  Note: $_" } @{$verse->{notes}};
    }
}

my %seen;
my @extras;
for my $osis (@extra_verses) {
    die "Invalid OSIS ID '$osis'\n" unless $osis =~ /^[1-3]?[A-Za-z]+\.\d+\.\d+$/;
    next if $seen{$osis}++;
    my $verse = $scripture->{verses}{$osis}
        or die "No BSB verse found for $osis\n";
    push @extras, "$osis: $verse->{text}";
    push @extras, map { "  Note: $_" } @{$verse->{notes}};
}

my $material = join "\n", (
    '## Canonical claim and cited text', '', @canonical,
    @extras ? ('', '## Additional context selected by the drafting editor', '', @extras) : (),
    '', '## Complete pre-review editorial record', '', '```json',
    $json->encode($record), '```',
);
my $prompt = read_text("$root/editorial/ADVERSARIAL_REVIEW_PROMPT.md");
my $replacements = ($prompt =~ s/\{\{REVIEW_MATERIAL\}\}/$material/);
die "Review prompt template lacks exactly one material marker\n" unless $replacements == 1;

my ($directory) = $output =~ m{^(.*)/[^/]+$};
make_path($directory) if defined $directory;
open my $out, '>:encoding(UTF-8)', $output or die "Cannot write $output: $!\n";
print {$out} $prompt;
close $out or die "Cannot close $output: $!\n";
my $bytes = -s $output;
printf "Generated %s (%d bytes; roughly %d tokens)\n", $output, $bytes, int(($bytes + 3) / 4);
