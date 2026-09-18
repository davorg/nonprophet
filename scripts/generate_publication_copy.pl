#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use FindBin;
use File::Path qw(make_path);
use JSON::PP;
use open qw(:std :encoding(UTF-8));

my $root = "$FindBin::Bin/..";
my $json = JSON::PP->new->canonical;

sub read_json {
    my ($path) = @_;
    open my $fh, '<:encoding(UTF-8)', $path or die "Cannot read $path: $!\n";
    local $/;
    return $json->decode(<$fh>);
}

sub write_text {
    my ($path, $content) = @_;
    open my $fh, '>:encoding(UTF-8)', $path or die "Cannot write $path: $!\n";
    print {$fh} $content;
    close $fh or die "Cannot close $path: $!\n";
}

sub yaml_string { return $json->encode($_[0] // '') }

my $claims = read_json("$root/data/claims.json");
my %claims_by_id = map { $_->{id} => $_ } @{$claims->{entries}};
my $scripture = read_json("$root/data/scripture/bsb-v5.9.json");
my $nt_connections = read_json("$root/editorial/nt-connections.json");
my %nt_connections_by_id = map { $_->{claim_id} => $_ } @{$nt_connections->{entries}};
my $publication = read_json("$root/data/publication.json");
my %publication_by_id = map { $_->{claim_id} => $_ } @{$publication->{entries}};
my $social_copy = read_json("$root/social/plain-language.json");
my %social_by_id = map { $_->{claim_id} => $_ } @{$social_copy->{entries}};
my %book_names = (
    Gen => 'Genesis', Exod => 'Exodus', Lev => 'Leviticus', Num => 'Numbers',
    Deut => 'Deuteronomy', Josh => 'Joshua', Ruth => 'Ruth', '1Sam' => '1 Samuel',
    '2Sam' => '2 Samuel', '2Kgs' => '2 Kings', '1Chr' => '1 Chronicles',
    Job => 'Job', Ps => 'Psalms', Prov => 'Proverbs', Song => 'Song of Songs',
    Isa => 'Isaiah', Jer => 'Jeremiah', Ezek => 'Ezekiel', Dan => 'Daniel',
    Hos => 'Hosea', Joel => 'Joel', Jonah => 'Jonah', Mic => 'Micah',
    Hag => 'Haggai', Zech => 'Zechariah', Mal => 'Malachi',
);
my %ebible_codes = (
    Gen => 'GEN', Exod => 'EXO', Lev => 'LEV', Num => 'NUM', Deut => 'DEU',
    Josh => 'JOS', Ruth => 'RUT', '1Sam' => '1SA', '2Sam' => '2SA',
    '2Kgs' => '2KI', '1Chr' => '1CH', Job => 'JOB', Ps => 'PSA',
    Prov => 'PRO', Song => 'SNG', Isa => 'ISA', Jer => 'JER', Ezek => 'EZK',
    Dan => 'DAN', Hos => 'HOS', Joel => 'JOL', Jonah => 'JON', Mic => 'MIC',
    Hag => 'HAG', Zech => 'ZEC', Mal => 'MAL',
    Matt => 'MAT', Mark => 'MRK', Luke => 'LUK', John => 'JHN', Acts => 'ACT',
    Rom => 'ROM', '1Cor' => '1CO', '2Cor' => '2CO', Gal => 'GAL', Eph => 'EPH',
    Phil => 'PHP', Col => 'COL', '1Thess' => '1TH', '2Thess' => '2TH',
    '1Tim' => '1TI', '2Tim' => '2TI', Titus => 'TIT', Phlm => 'PHM',
    Heb => 'HEB', Jas => 'JAS', '1Pet' => '1PE', '2Pet' => '2PE',
    '1John' => '1JN', '2John' => '2JN', '3John' => '3JN', Jude => 'JUD', Rev => 'REV',
);
my %reference_abbreviations = (
    '1 Corinthians' => '1 Cor', '2 Corinthians' => '2 Cor',
    '1 Thessalonians' => '1 Thess', '2 Thessalonians' => '2 Thess',
    '1 Timothy' => '1 Tim', '2 Timothy' => '2 Tim',
    '1 Peter' => '1 Pet', '2 Peter' => '2 Pet',
    '1 John' => '1 Jn', '2 John' => '2 Jn', '3 John' => '3 Jn',
    Matthew => 'Matt', Mark => 'Mk', Luke => 'Lk', John => 'Jn',
    Romans => 'Rom', Galatians => 'Gal',
    Ephesians => 'Eph', Philippians => 'Phil', Colossians => 'Col',
    Hebrews => 'Heb', James => 'Jas', Revelation => 'Rev',
);

sub abbreviate_reference {
    my ($reference) = @_;
    for my $book (sort { length($b) <=> length($a) } keys %reference_abbreviations) {
        return $reference_abbreviations{$book} . substr($reference, length($book))
            if index($reference, $book) == 0;
    }
    return $reference;
}
my @record_paths = sort glob "$root/editorial/records/*.json";
make_path("$root/docs/_claims", "$root/social/carousels");

for my $record_path (@record_paths) {
    my $record = read_json($record_path);
    my $id = $record->{claim_id};
    my $claim = $claims_by_id{$id} or die "No canonical claim for $id\n";
    my $copy = $record->{publication_copy};
    next unless length($copy->{title} // '');
    my $social = $social_by_id{$id}
        or die "No plain-language social copy for $id\n";
    my $nt_connection = $nt_connections_by_id{$id}
        or die "No New Testament connection for $id\n";

    my @nt_display;
    for my $passage (@{$nt_connection->{passages}}) {
        my @verses = @{$passage->{verses}};
        my ($osis_book, $nt_chapter, $nt_verse) = $verses[0] =~ /^([^.]+)\.(\d+)\.(\d+)$/
            or die "$id has invalid NT verse $verses[0]\n";
        my $nt_ebible_code = $ebible_codes{$osis_book}
            // die "$id has no eBible code for $osis_book\n";
        my @texts = map {
            $scripture->{verses}{$_}{text} // die "$id references missing BSB verse $_\n"
        } @verses;
        push @nt_display, {
            reference => abbreviate_reference($passage->{reference}),
            url => sprintf('https://ebible.org/engbsb/%s%02d.htm#V%d', $nt_ebible_code, $nt_chapter, $nt_verse),
            text => join(' ', @texts),
            social => $passage->{social} ? JSON::PP::true : JSON::PP::false,
            social_text => $passage->{social_text},
        };
    }

    my $website = $copy->{website};
    my $number = 0 + ($id =~ /([0-9]+)$/)[0];
    my $publication_state = $publication_by_id{$id}{state} // 'withheld';
    my $publication_date = $publication_by_id{$id}{scheduled_date};
    my $published = $publication_state eq 'published' ? 'true' : 'false';
    my ($book_abbreviation) = $claim->{ot_passage}{source} =~ /^(\S+)/;
    my $book = $book_names{$book_abbreviation} // $book_abbreviation;
    my ($chapter, $verse) = $claim->{ot_passage}{source} =~ /\s(\d+):(\d+)/;
    my $ebible_code = $ebible_codes{$book_abbreviation} // die "No eBible code for $book_abbreviation\n";
    my $ot_text_url = sprintf 'https://ebible.org/engbsb/%s%02d.htm#V%d', $ebible_code, $chapter, $verse;
    my $ot_text = join ' ', map { $_->{text} } @{$claim->{ot_text}{verses}};
    my $ot_note = join ' ', map { @{$_->{notes}} } @{$claim->{ot_text}{verses}};
    my @frontmatter = (
        '---',
        '# Generated by scripts/generate_publication_copy.pl; edit the editorial record.',
        "published: $published",
        'title: ' . yaml_string($copy->{title}),
        'description: ' . yaml_string($website->{description}),
        'robots: ' . yaml_string($published eq 'true' ? 'index, follow' : 'noindex, nofollow'),
        "claim_number: $number",
        'editorial_status: ' . yaml_string($record->{status}),
        'publication_state: ' . yaml_string($publication_state),
        'publication_date: ' . yaml_string($publication_date),
        'book: ' . yaml_string($book),
        'verdict_category: ' . yaml_string($record->{verdict}{category}),
        'summary: ' . yaml_string($website->{summary}),
        'ot_reference: ' . yaml_string($claim->{ot_passage}{source}),
        'ot_text_url: ' . yaml_string($ot_text_url),
        'ot_text: ' . yaml_string($ot_text),
        'ot_note: ' . yaml_string($ot_note),
        'nt_explanation: ' . yaml_string($nt_connection->{explanation}),
        'nt_connections: ' . $json->encode(\@nt_display),
        'christian_case: ' . yaml_string($website->{christian_case}),
        'critical_case: ' . yaml_string($website->{critical_case}),
        'verdict_label: ' . yaml_string($website->{verdict_label}),
        'verdict: ' . yaml_string($website->{verdict}),
        '---', '',
    );

    my @source_lines;
    for my $source (@{$record->{sources}}) {
        next unless $source->{checked};
        my $label = $source->{title};
        $label = "[$label]($source->{url})" if $source->{url};
        my $author = length($source->{author}) ? "$source->{author}, " : '';
        push @source_lines, "- $author$label. $source->{publisher}; $source->{locator}.";
    }
    push @source_lines, '', 'Biblical quotations are from the Berean Standard Bible (BSB), public domain.', '';
    write_text("$root/docs/_claims/$id.md", join("\n", @frontmatter, @source_lines));

    my @editorial_slides;
    for my $index (0 .. $#{$social->{slides}}) {
        my $slide = $social->{slides}[$index];
        push @editorial_slides, {
            %$slide,
            type => 'editorial',
            alt_text => sprintf('Editorial slide: %s %s', $slide->{heading}, $slide->{body}),
        };
    }
    my ($social_nt) = grep { $_->{social} } @nt_display;
    die "$id requires one NT passage selected for social\n" unless $social_nt;
    my $social_nt_text = $social_nt->{social_text} // $social_nt->{text};
    my @slides = (
        $editorial_slides[0],
        {
            type => 'scripture',
            heading => $claim->{ot_passage}{source},
            body => $copy->{scripture_excerpt},
            alt_text => "The BSB text of $claim->{ot_passage}{source}: $copy->{scripture_excerpt}",
        },
        {
            type => 'scripture',
            heading => "Claimed fulfilment · $social_nt->{reference}",
            body => $social_nt_text,
            alt_text => "The claimed New Testament fulfilment in $social_nt->{reference}, BSB: $social_nt_text",
        },
        @editorial_slides[1, 2],
    );
    write_text("$root/social/carousels/$id.json", JSON::PP->new->canonical->pretty->encode({
        schema_version => 1,
        claim_id => $id,
        editorial_status => $record->{status},
        title => $copy->{title},
        source_url => "https://nonprophet.app/claims/$id/",
        verdict_category => $record->{verdict}{category},
        slides => \@slides,
    }));
}

print "Generated publication copy for " . scalar(@record_paths) . " editorial records\n";
