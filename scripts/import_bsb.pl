#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use Archive::Zip qw(:ERROR_CODES);
use JSON::PP;
use open qw(:std :encoding(UTF-8));

my ($archive_path, $books_path, $metadata_path, $output_path) = @ARGV;
die "Usage: $0 BSB_USJ_ZIP BOOKS_JSON METADATA_JSON OUTPUT_JSON\n"
    unless $archive_path && $books_path && $metadata_path && $output_path;

sub read_json_file {
    my ($path) = @_;
    open my $fh, '<:encoding(UTF-8)', $path or die "Cannot read $path: $!\n";
    local $/;
    my $value = JSON::PP->new->decode(<$fh>);
    close $fh or die "Cannot close $path: $!\n";
    return $value;
}

sub clean_text {
    my ($value) = @_;
    $value //= '';
    $value =~ s/\x{a0}/ /g;
    $value =~ s/\s+/ /g;
    $value =~ s/^\s+|\s+$//g;
    return $value;
}

my $book_data = read_json_file($books_path);
my $metadata = read_json_file($metadata_path);

my %usj_codes = (
    Gen => 'GEN', Exod => 'EXO', Lev => 'LEV', Num => 'NUM', Deut => 'DEU',
    Josh => 'JOS', Judg => 'JDG', Ruth => 'RUT', '1Sam' => '1SA', '2Sam' => '2SA',
    '1Kgs' => '1KI', '2Kgs' => '2KI', '1Chr' => '1CH', '2Chr' => '2CH',
    Ezra => 'EZR', Neh => 'NEH', Esth => 'EST', Job => 'JOB', Ps => 'PSA',
    Prov => 'PRO', Eccl => 'ECC', Song => 'SNG', Isa => 'ISA', Jer => 'JER',
    Lam => 'LAM', Ezek => 'EZK', Dan => 'DAN', Hos => 'HOS', Joel => 'JOL',
    Amos => 'AMO', Obad => 'OBA', Jonah => 'JON', Mic => 'MIC', Nah => 'NAM',
    Hab => 'HAB', Zeph => 'ZEP', Hag => 'HAG', Zech => 'ZEC', Mal => 'MAL',
    Matt => 'MAT', Mark => 'MRK', Luke => 'LUK', John => 'JHN', Acts => 'ACT',
    Rom => 'ROM', '1Cor' => '1CO', '2Cor' => '2CO', Gal => 'GAL', Eph => 'EPH',
    Phil => 'PHP', Col => 'COL', '1Thess' => '1TH', '2Thess' => '2TH',
    '1Tim' => '1TI', '2Tim' => '2TI', Titus => 'TIT', Phlm => 'PHM', Heb => 'HEB',
    Jas => 'JAS', '1Pet' => '1PE', '2Pet' => '2PE', '1John' => '1JN',
    '2John' => '2JN', '3John' => '3JN', Jude => 'JUD', Rev => 'REV',
);

die "USJ code map does not contain 66 books\n" unless keys(%usj_codes) == 66;

open my $archive_fh, '<:raw', $archive_path or die "Cannot read $archive_path: $!\n";
use Digest::SHA qw(sha256_hex);
local $/;
my $archive_bytes = <$archive_fh>;
close $archive_fh or die "Cannot close $archive_path: $!\n";
my $actual_sha = sha256_hex($archive_bytes);
die "Archive checksum mismatch: expected $metadata->{sha256}, got $actual_sha\n"
    unless $actual_sha eq $metadata->{sha256};

my $zip = Archive::Zip->new;
die "Cannot open ZIP archive $archive_path\n"
    unless $zip->read($archive_path) == AZ_OK;

my %verses;
my @books;
my $json = JSON::PP->new->utf8;

sub strings_in {
    my ($node) = @_;
    return $node unless ref $node;
    return '' unless ref($node) eq 'HASH' || ref($node) eq 'ARRAY';
    if (ref($node) eq 'ARRAY') {
        return join '', map { strings_in($_) } @$node;
    }
    return strings_in($node->{content} // []);
}

sub append_text {
    my ($state, $value) = @_;
    return unless defined $state->{current} && length $value;
    my $current = $state->{text}{$state->{current}};
    if (length($current)
        && $current !~ /\s$/
        && $value !~ /^\s/
        && $value !~ /^[,.;:!?…\)\]”’]/) {
        $state->{text}{$state->{current}} .= ' ';
    }
    $state->{text}{$state->{current}} .= $value;
}

