# Editorial review protocol

Every published claim must pass both an initial analysis and an independent
adversarial review by a different language model.

The complete 351-claim corpus will pass this protocol before daily publication
begins. Claims are processed in OT-passage groups for research efficiency but remain
independent editorial and publishing units.

## 1. Define the claim

- Preserve the seed-list wording for provenance.
- Identify the precise proposition being asserted.
- Classify it as prediction, NT rereading, NT typology, later Christian typology,
  genealogy, thematic parallel, textual/translation argument, or source error.
- Keep each claim independently publishable even when it shares an OT passage with
  other claims.

## 2. Build the strongest Christian case

- Find a named, reputable Christian scholarly or apologetic source that advances the
  claim or its strongest recognisable form.
- Prefer serious exegesis over listicles and unsourced repetition.
- State the argument in terms its advocate would accept.
- Include relevant OT context, NT use, textual tradition, and theological method.
- Distinguish an argument for prediction from an argument for typological fulfilment.

If no credible advocate can be found for the inherited version, record that fact and
use the strongest documented version rather than inventing a defence.

## 3. Make the critical case

Assess separately:

- original historical and literary context;
- whether the OT passage is predictive;
- textual and translation issues, including MT/LXX differences;
- whether the cited NT passage quotes, alludes to, or merely resembles it;
- dependence between the alleged prediction and the narrative reporting fulfilment;
- specificity, falsifiability, and alternative explanations;
- whether the critique addresses prediction, typology, or both.

Use calibrated conclusions rather than forcing every entry into a binary verdict.

## 4. Independent adversarial review

Send the following material to a different language model:

- the exact claim;
- OT and NT passages under review;
- the strongest Christian case and its sources;
- the proposed critical argument and its sources;
- any relevant translation or textual notes;
- no preferred verdict beyond the fairness criteria below.

Ask the reviewing model to find:

1. any straw man or weaker-than-necessary formulation of the Christian case;
2. logical gaps, non sequiturs, or conclusions stronger than the evidence;
3. material evidence or scholarly counterarguments omitted from the critique;
4. confusion between original meaning, later reception, and theological typology;
5. misleading treatment of Hebrew, Greek, manuscripts, translations, or chronology;
6. factual or citation errors;
7. wording likely to be unfair, inflammatory, or needlessly dismissive;
8. the strongest possible rebuttal to the proposed critical conclusion.

The second model is a critic, not an authority. Its objections must be checked against
the underlying texts and sources before revisions are accepted.

## 5. Resolve and record

- Log every substantive objection from the adversarial review.
- Mark it `accepted`, `partly_accepted`, or `rejected`, with a short reason.
- Revise the argument where warranted.
- Escalate genuinely interpretive or policy-level deadlocks for human review.
- Publish only after citations and quotations have been checked against their sources.

## Suggested status fields

- `seeded`
- `claim_defined`
- `strong_case_complete`
- `critical_case_complete`
- `adversarial_review_complete`
- `human_review_required`
- `ready_to_publish`
