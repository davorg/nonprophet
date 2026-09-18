#!/usr/bin/env bash

set -euo pipefail

repo_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
site_check_dir=$(mktemp -d /tmp/nonprophet-site-check.XXXXXX)
trap 'rm -rf -- "$site_check_dir"' EXIT

perl "$repo_dir/scripts/generate_publication_copy.pl"
perl "$repo_dir/scripts/render_carousels.pl"

jekyll build --source "$repo_dir/docs" --destination "$site_check_dir/public"
test -f "$site_check_dir/public/index.html"
test -f "$site_check_dir/public/assets/css/site.css"
test -f "$site_check_dir/public/claims/prophecy-001/index.html"

mapfile -t verdict_categories < <(awk -F: '/^[a-z][a-z_]+:$/ { print $1 }' "$repo_dir/docs/_data/verdicts.yml")
for category in "${verdict_categories[@]}"; do
  verdict_slug=${category//_/-}
  test -f "$repo_dir/docs/verdicts/$verdict_slug.md"
  test -f "$site_check_dir/public/verdicts/$verdict_slug/index.html"
done

mapfile -t published_ids < <(jq -r '.entries[] | select(.state == "published") | .claim_id' "$repo_dir/data/publication.json")
mapfile -t withheld_ids < <(jq -r '.entries[] | select(.state == "withheld") | .claim_id' "$repo_dir/data/publication.json")
test "${#published_ids[@]}" -gt 0
for id in "${published_ids[@]}"; do
  test -f "$site_check_dir/public/claims/$id/index.html"
done
for id in "${withheld_ids[@]}"; do
  test ! -e "$site_check_dir/public/claims/$id/index.html"
done

jekyll build --unpublished \
  --source "$repo_dir/docs" \
  --destination "$site_check_dir/preview"
test -f "$site_check_dir/preview/claims/prophecy-001/index.html"
test -f "$site_check_dir/preview/claims/prophecy-002/index.html"
for id in "${withheld_ids[@]}"; do
  test -f "$site_check_dir/preview/claims/$id/index.html"
done

latest_published_id=${published_ids[${#published_ids[@]}-1]}
latest_published_number=$((10#${latest_published_id#prophecy-}))
rg -q "Claim $latest_published_number" "$site_check_dir/public/index.html"
rg -q 'https://nonprophet.app/assets/images/og-default.png' "$site_check_dir/public/index.html"
rg -q 'Claim 1' "$site_check_dir/public/claims/index.html"
for id in "${withheld_ids[@]}"; do
  withheld_number=$((10#${id#prophecy-}))
  ! rg -q "Claim $withheld_number([^0-9]|$)" "$site_check_dir/public/claims/index.html"
done
rg -q 'Why Christians see a prophecy' "$site_check_dir/preview/claims/prophecy-001/index.html"
rg -q 'Why it is less convincing' "$site_check_dir/preview/claims/prophecy-001/index.html"
rg -q 'The claimed New Testament fulfilment' "$site_check_dir/preview/claims/prophecy-001/index.html"
rg -q 'href="https://ebible.org/engbsb/GEN03.htm#V15"' "$site_check_dir/public/claims/prophecy-001/index.html"
rg -q 'href="https://ebible.org/engbsb/MAT01.htm#V18"' "$site_check_dir/public/claims/prophecy-001/index.html"
rg -q 'John 1:51' "$site_check_dir/public/claims/prophecy-014/index.html"
for carousel in "$repo_dir"/social/carousels/prophecy-*.json; do
  jq -e '(.slides | length == 5) and
    ([.slides[].type] == ["editorial", "scripture", "scripture", "editorial", "editorial"]) and
    (.slides[2].heading | startswith("Claimed fulfilment"))' "$carousel" >/dev/null
done
identify "$repo_dir"/social/rendered/prophecy-*/instagram/slide-*.jpg | \
  awk '$3 != "1080x1350" { exit 1 }'
identify "$repo_dir"/social/rendered/prophecy-*/vertical/slide-*.jpg | \
  awk '$3 != "1080x1920" { exit 1 }'

echo "Jekyll site checks passed"
