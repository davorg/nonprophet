#!/usr/bin/env bash

set -euo pipefail

repo_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$repo_dir"

perl -c scripts/import_prophecies.pl
perl -c scripts/import_bsb.pl
perl -c scripts/normalize_references.pl
perl scripts/normalize_references.pl \
  data/prophecies.json \
  config/bible_books.json \
  data/scripture/bsb-v5.9.json \
  data/claims.json \
  data/reference-audit.json

ajv validate \
  --spec=draft2020 \
  --strict=true \
  -s schemas/scripture.schema.json \
  -d data/scripture/bsb-v5.9.json

ajv validate \
  --spec=draft2020 \
  --strict=true \
  -r schemas/reference.schema.json \
  -s schemas/claims.schema.json \
  -d data/claims.json

jq -e '
  .seed_entry_count == 351 and
  .normalized_entry_count == 351 and
  .raw_reference_occurrences == 792 and
  .normalized_reference_occurrences == 793 and
  .unique_raw_source_strings == 679 and
  .correction_count == 1 and
  .versification_omission_count == 2 and
  .error_count == 0
' data/reference-audit.json >/dev/null

echo "Corpus data checks passed"
