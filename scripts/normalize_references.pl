#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use JSON::PP;
use open qw(:std :encoding(UTF-8));

my ($seed_path, $books_path, $claims_path, $audit_path) = @ARGV;
die "Usage: $0 SEED_JSON BOOKS_JSON CLAIMS_JSON AUDIT_JSON\n"
    unless $seed_path && $books_path && $claims_path && $audit_path;

sub read_json {
    my ($path) = @_;
    open my $fh, '<:encoding(UTF-8)', $path or die "Cannot read $path: $!\n";
    local $/;
    my $value = JSON::PP->new->decode(<$fh>);
    close $fh or die "Cannot close $path: $!\n";
    return $value;
}

sub write_json {
    my ($path, $value) = @_;
    open my $fh, '>:encoding(UTF-8)', $path or die "Cannot write $path: $!\n";
    print {$fh} JSON::PP->new->canonical->pretty->encode($value);
    close $fh or die "Cannot close $path: $!\n";
}

my $seed = read_json($seed_path);
my $book_data = read_json($books_path);
my %books = map { $_->{source_abbreviation} => $_ } @{$book_data->{books}};

die "Expected a 66-book canon\n" unless keys(%books) == 66;

my @corrections;
my @errors;
my %source_occurrences;
my %normalized_occurrences;
my %raw_source_occurrences;
my $reference_count = 0;
my $segment_count = 0;
my $cross_chapter_count = 0;
my @segment_details;
my @cross_chapter_details;

sub parse_reference {
    my ($source, $expected_testament, $claim_id, $field) = @_;
    $reference_count++;
    $source_occurrences{$source}++;

    my ($abbr, $chapter_start, $verse_start, $segment_start,
        $chapter_end, $verse_end, $segment_end) =
        $source =~ /^([1-3]?[A-Za-z]+)\s+(\d+):(\d+)([a-z])?(?:-(?:(\d+):)?(\d+)([a-z])?)?$/;

    unless (defined $abbr) {
        push @errors, {
            claim_id => $claim_id,
            field    => $field,
            source   => $source,
            error    => 'syntax_error',
        };
        return;
    }

    my $book = $books{$abbr};
    unless ($book) {
        push @errors, {
            claim_id => $claim_id,
            field    => $field,
            source   => $source,
            error    => 'unknown_book',
        };
        return;
    }

    if ($book->{testament} ne $expected_testament) {
        push @errors, {
            claim_id => $claim_id,
            field    => $field,
            source   => $source,
            error    => 'unexpected_testament',
            expected => $expected_testament,
            actual   => $book->{testament},
        };
        return;
    }

    $chapter_start = 0 + $chapter_start;
    $verse_start = 0 + $verse_start;
    $chapter_end = defined($chapter_end) ? 0 + $chapter_end : $chapter_start;
    $verse_end = defined($verse_end) ? 0 + $verse_end : $verse_start;

    if ($chapter_end < $chapter_start
        || ($chapter_end == $chapter_start && $verse_end < $verse_start)) {
        push @errors, {
            claim_id => $claim_id,
            field    => $field,
            source   => $source,
            error    => 'reversed_range',
        };
        return;
    }

    if (defined($segment_start) || defined($segment_end)) {
        $segment_count++;
        push @segment_details, {
            claim_id => $claim_id,
            field    => $field,
            source   => $source,
            flag     => 'source_clause_segment_requires_text_mapping',
        };
    }
    if ($chapter_end != $chapter_start) {
        $cross_chapter_count++;
        push @cross_chapter_details, {
            claim_id => $claim_id,
            field    => $field,
            source   => $source,
        };
    }

    my $normalized = "$book->{name} $chapter_start:$verse_start";
    $normalized .= $segment_start if defined $segment_start;
    if ($chapter_end != $chapter_start) {
        $normalized .= "-$chapter_end:$verse_end";
        $normalized .= $segment_end if defined $segment_end;
    } elsif ($verse_end != $verse_start || defined $segment_end) {
        $normalized .= "-$verse_end";
        $normalized .= $segment_end if defined $segment_end;
    }

    my $osis = "$book->{osis}.$chapter_start.$verse_start";
    $osis .= "!$segment_start" if defined $segment_start;
    if ($chapter_end != $chapter_start || $verse_end != $verse_start || defined $segment_end) {
        $osis .= "-$book->{osis}.$chapter_end.$verse_end";
        $osis .= "!$segment_end" if defined $segment_end;
    }

    $normalized_occurrences{$normalized}++;

    return {
        source     => $source,
        normalized => $normalized,
        osis       => $osis,
        testament  => $book->{testament},
        book       => $book->{name},
        book_osis  => $book->{osis},
        book_order => $book->{order},
        start      => {
            chapter => $chapter_start,
            verse   => $verse_start,
            segment => $segment_start,
        },
        end        => {
            chapter => $chapter_end,
            verse   => $verse_end,
            segment => $segment_end,
        },
    };
}

