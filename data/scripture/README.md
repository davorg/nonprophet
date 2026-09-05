# Berean Standard Bible data

`bsb-v5.9.json` is a normalized verse-and-note store generated from the official BSB
Publishing `v5.9` USJ release dated 13 August 2026.

## Provenance

- Upstream: <https://github.com/BSB-publishing/bsb2usfm>
- Release: <https://github.com/BSB-publishing/bsb2usfm/releases/tag/v5.9>
- Asset: `BSB_usj.zip`
- Upstream SHA-256:
  `686d68bd3a42dde8682123dc4e66a495e7ae96d5d4fbe4bcf37e5e3df0abcc0c`
- Licence: [Public Domain](https://berean.bible/terms.htm)

The release metadata is pinned in `../../config/bsb_source.json`.

## Rebuild

```sh
scripts/fetch_bsb.sh /tmp/BSB_usj_v5.9.zip
perl scripts/import_bsb.pl \
  /tmp/BSB_usj_v5.9.zip \
  config/bible_books.json \
  config/bsb_source.json \
  data/scripture/bsb-v5.9.json
scripts/check_data.sh
```

The fetcher rejects an archive whose SHA-256 does not match the pinned release. The
importer requires all 66 configured books and exactly 31,086 verse records.

The BSB count differs from the traditional 31,102-verse count because its modern
critical NT text omits several verses retained in later manuscript traditions. The
claim audit flags references affected by those versification choices.

## Data shape

The store retains:

- normalized OSIS-like verse keys;
- display text without headings or cross-reference apparatus;
- the BSB's footnotes, including textual and translation alternatives;
- book-level verse counts; and
- source, release, checksum, licence and attribution metadata.

**Attribution:** The Holy Bible, Berean Standard Bible, BSB is produced in
cooperation with Bible Hub, Discovery Bible, OpenBible.com, and the Berean Bible
Translation Committee. This text of God's Word has been dedicated to the public
domain.