sub process_content {
    my ($content, $state, $include_text) = @_;
    for my $item (@$content) {
        if (!ref $item) {
            append_text($state, $item) if $include_text;
            next;
        }
        next unless ref($item) eq 'HASH';

        my $type = $item->{type} // '';
        if ($type eq 'verse' && defined $item->{sid}) {
            my ($code, $chapter, $verse) =
                $item->{sid} =~ /^([A-Z0-9]{3}) (\d+):(\d+)$/;
            die "Invalid verse SID $item->{sid}\n" unless defined $code;
            die "Unexpected book code $code in $state->{code}\n"
                unless $code eq $state->{code};
            $state->{current} = "$state->{osis}.$chapter.$verse";
            die "Duplicate verse $state->{current}\n"
                if exists $state->{text}{$state->{current}};
            $state->{text}{$state->{current}} = '';
            $state->{notes}{$state->{current}} = [];
            next;
        }
        if ($type eq 'note') {
            if (defined $state->{current}) {
                my $note = clean_text(strings_in($item->{content} // []));
                $note =~ s/^\d+:\d+\s+//;
                push @{$state->{notes}{$state->{current}}}, $note if length $note;
            }
            next;
        }
        next if $type eq 'ref' || $type eq 'figure';
        process_content($item->{content}, $state, $include_text)
            if ref($item->{content}) eq 'ARRAY';
    }
}

for my $book (sort { $a->{order} <=> $b->{order} } @{$book_data->{books}}) {
    my $code = $usj_codes{$book->{osis}}
        or die "No USJ code for $book->{osis}\n";
    my $member = $zip->memberNamed("$code.usj")
        or die "Archive missing $code.usj\n";
    my $document = $json->decode($member->contents);

    my $state = {
        code    => $code,
        osis    => $book->{osis},
        current => undef,
        text    => {},
        notes   => {},
    };

    for my $item (@{$document->{content}}) {
        next unless ref($item) eq 'HASH';
        if (($item->{type} // '') eq 'chapter') {
            $state->{current} = undef;
            next;
        }
        next unless ($item->{type} // '') eq 'para';
        my $marker = $item->{marker} // '';
        my $is_heading = $marker =~ /^(?:h|toc\d*|mt\d*|ms\d*|s\d*|r|d|qa)$/;
        process_content($item->{content} // [], $state, !$is_heading);
    }

    my @book_keys = sort {
        my ($ac, $av) = $a =~ /\.(\d+)\.(\d+)$/;
        my ($bc, $bv) = $b =~ /\.(\d+)\.(\d+)$/;
        $ac <=> $bc || $av <=> $bv;
    } keys %{$state->{text}};

    for my $key (@book_keys) {
        my $text = clean_text($state->{text}{$key});
        die "Empty text for $key\n" unless length $text;
        $verses{$key} = {
            text  => $text,
            notes => $state->{notes}{$key},
        };
    }

    push @books, {
        osis        => $book->{osis},
        name        => $book->{name},
        testament   => $book->{testament},
        verse_count => scalar(@book_keys),
    };
}

die "Expected $metadata->{expected_verse_count} release verses, imported "
    . scalar(keys %verses) . "\n"
    unless keys(%verses) == $metadata->{expected_verse_count};

my $output = {
    schema_version => 1,
    translation    => $metadata->{translation},
    abbreviation   => $metadata->{abbreviation},
    release        => $metadata->{release},
    source_url     => $metadata->{download_url},
    source_sha256  => $metadata->{sha256},
    license        => $metadata->{license},
    license_url    => $metadata->{license_url},
    attribution    => $metadata->{attribution},
    verse_count    => scalar(keys %verses),
    books          => \@books,
    verses         => \%verses,
};

open my $output_fh, '>:encoding(UTF-8)', $output_path
    or die "Cannot write $output_path: $!\n";
print {$output_fh} JSON::PP->new->canonical->pretty->encode($output);
close $output_fh or die "Cannot close $output_path: $!\n";

print "Imported " . scalar(keys %verses) . " BSB verses to $output_path\n";
