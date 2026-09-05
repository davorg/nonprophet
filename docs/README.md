# Website

This is a theme-less Jekyll site deployed from `docs/` by GitHub Pages. The public
homepage remains the coming-soon page while claim drafts have `published: false`.

Build the public site:

```sh
jekyll build --source docs --destination /tmp/nonprophet-site
```

Build unpublished claim previews locally:

```sh
jekyll build --unpublished --source docs --destination /tmp/nonprophet-preview
```

Run the automated public/preview assertions with `scripts/check_site.sh` from the
repository root. Editorial JSON remains the durable source of truth; the pilot claim
Markdown currently proves the presentation model and will be generated from approved
records before content production is scaled.
