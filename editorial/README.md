# Editorial workspace

One JSON file per claim will live in `records/`, named with its claim ID. Start from
`templates/claim-record.json`; the canonical reference and BSB text remain in
`../data/claims.json` and are not duplicated here.

## Workflow

1. Define the precise claim, type and scope.
2. Write shared passage context where it can serve related claims.
3. Document the strongest recognizable Christian case and checked sources.
4. Make the critical case with appropriate scholarly support.
5. Record translation and textual issues separately.
6. Assign a calibrated verdict under `VERDICT_GUIDE.md`.
7. Run `ADVERSARIAL_REVIEW_PROMPT.md` through a different model.
8. Verify and dispose of every objection.
9. Draft long website copy and exactly three purpose-written carousel slides.
10. Mark ready only after all quality gates in `PRODUCTION_PLAN.md` pass.

`SOURCE_STANDARDS.md` defines source tiers and minimum evidence. The JSON Schema is
`../schemas/editorial-record.schema.json`; `../scripts/check_data.sh` validates the
template alongside the corpus.

## Important boundaries

- Source quotations and research notes are evidence, not publication copy.
- A BSB rendering is never proof of a disputed reading.
- A model response is an editorial artefact, never a source.
- Editorial status and future scheduling/publication status remain separate.
- Empty fields are permitted only so work-in-progress records remain machine-readable;
  advancing a status asserts that the corresponding quality gate has been met.
