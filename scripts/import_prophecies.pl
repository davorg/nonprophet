#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use Encode qw(decode FB_CROAK);
use HTML::TreeBuilder;
use JSON::PP;
use open qw(:std :encoding(UTF-8));

my ($input, $output) = @ARGV;
die "Usage: $0 SOURCE_HTML OUTPUT_JSON\n" unless $input && $output;

open my $source_fh, '<:raw', $input
    or die "Cannot read $input: $!\n";
local $/;
my $source_bytes = <$source_fh>;
close $source_fh or die "Cannot close $input: $!\n";

# HTML::TreeBuilder's parse_file does not decode the document according to its
# declared charset. Decode explicitly so UTF-8 punctuation is not interpreted
# as a sequence of Latin-1 characters and then re-encoded into mojibake.
my $source_html = decode('UTF-8', $source_bytes, FB_CROAK);

my $tree = HTML::TreeBuilder->new;
$tree->parse($source_html);
$tree->eof;

sub clean {
    my ($value) = @_;
    $value =~ s/\x{a0}/ /g;
    $value =~ s/\s+/ /g;
    $value =~ s/^\s+|\s+$//g;
    return $value;
}

my @entries;
for my $row ($tree->look_down(class => qr/\brow\s+mb-4\b/)) {
    my @columns = grep {
        ($_->attr('class') // '') =~ /\bcol-md-/
    } $row->content_list;

    next unless @columns == 3;

    my $source = clean($columns[0]->as_text);
    next unless $source =~ s/^(\d+)\.\s*//;
    my $source_id = 0 + $1;

    my $claim = clean($columns[1]->as_text);
    my $fulfillment = clean($columns[2]->as_text);
    my @nt_references = grep { length } map { clean($_) } split /\s*;\s*/, $fulfillment;

    push @entries, {
        id             => sprintf('prophecy-%03d', $source_id),
        source_id      => $source_id,
        ot_reference   => $source,
        claim_summary  => $claim,
        nt_references  => \@nt_references,
        review_status  => 'unreviewed',
    };
}

$tree->delete;

die "Expected 351 entries, extracted " . scalar(@entries) . "\n"
    unless @entries == 351;

for my $index (0 .. $#entries) {
    my $expected = $index + 1;
    die "Missing or out-of-order source ID at row $expected\n"
        unless $entries[$index]{source_id} == $expected;
}

my $dataset = {
    schema_version => 1,
    title          => 'Christian claims of Old Testament prophecies fulfilled by Jesus',
    generated_from => 'https://chartingthebible.org/articles/60-351-ot-prophesies-fulfilled-in-jesus.html',
    entry_count    => scalar(@entries),
    entries        => \@entries,
};

open my $fh, '>:encoding(UTF-8)', $output
    or die "Cannot write $output: $!\n";
print {$fh} JSON::PP->new->canonical->pretty->encode($dataset);
close $fh or die "Cannot close $output: $!\n";

print "Wrote " . scalar(@entries) . " entries to $output\n";
