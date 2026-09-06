# Website

This is a theme-less Jekyll site deployed from `docs/` by GitHub Pages. Public
claims are featured on the homepage and can be browsed by number, Bible book, or
verdict.

Build the public site:

```sh
jekyll build --source docs --destination /tmp/nonprophet-site
```

Build unpublished claim previews locally:

```sh
jekyll build --unpublished --source docs --destination /tmp/nonprophet-preview
```

Run the automated public/preview assertions with `scripts/check_site.sh` from the
repository root. Editorial JSON remains the durable source of truth. Run
`scripts/generate_publication_copy.pl` to regenerate claim Markdown and carousel
scripts from every editorial record containing publication copy. Generated claim
files say so in their front matter and should not be edited directly.

A claim appears publicly only when its entry in `data/publication.json` has state
`published`. The site also generates `/feed.xml`, `/sitemap.xml`, and social
metadata using the default Open Graph image in `docs/assets/images/`.
