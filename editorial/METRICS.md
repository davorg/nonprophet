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

If a timer accidentally includes unrelated work, stop it with `exclude=1`. The raw
event remains auditable but is omitted from aggregates.

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
