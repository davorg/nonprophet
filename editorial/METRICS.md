# Production metrics

The production ledger measures real claim-processing runs so estimates for the full
351-claim corpus can be based on observed work rather than intuition.

## Recording a claim

Start a total timer and each stage as work begins:

```sh
perl scripts/track_claim.pl start prophecy-005 total batch=genesis-12
perl scripts/track_claim.pl start prophecy-005 research
```

Stop stages when they finish. Numeric resource fields are deliberately extensible:

```sh
perl scripts/track_claim.pl stop prophecy-005 research web_queries=4 sources_checked=6
perl scripts/track_claim.pl start prophecy-005 adversarial_review
perl scripts/track_claim.pl stop prophecy-005 adversarial_review review_tokens=28000 review_calls=1
perl scripts/track_claim.pl stop prophecy-005 total
perl scripts/track_claim.pl mark prophecy-005 checkpoint status=complete
```

Use the following stable stages: `total`, `research`, `drafting`,
`adversarial_review`, `review_resolution`, `publication_copy`, and
`rendering_validation`. `mark` records a point event or annotation without a timer.

The append-only JSON Lines ledger is `data/production-metrics.jsonl`. A start and stop
pair records an active-work interval; stages and `total` may have multiple pairs when
work is paused. Mark `checkpoint status=complete` only after the claim passes its
final validation. This preserves interruptions, excludes idle time from labour
estimates, and makes partially completed claims visible. Do not
invent unavailable measurements. In particular, record `review_tokens` when the
independent review runtime reports them; record `primary_tokens` only if the primary
runtime exposes an actual value.

For adversarial reviews, also record the generated packet size and its conservative
token approximation:

```sh
perl scripts/generate_review_packet.pl prophecy-007 --verse Ps.110.4
wc -c editorial/review-prompts/prophecy-007-adversarial-2026-09-05.md
perl scripts/track_claim.pl stop prophecy-007 adversarial_review \
  review_tokens=9000 review_prompt_bytes=18000 review_packet_estimated_tokens=4500
```

The exact generated prompt is committed under `editorial/review-prompts/`; the exact
model response goes under `editorial/reviews/`. Record both paths in the editorial
review object (`prompt_path` and `raw_output_path`). The reviewing model must use only
the packet. This makes before/after token comparisons meaningful.

After selecting and generating any extra context, use the bounded runner:

```sh
scripts/run_adversarial_review.sh prophecy-007 gpt-5.5 --dry-run
scripts/run_adversarial_review.sh prophecy-007 gpt-5.5
```

It runs the reviewer from an empty temporary workspace, saves the exact final
response, and records its timer, packet bytes, estimated input size, output bytes,
and runtime-reported total tokens. Do not start a separate `adversarial_review` timer
when using the runner.

If a timer accidentally includes unrelated work, stop it with `exclude=1`. The raw
event remains auditable but is omitted from aggregates.

If an enforced interruption leaves a timer open across a long idle period, exclude
that interval. When the active portion can be recovered from adjacent timestamped
events, record it explicitly rather than losing it from the total:

```sh
perl scripts/track_claim.pl mark prophecy-010 total recovered_seconds=551 \
  reason=runtime_limit_recovery
```

## Reporting

```sh
perl scripts/report_metrics.pl
perl scripts/report_metrics.pl --check
```

The report shows sample sizes, stage means, open timers, and projections over the
remaining corpus. Early figures are directional: shared-passage batching and claim
difficulty will make a small sample unrepresentative. Once several batches are
complete, compare medians and means and segment estimates by claim type or difficulty
before treating the projection as a schedule.
