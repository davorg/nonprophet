#!/usr/bin/env bash

set -euo pipefail

repo_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
bucket=${NONPROPHET_SOCIAL_BUCKET:-social.nonprophet.app}
profile=${NONPROPHET_AWS_PROFILE:-nonprophet-social}
rendered_dir=${NONPROPHET_RENDERED_DIR:-$repo_dir/social/rendered}

if ! command -v aws >/dev/null 2>&1; then
  echo "AWS CLI is required to restore social images" >&2
  exit 1
fi

if ! aws configure get aws_access_key_id --profile "$profile" >/dev/null 2>&1; then
  echo "AWS profile '$profile' is unavailable" >&2
  exit 1
fi

if (($# == 0)); then
  mkdir -p "$rendered_dir"
  aws s3 sync \
    "s3://$bucket/rendered/" \
    "$rendered_dir/" \
    --profile "$profile" \
    --only-show-errors
  echo "Restored all carousel sets to $rendered_dir"
  exit 0
fi

for claim_id in "$@"; do
  if [[ ! $claim_id =~ ^prophecy-[0-9]{3}$ ]]; then
    echo "Invalid claim ID: $claim_id" >&2
    exit 1
  fi

  destination="$rendered_dir/$claim_id"
  mkdir -p "$destination"
  aws s3 sync \
    "s3://$bucket/rendered/$claim_id/" \
    "$destination/" \
    --profile "$profile" \
    --only-show-errors
done

echo "Restored $# carousel sets to $rendered_dir"
