#!/usr/bin/env bash

set -euo pipefail

repo_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
claim_id=${1:-}
model=${2:-gpt-5.5}
mode=${3:-}

if [[ ! $claim_id =~ ^prophecy-[0-9]{3}$ ]]; then
  echo "Usage: $0 CLAIM_ID [MODEL] [--dry-run]" >&2
  exit 2
fi

date_utc=$(date -u +%F)
packet_rel="editorial/review-prompts/${claim_id}-adversarial-${date_utc}.md"
response_rel="editorial/reviews/${claim_id}-adversarial-${date_utc}-raw.md"
packet="$repo_dir/$packet_rel"
response="$repo_dir/$response_rel"

if [[ ! -f $packet ]]; then
  echo "Missing $packet_rel; generate it and select any extra context verses first." >&2
  exit 2
fi

prompt_bytes=$(wc -c < "$packet")
prompt_tokens=$(( (prompt_bytes + 3) / 4 ))
if [[ $mode == --dry-run ]]; then
  echo "Packet: $packet_rel"
  echo "Response: $response_rel"
  echo "Model: $model"
  echo "Prompt bytes: $prompt_bytes; estimated tokens: $prompt_tokens"
  exit 0
fi

review_workspace=$(mktemp -d)
review_log=$(mktemp)
cleanup() {
  rm -rf -- "$review_workspace"
  rm -f -- "$review_log"
}
trap cleanup EXIT

perl "$repo_dir/scripts/track_claim.pl" start "$claim_id" adversarial_review \
  model="$model" prompt_version=2

set +e
codex -a never exec --ephemeral -s read-only -m "$model" \
  --skip-git-repo-check -C "$review_workspace" -o "$response" - \
  < "$packet" 2>&1 | tee "$review_log"
review_status=${PIPESTATUS[0]}
set -e

if (( review_status != 0 )); then
  perl "$repo_dir/scripts/track_claim.pl" stop "$claim_id" adversarial_review \
    exclude=1 reason=review_failed
  exit "$review_status"
fi

reported_tokens=$(awk '/^tokens used$/ { getline; tokens=$1 } END { print tokens }' "$review_log")
response_bytes=$(wc -c < "$response")
metrics=(review_calls=1 review_prompt_bytes="$prompt_bytes"
  review_packet_estimated_tokens="$prompt_tokens" review_output_bytes="$response_bytes")
if [[ $reported_tokens =~ ^[0-9]+$ ]]; then
  metrics+=(review_tokens="$reported_tokens")
fi
perl "$repo_dir/scripts/track_claim.pl" stop "$claim_id" adversarial_review "${metrics[@]}"

echo "Saved exact response: $response_rel"
if [[ $reported_tokens =~ ^[0-9]+$ ]]; then
  echo "Reported review tokens: $reported_tokens"
else
  echo "The runtime did not report review tokens."
fi
