# Production plan

## Strategy

Complete the research, drafting, adversarial review, and human escalation for the
entire 351-claim corpus before daily publication begins. Publication remains
claim-level and is drip-fed from a reviewed queue.

## Processing order

Work canonically by OT passage, researching related claims together while producing
an independent record for each claim. This avoids repeating contextual research and
keeps conclusions consistent without merging bite-size posts.

For each passage group:

1. normalize and verify all OT and NT references;
2. establish shared historical, literary, and textual context;
3. process each claim through the full editorial review protocol;
4. run the independent adversarial review using a different model;
5. resolve review findings and flag genuine deadlocks for human review;
6. prepare article copy and a four-slide social-media script;
7. mark the claim ready only when sources and quotations are verified.

Record stage timings and constrained-resource counts throughout this workflow using
the event ledger described in [METRICS.md](METRICS.md). Start the `total` timer before
research and stop it only after rendering and validation. Never substitute estimated
token counts for values actually reported by a runtime.

## Separation of content and presentation

Complete the durable editorial content first:

- claim and classification;
- OT text and context;
- strongest Christian case;
- critical assessment;
- sources and review record;
- website copy;
- four-slide carousel copy: scripture, claim, strongest case, and assessment.

## Display translation

Use the Berean Standard Bible (BSB) for displayed biblical text during the initial
release. Its text is dedicated to the public domain and may be reproduced across the
website and social assets without a cumulative quotation ceiling.

Label every quotation as BSB. Do not use its wording as proof of a disputed reading.
When a translation choice affects the alleged fulfilment, record and explain relevant
MT/LXX or manuscript evidence and show at least one academically oriented alternative.
The translation may be reconsidered if the project later obtains suitable permission
for the NASB, NRSVue, or another established edition.

Select and download Unsplash backgrounds during final production rather than early
research. Store creator, source URL, download date, and licence/attribution metadata
with each asset. This reduces the chance that stale image links block publication.

## Publication queue

The queue should contain only claims with status `ready_to_publish`. A separate
publication record should track:

- scheduled date;
- website publication status and URL;
- carousel asset paths;
- YouTube, TikTok, Instagram, and Bluesky publication identifiers;
- corrections or post-publication notes.

Editorial readiness and publication state must remain separate so scheduling changes
cannot accidentally alter reviewed content.

## Quality gates

A claim cannot enter the publication queue until:

- its strongest Christian case has a named source;
- its critical case has appropriate textual and scholarly support;
- a different model has completed adversarial review;
- every substantive review objection has a recorded disposition;
- all quotations and citations have been checked;
- no unresolved item is marked `human_review_required`.
