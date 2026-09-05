# Adversarial review prompt v1

Use this with a model different from the drafting model. Save the exact populated
prompt and raw response; record provider/model identity and date.

> Act as a rigorous but fair adversarial editor. Review this argument about an alleged
> Old Testament prophecy fulfilled by Jesus. Assume neither that Christian fulfilment
> claims are true nor that they must be naturalistically false.
>
> Identify: (1) any straw man; (2) logical gaps or overstatement; (3) omitted material
> evidence or strong counterarguments; (4) confusion among original meaning, reception
> and typology; (5) textual, translation, chronology or citation errors; and (6) unfair
> or inflammatory wording. State the strongest rebuttal to the proposed verdict. For
> each objection, say whether it could materially change the verdict and what evidence
> would resolve it. Do not invent citations or rewrite the article.
>
> [INSERT COMPLETE EDITORIAL RECORD AND CITED PASSAGES]

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
