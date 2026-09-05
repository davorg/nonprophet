#!/usr/bin/env bash

set -euo pipefail

repo_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
site_check_dir=$(mktemp -d /tmp/nonprophet-site-check.XXXXXX)
trap 'rm -rf -- "$site_check_dir"' EXIT

jekyll build --source "$repo_dir/docs" --destination "$site_check_dir/public"
test -f "$site_check_dir/public/index.html"
test -f "$site_check_dir/public/assets/css/site.css"
test ! -e "$site_check_dir/public/claims/prophecy-001/index.html"

jekyll build --unpublished \
  --source "$repo_dir/docs" \
  --destination "$site_check_dir/preview"
test -f "$site_check_dir/preview/claims/prophecy-001/index.html"

rg -q '<h1 id="page-title">Non-Prophet</h1>' "$site_check_dir/public/index.html"
rg -q 'Why Christians see a prophecy' "$site_check_dir/preview/claims/prophecy-001/index.html"
rg -q 'Why it is less convincing' "$site_check_dir/preview/claims/prophecy-001/index.html"

echo "Jekyll site checks passed"
