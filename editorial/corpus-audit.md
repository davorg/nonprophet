# Corpus-wide structural audit

Status: initial pass over the 351-row seed list.

## Findings

- 351 claim records map to 314 distinct OT reference strings.
- 22 OT references are used by more than one claim.
- The most fragmented passages are Isaiah 9:6 (8 claims), Genesis 49:10
  (5), Isaiah 49:6 (4), and Genesis 14:18, Isaiah 9:7, Psalm 72:17, and
  Psalm 110:1 (3 each).
- Only four summaries explicitly use words such as “illustrated,”
  “foreshadowed,” or “prefigures,” even though the Genesis audit alone finds
  numerous additional typological or analogical claims. Classification cannot
  therefore be reliably inferred from the source wording.
- The source uses non-normalized reference syntax (`1John`, `1Cor`, `2Sam`,
  verse suffixes such as `14a`). References need parsing into book, chapter,
  verse range, and optional segment before they are joined to Bible text.
- A cited NT parallel is not evidence that the NT author calls the OT text a
  prophecy. Explicit quotation, identifiable allusion, typological argument,
  genealogy, and thematic resemblance require separate fields.

## Proposed controlled claim types

- `prediction_explicitly_applied_in_nt`
- `prediction_later_applied_by_christians`
- `nt_christological_rereading`
- `nt_typology`
- `later_christian_typology`
- `genealogical_inference`
- `thematic_parallel`
- `translation_or_textual_argument`
- `unsupported_or_source_error`

These controlled categories are adopted under the decisions recorded in
[HARD_QUESTIONS.md](HARD_QUESTIONS.md).

## Next audit sequence

1. Normalize and validate every biblical reference without changing claim meaning.
2. Group claim records by canonical OT passage.
3. Identify whether each NT passage explicitly cites, clearly alludes to, or does
   not textually engage the claimed OT passage.
4. Flag claims dependent on the Septuagint, a textual variant, disputed translation,
   or disputed NT passage.
5. Research original context, strongest Christian case, and critical assessment for
   each grouped article.
6. Submit each completed argument to the independent adversarial review defined in
   [REVIEW_PROTOCOL.md](REVIEW_PROTOCOL.md), resolve its objections, and flag only
   genuine deadlocks for human review.
