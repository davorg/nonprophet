# Adversarial review prompt v2

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
> Work only from the review packet below. Do not browse, open repository files, or
> use tools. If evidence needed for a judgment is absent, identify the omission
> rather than searching for it. This boundary is part of the review design: it makes
> resource use measurable and prevents unrelated corpus material influencing the
> review.
>
> ## Canonical claim and cited text

Seed-list wording: Not a bone of Him broken
OT reference: Numbers 9:12
Num.9.12: they may not leave any of it until morning or break any of its bones. They must observe the Passover according to all its statutes.
NT reference: John 19:31-36
John.19.31: It was the day of Preparation, and the next day was a High Sabbath. In order that the bodies would not remain on the cross during the Sabbath, the Jews asked Pilate to have the legs broken and the bodies removed.
John.19.32: So the soldiers came and broke the legs of the first man who had been crucified with Jesus, and those of the other.
John.19.33: But when they came to Jesus and saw that He was already dead, they did not break His legs.
John.19.34: Instead, one of the soldiers pierced His side with a spear, and immediately blood and water flowed out.
John.19.35: The one who saw it has testified to this, and his testimony is true. He knows that he is telling the truth, so that you also may believe.
John.19.36: Now these things happened so that the Scripture would be fulfilled: “Not one of His bones will be broken.”
  Note: Psalm 34:20; see also Exodus 12:46 and Numbers 9:12.

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Numbers 9:12's rule that no Passover animal bone be broken predicted Jesus's unbroken bones at the crucifixion, which John 19:36 calls a fulfilment of Scripture.",
      "scope_notes" : "This substantially duplicates claim 025, which audits Exodus 12:46. John may invoke either Passover rule, Psalm 34:20, or a deliberate combination.",
      "type" : "nt_typology"
   },
   "claim_id" : "prophecy-037",
   "context" : {
      "shared_context_id" : "leviticus-23-numbers-9-24-deuteronomy-18",
      "summary" : "Numbers regulates a second Passover for people unable to observe the first and repeats the rule against breaking the animal's bones. John reports that soldiers did not break Jesus's legs and presents this as fulfilment of Scripture. The wording also resembles Exodus 12:46 and Psalm 34:20."
   },
   "critical_case" : {
      "reasoning" : [
         "The original rule concerns meal preparation.",
         "Exodus 12:46 and Psalm 34:20 compete or combine as sources.",
         "John's narration and interpretation are not independent evidence."
      ],
      "source_ids" : [
         "src-john19-commentary",
         "src-bsb-v59"
      ],
      "summary" : "Numbers gives instructions for preparing an animal at a recurring meal; it does not describe a future execution. John's wording has multiple plausible sources, so Numbers 9:12 cannot be isolated with certainty. The narrative also supplies the event that creates the match, meaning John's fulfilment claim establishes his theology rather than independent predictive confirmation. This remains strong explicit typology, not a standalone forecast from Numbers."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "alt_text" : "Slide 1: The close Passover correspondence.",
            "body" : "Numbers says a Passover animal’s bones must remain unbroken. John says soldiers left Jesus’s legs intact and calls it fulfilment.",
            "heading" : "Jesus’s bones were not broken"
         },
         {
            "alt_text" : "Slide 2: The explicit New Testament case.",
            "body" : "The detail is unusually exact. John presents Jesus as a Passover sacrifice whose bones remain unbroken.",
            "heading" : "John makes the connection"
         },
         {
            "alt_text" : "Slide 3: Ritual typology is distinguished from prediction.",
            "body" : "Numbers tells people how to prepare a Passover animal. It does not predict an execution. John gives the old rule a new Christian meaning.",
            "heading" : "But Numbers gives a meal rule"
         }
      ],
      "scripture_excerpt" : "they may not leave any of it until morning or break any of its bones.",
      "title" : "Not one bone broken",
      "website" : {
         "christian_case" : "John highlights that soldiers broke the other men's legs but left Jesus's intact, then calls it fulfilment. The exact Passover wording supports John's wider presentation of Jesus as a Passover sacrifice.",
         "critical_case" : "Numbers tells worshippers how to prepare an animal for a recurring meal. It does not predict a future execution. John may also be drawing on Exodus or a Psalm, and his Gospel both reports the event and supplies its meaning.",
         "description" : "Did a Passover rule predict Jesus's unbroken bones?",
         "summary" : "John calls Jesus's unbroken bones fulfilment of Scripture; Numbers gives the same rule for Passover animals.",
         "verdict" : "John's Passover interpretation is clear and unusually precise. Numbers itself remains a ritual rule rather than an advance prediction.",
         "verdict_label" : "Explicit typology, not forecast"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-09-26",
         "author" : "Various historic commentators",
         "checked" : true,
         "id" : "src-john19-commentary",
         "locator" : "discussion of Exodus 12:46, Numbers 9:12 and Psalm 34:20",
         "notes" : "Documents both the Passover interpretation and uncertainty over the exact source.",
         "publisher" : "Bible Hub",
         "stance" : "both",
         "tier" : 2,
         "title" : "Commentaries on John 19:36",
         "type" : "commentary",
         "url" : "https://biblehub.com/commentaries/john/19-36.htm"
      },
      {
         "accessed" : "2026-09-26",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Numbers 9:1–14; Exodus 12:46; Psalm 34:20; John 19:31–36",
         "notes" : "Exact wording and parallel sources checked locally.",
         "publisher" : "BSB Publishing",
         "stance" : "primary_text",
         "tier" : 1,
         "title" : "Berean Standard Bible v5.9",
         "type" : "biblical_text",
         "url" : "https://github.com/BSB-publishing/bsb2usfm/releases/tag/v5.9"
      }
   ],
   "status" : "critical_case_complete",
   "strongest_case" : {
      "reasoning" : [
         "John draws attention to the unusual decision not to break Jesus's legs.",
         "He immediately invokes Scripture.",
         "Two Torah Passover rules contain the same distinctive prohibition."
      ],
      "source_ids" : [
         "src-john19-commentary",
         "src-bsb-v59"
      ],
      "summary" : "The physical match is precise and John explicitly labels it fulfilment. John's Passover-shaped passion narrative and Paul's identification of Christ as Passover support reading Jesus as the true Passover victim whose bones remain intact."
   },
   "textual_issues" : [
      {
         "issue" : "John 19:36 does not name its source; Exodus 12:46, Numbers 9:12 and Psalm 34:20 all contribute similar wording.",
         "significance" : "material",
         "source_ids" : [
            "src-john19-commentary",
            "src-bsb-v59"
         ]
      }
   ],
   "verdict" : {
      "category" : "plausible_typology_not_prediction",
      "confidence" : "high",
      "summary" : "John explicitly interprets Jesus's unbroken bones through Scripture and likely Passover. Numbers supplies a close ritual pattern, but its meal rule does not independently predict a crucifixion detail."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
