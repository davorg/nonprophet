#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use FindBin;
use File::Path qw(make_path);
use File::Temp qw(tempfile);
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

sub xml_escape {
    my ($text) = @_;
    $text =~ s/&/&amp;/g;
    $text =~ s/</&lt;/g;
    $text =~ s/>/&gt;/g;
    $text =~ s/"/&quot;/g;
    return $text;
}

sub wrap_text {
    my ($text, $limit) = @_;
    my @words = split /\s+/, $text;
    my @lines;
    my $line = '';
    for my $word (@words) {
        if (length($line) && length($line) + 1 + length($word) > $limit) {
            push @lines, $line;
            $line = $word;
        } else {
            $line .= ($line ? ' ' : '') . $word;
        }
    }
    push @lines, $line if length $line;
    return @lines;
}

sub tspans {
    my ($lines, $x, $y, $spacing) = @_;
    return join '', map {
        my $line = xml_escape($lines->[$_]);
        qq{<tspan x="$x" y="} . ($y + $_ * $spacing) . qq{">$line</tspan>}
    } 0 .. $#$lines;
}

my $backgrounds = read_json("$root/social/backgrounds.json");
my $background = $backgrounds->{backgrounds}[0];
my $background_path = "$root/$background->{asset}";
die "Missing background $background_path\n" unless -f $background_path;

my @manifests = sort glob "$root/social/carousels/*.json";
for my $manifest_path (@manifests) {
    my $manifest = read_json($manifest_path);
    my $id = $manifest->{claim_id};
    my ($claim_number) = $id =~ /([0-9]+)$/;
    my $output_dir = "$root/social/rendered/$id";
    make_path($output_dir);

    for my $index (0 .. $#{$manifest->{slides}}) {
        my $slide = $manifest->{slides}[$index];
        my @heading = wrap_text($slide->{heading}, 26);
        my @body = wrap_text($slide->{body}, 40);
        die "$id slide " . ($index + 1) . " heading is too long\n" if @heading > 3;
        die "$id slide " . ($index + 1) . " body is too long\n" if @body > 9;
        my $divider_y = 250 + @heading * 78;
        my $body_y = $divider_y + 92;
        my $heading_svg = tspans(\@heading, 142, 250, 78);
        my $body_svg = tspans(\@body, 142, $body_y, 58);
        my $slide_number = $index + 1;
        my $credit = xml_escape("Photo: $background->{creator} / Unsplash");

        my ($svg_fh, $svg_path) = tempfile('nonprophet-carousel-XXXXXX', SUFFIX => '.svg', DIR => '/tmp', UNLINK => 1);
        binmode $svg_fh, ':encoding(UTF-8)';
        print {$svg_fh} qq{<svg xmlns="http://www.w3.org/2000/svg" width="1080" height="1350">
<rect x="70" y="70" width="940" height="1210" rx="28" fill="#fffaf0" fill-opacity="0.93"/>
<rect x="70" y="70" width="12" height="1210" rx="6" fill="#bd3e28"/>
<text x="142" y="155" fill="#bd3e28" font-family="Noto Sans" font-size="25" font-weight="700" letter-spacing="4">NON-PROPHET · CLAIM $claim_number</text>
<text fill="#061a2b" font-family="Noto Serif" font-size="64" font-weight="700">$heading_svg</text>
<line x1="142" y1="$divider_y" x2="938" y2="$divider_y" stroke="#061a2b" stroke-opacity="0.18" stroke-width="2"/>
<text fill="#243746" font-family="Noto Sans" font-size="42" font-weight="450">$body_svg</text>
<text x="142" y="1190" fill="#061a2b" font-family="Noto Serif" font-size="34" font-weight="700">nonprophet.app</text>
<text x="938" y="1190" text-anchor="end" fill="#bd3e28" font-family="Noto Sans" font-size="28" font-weight="700">$slide_number / 3</text>
<text x="142" y="1233" fill="#66707a" font-family="Noto Sans" font-size="19">$credit</text>
</svg>};
        close $svg_fh;

        my $output = "$output_dir/slide-$slide_number.jpg";
        system(
            'magick', $background_path, '-resize', '1080x1350^', '-gravity', 'center',
            '-extent', '1080x1350', '(', '-background', 'none', $svg_path, ')',
            '-composite', '-quality', '91', $output,
        ) == 0
            or die "ImageMagick failed for $output\n";
    }
}

print "Rendered " . scalar(@manifests) . " carousel sets\n";
