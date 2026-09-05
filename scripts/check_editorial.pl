#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use FindBin;
use JSON::PP;
use open qw(:std :encoding(UTF-8));

my $root = "$FindBin::Bin/..";
my $json = JSON::PP->new;

sub read_json {
    my ($path) = @_;
    open my $fh, '<:encoding(UTF-8)', $path or die "Cannot read $path: $!\n";
    local $/;
    return $json->decode(<$fh>);
}

my $claims = read_json("$root/data/claims.json");
my %claim_ids = map { $_->{id} => 1 } @{$claims->{entries}};
my $publication = read_json("$root/data/publication.json");
my %publication_ids;
my %editorial_status;
my @errors;
my $records = 0;

for my $path (sort glob "$root/editorial/records/*.json") {
    my $record = read_json($path);
    my $id = $record->{claim_id};
    $editorial_status{$id} = $record->{status};
    $records++;
    push @errors, "$id: unknown canonical claim" unless $claim_ids{$id};

    my %source_ids;
    for my $source (@{$record->{sources}}) {
        push @errors, "$id: duplicate source ID $source->{id}" if $source_ids{$source->{id}}++;
    }
    for my $section (qw(strongest_case critical_case)) {
        for my $source_id (@{$record->{$section}{source_ids}}) {
            push @errors, "$id: $section references missing $source_id" unless $source_ids{$source_id};
        }
    }
    for my $issue (@{$record->{textual_issues}}) {
        for my $source_id (@{$issue->{source_ids}}) {
            push @errors, "$id: textual issue references missing $source_id" unless $source_ids{$source_id};
        }
    }

    if ($record->{status} =~ /^(?:adversarial_review_complete|ready_to_publish)$/) {
        my @model_reviews = grep { $_->{reviewer} eq 'adversarial_llm' } @{$record->{reviews}};
        push @errors, "$id: status requires adversarial review" unless @model_reviews;
        for my $review (@model_reviews) {
            if (($review->{prompt_version} // '') =~ /^([2-9]|[1-9][0-9]+)$/) {
                for my $field (qw(prompt_path raw_output_path)) {
                    my $relative = $review->{$field} // '';
                    push @errors, "$id: prompt v2+ review requires $field"
                        unless length $relative;
                    push @errors, "$id: unsafe $field"
                        if $relative =~ m{(?:^/|(?:^|/)\.\.(?:/|$))};
                    push @errors, "$id: missing $field $relative"
                        if length($relative) && !-f "$root/$relative";
                }
            }
            for my $objection (@{$review->{objections}}) {
                push @errors, "$id: unresolved review objection" if $objection->{disposition} eq 'pending';
            }
        }
    }

    my $copy = $record->{publication_copy};
    if (length($copy->{title} // '')) {
        push @errors, "$id: publication copy must have exactly three editorial slides" unless @{$copy->{carousel}} == 3;
        push @errors, "$id: publication copy requires a scripture excerpt" unless length($copy->{scripture_excerpt} // '');
        for my $field (qw(description summary christian_case critical_case verdict_label verdict)) {
            push @errors, "$id: website copy missing $field" unless length($copy->{website}{$field} // '');
        }
        for my $index (0 .. $#{$copy->{carousel}}) {
            my $slide = $copy->{carousel}[$index];
            my $words = () = ($slide->{body} // '') =~ /\S+/g;
            push @errors, "$id: slide " . ($index + 1) . " exceeds 90 words" if $words > 90;
        }
    }

    if ($record->{status} eq 'ready_to_publish') {
        push @errors, "$id: ready record requires publication copy" unless length($copy->{title} // '');
        push @errors, "$id: ready record still requires human review" if $record->{human_review}{required};
        push @errors, "$id: ready record has unchecked sources" if grep { !$_->{checked} } @{$record->{sources}};
    }
}

for my $entry (@{$publication->{entries}}) {
    my $id = $entry->{claim_id};
    push @errors, "$id: duplicate publication entry" if $publication_ids{$id}++;
    push @errors, "$id: publication entry has no editorial record" unless $editorial_status{$id};
    if ($entry->{state} eq 'published') {
        push @errors, "$id: published before editorial readiness"
            unless ($editorial_status{$id} // '') eq 'ready_to_publish';
        push @errors, "$id: published without URL" unless length($entry->{published_url} // '');
    }
    if ($entry->{state} eq 'scheduled') {
        push @errors, "$id: scheduled before editorial readiness"
            unless ($editorial_status{$id} // '') eq 'ready_to_publish';
        push @errors, "$id: scheduled without date" unless length($entry->{scheduled_date} // '');
    }
}

die join("\n", @errors) . "\n" if @errors;
print "Editorial checks passed for $records records\n";
