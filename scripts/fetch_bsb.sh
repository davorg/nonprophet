#!/usr/bin/env bash

set -euo pipefail

repo_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
metadata="$repo_dir/config/bsb_source.json"
destination=${1:-/tmp/BSB_usj_v5.9.zip}

url=$(jq -er '.download_url' "$metadata")
expected=$(jq -er '.sha256' "$metadata")

curl -L --max-time 60 --compressed -sS "$url" -o "$destination"

actual=$(sha256sum "$destination" | awk '{print $1}')
if [[ "$actual" != "$expected" ]]; then
  echo "BSB archive checksum mismatch" >&2
  echo "expected: $expected" >&2
  echo "actual:   $actual" >&2
  exit 1
fi

echo "Downloaded and verified $destination"
