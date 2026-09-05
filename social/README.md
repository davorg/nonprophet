# Social assets

`carousels/` contains generated three-slide copy derived from the editorial records.
`backgrounds.json` records image provenance and licence metadata. Each claim under
`rendered/` contains two visual masters:

- `instagram/`: 1080×1350 (4:5), also suitable for Bluesky;
- `vertical/`: 1080×1920 (9:16), with a shared TikTok/YouTube safe area.

Regenerate copy and images from the repository root:

```sh
scripts/generate_publication_copy.pl
scripts/render_carousels.pl
```

The current pilot uses one Unsplash photograph consistently across a carousel set.
Attribution is included on every slide even though the Unsplash License does not
require it. Alt text remains in the carousel JSON for use when publishing.