my @claims;
my %claim_ids;
my %source_ids;
for my $entry (@{$seed->{entries}}) {
    die "Duplicate claim ID $entry->{id}\n" if $claim_ids{$entry->{id}}++;
    die "Duplicate source ID $entry->{source_id}\n" if $source_ids{$entry->{source_id}}++;
    $raw_source_occurrences{$entry->{ot_reference}}++;
    $raw_source_occurrences{$_}++ for @{$entry->{nt_references}};
    my $ot = parse_reference($entry->{ot_reference}, 'OT', $entry->{id}, 'ot_reference');
    my @nt_sources = @{$entry->{nt_references}};

    # The source page omitted a separator between these two references. Keep the
    # correction explicit in the audit instead of silently baking it into seed data.
    if (@nt_sources == 1 && $nt_sources[0] eq 'Rom 5:10 2 Cor 5:18-21') {
        push @corrections, {
            claim_id => $entry->{id},
            field    => 'nt_references',
            source   => $nt_sources[0],
            corrected_to => ['Rom 5:10', '2Cor 5:18-21'],
            reason   => 'missing_reference_separator_and_noncanonical_book_spacing',
        };
        @nt_sources = ('Rom 5:10', '2Cor 5:18-21');
    }

    my @nt;
    for my $source (@nt_sources) {
        my $parsed = parse_reference($source, 'NT', $entry->{id}, 'nt_references');
        push @nt, $parsed if $parsed;
    }

    push @claims, {
        id            => $entry->{id},
        source_id     => $entry->{source_id},
        seed_claim    => $entry->{claim_summary},
        review_status => $entry->{review_status},
        ot_passage    => $ot,
        nt_passages   => \@nt,
    };
}

my @duplicate_references = map {
    +{normalized => $_, occurrences => $normalized_occurrences{$_}}
} sort {
    $normalized_occurrences{$b} <=> $normalized_occurrences{$a} || $a cmp $b
} grep { $normalized_occurrences{$_} > 1 } keys %normalized_occurrences;

my $claims = {
    schema_version => 1,
    generated_from => $seed_path,
    entry_count    => scalar(@claims),
    entries        => \@claims,
};

my $audit = {
    schema_version          => 1,
    seed_entry_count        => scalar(@{$seed->{entries}}),
    normalized_entry_count  => scalar(@claims),
    raw_reference_occurrences => scalar(@{$seed->{entries}})
        + scalar(map { @{$_->{nt_references}} } @{$seed->{entries}}),
    normalized_reference_occurrences => $reference_count,
    unique_raw_source_strings => scalar(keys %raw_source_occurrences),
    unique_corrected_source_strings => scalar(keys %source_occurrences),
    unique_normalized       => scalar(keys %normalized_occurrences),
    segmented_references    => $segment_count,
    cross_chapter_references => $cross_chapter_count,
    correction_count        => scalar(@corrections),
    error_count             => scalar(@errors),
    corrections             => \@corrections,
    errors                  => \@errors,
    segmented_reference_details => \@segment_details,
    cross_chapter_reference_details => \@cross_chapter_details,
    duplicate_references    => \@duplicate_references,
};

write_json($claims_path, $claims);
write_json($audit_path, $audit);

print "Normalized " . scalar(@claims) . " claims and $reference_count corrected references\n";
print "Corrections: " . scalar(@corrections) . "; errors: " . scalar(@errors) . "\n";

exit(@errors ? 1 : 0);
