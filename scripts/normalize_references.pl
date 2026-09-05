#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use JSON::PP;
use open qw(:std :encoding(UTF-8));

my ($seed_path, $books_path, $scripture_path, $claims_path, $audit_path) = @ARGV;
die "Usage: $0 SEED_JSON BOOKS_JSON SCRIPTURE_JSON CLAIMS_JSON AUDIT_JSON\n"
    unless $seed_path && $books_path && $scripture_path && $claims_path && $audit_path;

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
my $scripture = read_json($scripture_path);
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
my @versification_omissions;
my %cited_verses;
my $cited_verse_occurrences = 0;

my %chapter_verses;
for my $osis (keys %{$scripture->{verses}}) {
    my ($book, $chapter, $verse) = $osis =~ /^([1-3]?[A-Za-z]+)\.(\d+)\.(\d+)$/;
    die "Invalid scripture verse key $osis\n" unless defined $book;
    $chapter_verses{$book}{$chapter}{$verse} = 1;
}

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

sub scripture_for_reference {
    my ($reference, $claim_id, $field) = @_;
    return unless $reference;

    my $book = $reference->{book_osis};
    my $start = $reference->{start};
    my $end = $reference->{end};
    my @selected;

    for my $chapter ($start->{chapter} .. $end->{chapter}) {
        my @available = sort { $a <=> $b } keys %{$chapter_verses{$book}{$chapter} // {}};
        unless (@available) {
            push @errors, {
                claim_id => $claim_id,
                field    => $field,
                source   => $reference->{source},
                error    => 'missing_scripture_chapter',
                chapter  => $chapter,
            };
            next;
        }

        my $first = $chapter == $start->{chapter} ? $start->{verse} : $available[0];
        my $last = $chapter == $end->{chapter} ? $end->{verse} : $available[-1];

        for my $verse ($first .. $last) {
            my $osis = "$book.$chapter.$verse";
            unless (exists $scripture->{verses}{$osis}) {
                push @versification_omissions, {
                    claim_id => $claim_id,
                    field    => $field,
                    source   => $reference->{source},
                    osis     => $osis,
                };
                next;
            }
            my $record = $scripture->{verses}{$osis};
            push @selected, {
                osis   => $osis,
                number => $verse,
                text   => $record->{text},
                notes  => $record->{notes},
            };
            $cited_verses{$osis}++;
            $cited_verse_occurrences++;
        }
    }

    my $start_osis = "$book.$start->{chapter}.$start->{verse}";
    my $end_osis = "$book.$end->{chapter}.$end->{verse}";
    for my $endpoint ([$start_osis, 'start'], [$end_osis, 'end']) {
        unless (exists $scripture->{verses}{$endpoint->[0]}) {
            my ($endpoint_book, $endpoint_chapter, $endpoint_verse) =
                $endpoint->[0] =~ /^([1-3]?[A-Za-z]+)\.(\d+)\.(\d+)$/;
            my @chapter = sort { $a <=> $b }
                keys %{$chapter_verses{$endpoint_book}{$endpoint_chapter} // {}};
            if (!@chapter || $endpoint_verse < $chapter[0]
                || $endpoint_verse > $chapter[-1]) {
                push @errors, {
                    claim_id => $claim_id,
                    field    => $field,
                    source   => $reference->{source},
                    error    => 'scripture_endpoint_out_of_bounds',
                    endpoint => $endpoint->[1],
                    osis     => $endpoint->[0],
                };
            }
        }
    }

    return {
        translation => $scripture->{abbreviation},
        release     => $scripture->{release},
        selection   => ($start->{segment} || $end->{segment})
            ? 'full_verse_pending_segment_mapping'
            : 'complete_reference',
        verses      => \@selected,
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
    my $ot_text = scripture_for_reference($ot, $entry->{id}, 'ot_reference');
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
    my @nt_texts;
    for my $source (@nt_sources) {
        my $parsed = parse_reference($source, 'NT', $entry->{id}, 'nt_references');
        if ($parsed) {
            push @nt, $parsed;
            push @nt_texts, scripture_for_reference(
                $parsed, $entry->{id}, 'nt_references'
            );
        }
    }

    push @claims, {
        id            => $entry->{id},
        source_id     => $entry->{source_id},
        seed_claim    => $entry->{claim_summary},
        review_status => $entry->{review_status},
        ot_passage    => $ot,
        ot_text       => $ot_text,
        nt_passages   => \@nt,
        nt_texts      => \@nt_texts,
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
    cited_verse_occurrences => $cited_verse_occurrences,
    unique_cited_verses => scalar(keys %cited_verses),
    versification_omission_count => scalar(@versification_omissions),
    versification_omissions => \@versification_omissions,
    duplicate_references    => \@duplicate_references,
};

write_json($claims_path, $claims);
write_json($audit_path, $audit);

print "Normalized " . scalar(@claims) . " claims and $reference_count corrected references\n";
print "Corrections: " . scalar(@corrections) . "; errors: " . scalar(@errors) . "\n";

exit(@errors ? 1 : 0);
