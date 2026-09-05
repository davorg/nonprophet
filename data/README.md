# Data pipeline

## Files

- `prophecies.json` is the minimally transformed 351-row source dataset.
- `claims.json` is generated from it with structured, normalized references.
- `reference-audit.json` records corrections, parse failures, repeated references,
  clause segments and cross-chapter ranges.
- `scripture/bsb-v5.9.json` is the pinned, normalized BSB verse-and-note store.
- `SOURCES.md` documents provenance and reuse considerations.
- `../config/bible_books.json` defines canonical book metadata and source
  abbreviations.
- `../schemas/` contains the machine-readable JSON Schemas.

Do not edit `claims.json` or `reference-audit.json` by hand. Change the seed data,
book configuration or normalizer and regenerate them.

## Rebuild and validate

From the repository root:

```sh
scripts/check_data.sh
```

The check:

1. verifies the Perl import and normalization scripts compile;
2. regenerates normalized claims and the reference audit;
3. validates the BSB store and `claims.json` against their JSON Schemas using `ajv`;
4. asserts expected corpus counts and zero unhandled reference errors.

Required local commands are Perl, `jq`, and the `ajv` CLI. The normalizer uses only
Perl core modules.

## Reference normalization result: 5 September 2026

- Seed claims: 351
- Raw reference occurrences: 792
- Raw distinct reference strings: 679
- Corrected reference occurrences: 793
- Parsed reference errors: 0
- Explicit source corrections: 1
- Clause-segment references requiring later text mapping: 87
- Cross-chapter ranges: 1

The correction affects `prophecy-301`. Its source value
`Rom 5:10 2 Cor 5:18-21` is parsed as two references: Romans 5:10 and
2 Corinthians 5:18–21. The original value remains unchanged in
`prophecies.json`; the correction and reason are recorded in
`reference-audit.json`.

Clause suffixes such as `Isa 53:8a` describe portions of verses in the source list,
not standard versification. They are preserved as segments and explicitly flagged
for mapping to the exact BSB clause during editorial review.

Chapter and verse boundary validation is performed against the pinned BSB corpus.
Two cited verses—Acts 28:29 and Mark 15:28—are absent from the BSB's critical-text
versification and are retained as explicit audit flags rather than treated as invalid
source references.
