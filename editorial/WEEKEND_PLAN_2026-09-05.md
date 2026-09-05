# Weekend project plan: 5–6 September 2026

Start: Saturday 5 September, 09:50 Europe/London

Working window: Saturday and Sunday

## Weekend objective

Build and prove the production system for the complete 351-claim project, then use
the remaining time to move as many claims as possible through it without lowering the
editorial standard.

The weekend succeeds if, by Sunday evening, we have:

1. a normalized, validated and reproducible corpus;
2. a durable machine-readable editorial schema;
3. licensed BSB text joined to every valid reference;
4. a repeatable research and two-model review workflow;
5. a working claim-page and carousel prototype generated from the same content;
6. a fully reviewed pilot batch that reveals the real cost per claim; and
7. a quantified backlog showing exactly what remains.

Completing 351 defensible scholarly audits in two days is not a credible target. The
priority is to eliminate future manual rework and then maximize reviewed throughput.

## Working principles

- Claim-level entries remain the publishing unit.
- Related claims are researched together by OT passage.
- The strongest recognizable Christian case is presented before criticism.
- Prediction, NT rereading, typology, genealogy and resemblance remain distinct.
- The BSB is the display translation, chosen for reuse rights rather than authority.
- Translation-sensitive claims are checked against source texts and academic editions.
- A different model challenges every completed critical argument.
- Model output never substitutes for checking texts, sources or citations.
- Only genuine policy or interpretive deadlocks are escalated for human review.
- Editorial content is stored independently from layout and publication state.

## Deliverables

### A. Corpus and data foundation

- Define a canonical book-name and reference grammar.
- Parse every OT and NT reference into structured components.
- Preserve source strings alongside normalized values.
- Validate book, chapter, verse, range and segment syntax.
- Detect duplicates, overlaps, malformed references and likely source errors.
- Group claims by shared OT passage without merging claim records.
- Add schema validation and a one-command corpus check.
- Add provenance and generated-at metadata where appropriate.

### B. Scripture text layer

- Obtain the official public-domain BSB data from a documented source.
- Pin the imported source/version rather than silently following future updates.
- Join OT display text and relevant NT text to normalized references.
- Preserve verse boundaries and footnote/textual-variant metadata when available.
- Verify a sample against the official BSB distribution.
- Record the BSB public-domain declaration and attribution.

### C. Editorial model

Create a machine-readable record capable of holding:

- seed claim and source provenance;
- precise claim formulation;
- controlled claim type;
- OT and NT references and text;
- shared passage context;
- strongest Christian case and named sources;
- critical assessment and named sources;
- translation/textual issues;
- calibrated verdict;
- adversarial-review prompt, output and objection dispositions;
- human-review flags;
- website and carousel copy;
- editorial and publication statuses.

Keep research notes and source quotations separate from concise publication copy.

### D. Research and review pipeline

- Create templates/checklists for initial research and adversarial review.
- Define source-quality tiers and citation requirements.
- Record model identity, date and prompt for every model-assisted stage.
- Run the complete process on an initial Genesis pilot.
- Measure time, source burden and recurring objections.
- Revise the protocol once after the pilot, then freeze schema changes for the rest
  of the weekend unless a serious defect is found.

### E. Publishing proof

- Generate one claim page from structured content.
- Generate a four-slide carousel from the same record.
- Ensure long/short copy is separated rather than truncated blindly.
- Include attribution, source links, accessibility text and responsive rendering.
- Produce one representative difficult claim, not merely the easiest visual example.

## Schedule

Times are checkpoints, not promises to stop productive work mid-task.

### Saturday morning: normalize and validate

**10:00–13:00**

- Design the reference and editorial schemas.
- Implement reference parsing and validation.
- Run the parser across all 351 claims.
- Produce an exception report and fix mechanical source inconsistencies.

**Checkpoint:** every source reference is either normalized or explicitly flagged;
no silent parse failures.

### Saturday afternoon: scripture and editorial pipeline

**13:00–17:00**

- Import and pin the BSB source data.
- Join verse text to normalized references.
- Implement schema validation and editorial templates.
- Create source-quality and verdict guidance.

**Checkpoint:** a clean checkout can rebuild and validate the corpus with documented
commands.

### Saturday evening: end-to-end pilot

**17:00–20:00**

- Fully process a small Genesis passage group.
- Construct the strongest Christian cases from named sources.
- Draft the critical analyses.
- Send completed arguments to a different model for adversarial review.
- Resolve review objections and record any genuine human questions.

**Checkpoint:** at least one difficult claim reaches `ready_to_publish`, with every
intermediate artefact retained.

### Sunday morning: product proof

**09:00–12:30**

- Generate the first real claim page from reviewed structured content.
- Build the reusable four-slide carousel template.
- Verify mobile layout, accessibility, citations and image attribution handling.
- Keep the current coming-soon page available until publication is intentional.

**Checkpoint:** one reviewed record produces both website and social outputs without
copy-and-paste divergence.

### Sunday afternoon: scale the audit

**12:30–17:30**

- Process claims canonically in shared-passage batches.
- Prioritize high-value methodological cases: prediction, NT quotation, NT typology,
  later typology, genealogy and translation-dependent claims.
- Run adversarial reviews as soon as coherent batches are ready.
- Track throughput and recurring failure modes.

**Target:** 10–20 claims fully reviewed, depending on source complexity.

**Stretch:** 25+ without weakening evidence or review quality.

### Sunday evening: stabilize and hand off

**17:30–20:00**

- Resolve outstanding mechanical defects.
- Run all validation and rendering checks.
- Summarize completed claims, unresolved questions and measured throughput.
- Update the backlog and give the remaining corpus a realistic completion estimate.
- Commit coherent work in separately reviewable units.

**Checkpoint:** the repository is reproducible, documented and safe to resume later.

## Priority order when time slips

1. Data integrity and reproducibility.
2. Editorial schema and source traceability.
3. A genuine end-to-end reviewed pilot.
4. More fully reviewed claims.
5. Generated website page.
6. Carousel renderer and visual refinement.

If necessary, reduce visual polish before reducing research or adversarial review.

## Human-review threshold

Interrupt the production run only for a decision that:

- changes the treatment of many claims;
- presents two comparably defensible editorial choices;
- risks a materially unfair representation;
- raises a rights or attribution problem; or
- cannot be resolved from the underlying text and credible sources.

Collect isolated difficult judgments into a review queue rather than asking one at a
time. Routine corrections proceed without escalation.

## Definition of done for one claim

A claim is `ready_to_publish` only when:

- references and BSB text validate;
- the claim is precisely stated and classified;
- the strongest Christian case has a named, checked source;
- the critical case has adequate textual and scholarly support;
- translation and textual issues are disclosed;
- another model has completed adversarial review;
- each substantive objection has a recorded disposition;
- website and carousel copy agree in substance;
- quotations, citations and links have been checked; and
- no unresolved human-review flag remains.

## Weekend progress report

At the end of Sunday, report:

- claims at each editorial status;
- references normalized, flagged and corrected;
- sources consulted and any access limitations;
- adversarial reviews completed and objections accepted/rejected;
- pages and carousel assets generated;
- automated checks passing;
- human decisions pending; and
- estimated effort to finish the remaining corpus.
