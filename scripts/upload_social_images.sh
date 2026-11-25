#!/usr/bin/env bash

set -euo pipefail

repo_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
bucket=${NONPROPHET_SOCIAL_BUCKET:-social.nonprophet.app}
profile=${NONPROPHET_AWS_PROFILE:-nonprophet-social}

if ! command -v aws >/dev/null 2>&1; then
  echo "AWS CLI is unavailable; skipping social-image upload" >&2
  exit 0
fi

if ! aws configure get aws_access_key_id --profile "$profile" >/dev/null 2>&1; then
  echo "AWS profile '$profile' is unavailable; skipping social-image upload" >&2
  exit 0
fi

if (($# == 0)); then
  mapfile -t claim_ids < <(
    find "$repo_dir/social/rendered" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort
  )
else
  claim_ids=("$@")
fi

for claim_id in "${claim_ids[@]}"; do
  if [[ ! $claim_id =~ ^prophecy-[0-9]{3}$ ]]; then
    echo "Invalid claim ID: $claim_id" >&2
    exit 1
  fi

  source_dir="$repo_dir/social/rendered/$claim_id/"
  if [[ ! -d $source_dir ]]; then
    echo "Missing rendered images: $source_dir" >&2
    exit 1
  fi

  aws s3 sync \
    "$source_dir" \
    "s3://$bucket/rendered/$claim_id/" \
    --profile "$profile" \
    --only-show-errors
done

echo "Uploaded ${#claim_ids[@]} carousel sets to s3://$bucket/rendered/"
