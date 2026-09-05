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
my %formats = (
    instagram => {
        width => 1080, height => 1350, panel_x => 70, panel_y => 70,
        panel_w => 940, panel_h => 1210, text_x => 142, text_right => 938,
        label_y => 155, heading_y => 250, heading_size => 64,
        heading_spacing => 78, body_size => 42, body_spacing => 58,
        heading_limit => 26, body_limit => 40, footer_y => 1190,
        credit_y => 1233,
    },
    vertical => {
        width => 1080, height => 1920, panel_x => 70, panel_y => 170,
        panel_w => 940, panel_h => 1580, text_x => 142, text_right => 850,
        label_y => 280, heading_y => 400, heading_size => 68,
        heading_spacing => 84, body_size => 46, body_spacing => 64,
        heading_limit => 23, body_limit => 34, footer_y => 1600,
        credit_y => 1648,
    },
);

for my $manifest_path (@manifests) {
    my $manifest = read_json($manifest_path);
    my $id = $manifest->{claim_id};
    my ($claim_number) = $id =~ /([0-9]+)$/;
    for my $format_name (sort keys %formats) {
        my $format = $formats{$format_name};
        my $output_dir = "$root/social/rendered/$id/$format_name";
        make_path($output_dir);

        for my $index (0 .. $#{$manifest->{slides}}) {
            my $slide = $manifest->{slides}[$index];
            my @heading = wrap_text($slide->{heading}, $format->{heading_limit});
            my @body = wrap_text($slide->{body}, $format->{body_limit});
            die "$id $format_name slide " . ($index + 1) . " heading is too long\n" if @heading > 3;
            die "$id $format_name slide " . ($index + 1) . " body is too long\n" if @body > 9;
            my $divider_y = $format->{heading_y} + @heading * $format->{heading_spacing};
            my $body_y = $divider_y + 92;
            my $heading_svg = tspans(\@heading, $format->{text_x}, $format->{heading_y}, $format->{heading_spacing});
            my $body_svg = tspans(\@body, $format->{text_x}, $body_y, $format->{body_spacing});
            my $slide_number = $index + 1;
            my $credit = xml_escape("Photo: $background->{creator} / Unsplash");
            my $panel_right = $format->{panel_x} + $format->{panel_w};

            my ($svg_fh, $svg_path) = tempfile('nonprophet-carousel-XXXXXX', SUFFIX => '.svg', DIR => '/tmp', UNLINK => 1);
            binmode $svg_fh, ':encoding(UTF-8)';
            print {$svg_fh} qq{<svg xmlns="http://www.w3.org/2000/svg" width="$format->{width}" height="$format->{height}">
<rect x="$format->{panel_x}" y="$format->{panel_y}" width="$format->{panel_w}" height="$format->{panel_h}" rx="28" fill="#fffaf0" fill-opacity="0.93"/>
<rect x="$format->{panel_x}" y="$format->{panel_y}" width="12" height="$format->{panel_h}" rx="6" fill="#bd3e28"/>
<text x="$format->{text_x}" y="$format->{label_y}" fill="#bd3e28" font-family="Noto Sans" font-size="25" font-weight="700" letter-spacing="4">NON-PROPHET · CLAIM $claim_number</text>
<text fill="#061a2b" font-family="Noto Serif" font-size="$format->{heading_size}" font-weight="700">$heading_svg</text>
<line x1="$format->{text_x}" y1="$divider_y" x2="$format->{text_right}" y2="$divider_y" stroke="#061a2b" stroke-opacity="0.18" stroke-width="2"/>
<text fill="#243746" font-family="Noto Sans" font-size="$format->{body_size}" font-weight="450">$body_svg</text>
<text x="$format->{text_x}" y="$format->{footer_y}" fill="#061a2b" font-family="Noto Serif" font-size="34" font-weight="700">nonprophet.app</text>
<text x="$format->{text_right}" y="$format->{footer_y}" text-anchor="end" fill="#bd3e28" font-family="Noto Sans" font-size="28" font-weight="700">$slide_number / 3</text>
<text x="$format->{text_x}" y="$format->{credit_y}" fill="#66707a" font-family="Noto Sans" font-size="19">$credit</text>
</svg>};
            close $svg_fh;

            my $dimensions = "$format->{width}x$format->{height}";
            my $output = "$output_dir/slide-$slide_number.jpg";
            system(
                'magick', $background_path, '-resize', "$dimensions^", '-gravity', 'center',
                '-extent', $dimensions, '(', '-background', 'none', $svg_path, ')',
                '-composite', '-quality', '91', $output,
            ) == 0 or die "ImageMagick failed for $output\n";
        }
    }
}

print "Rendered " . scalar(@manifests) . " carousel sets\n";
