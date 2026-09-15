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

Seed-list wording: Not a bone of the Lamb to be broken
OT reference: Exodus 12:46
Exod.12.46: It must be eaten inside one house. You are not to take any of the meat outside the house, and you may not break any of the bones.
NT reference: John 19:31-36
John.19.31: It was the day of Preparation, and the next day was a High Sabbath. In order that the bodies would not remain on the cross during the Sabbath, the Jews asked Pilate to have the legs broken and the bodies removed.
John.19.32: So the soldiers came and broke the legs of the first man who had been crucified with Jesus, and those of the other.
John.19.33: But when they came to Jesus and saw that He was already dead, they did not break His legs.
John.19.34: Instead, one of the soldiers pierced His side with a spear, and immediately blood and water flowed out.
John.19.35: The one who saw it has testified to this, and his testimony is true. He knows that he is telling the truth, so that you also may believe.
John.19.36: Now these things happened so that the Scripture would be fulfilled: “Not one of His bones will be broken.”
  Note: Psalm 34:20; see also Exodus 12:46 and Numbers 9:12.

## Additional context selected by the drafting editor

Num.9.12: they may not leave any of it until morning or break any of its bones. They must observe the Passover according to all its statutes.
Ps.34.20: He protects all his bones; not one of them will be broken.
  Note: Cited in John 19:36

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "The rule that no Passover animal's bone be broken in Exodus 12:46 is fulfilled in Jesus when the soldiers leave his legs unbroken and John 19:36 cites Scripture.",
      "scope_notes" : "Acknowledge John's explicit fulfilment claim and the strong Passover reading, while testing the original rule's predictive specificity and the debated source of John's citation.",
      "type" : "nt_rereading"
   },
   "claim_id" : "prophecy-025",
   "context" : {
      "shared_context_id" : "exodus-12",
      "summary" : "Exodus 12:43–49 regulates who may eat Passover, requiring the meal to stay in one house and forbidding broken bones in the animal. Numbers 9:12 repeats the rule; Psalm 34:20 says a righteous sufferer's bones are protected. John 19:31–36 recounts other crucified men's legs broken but Jesus's left intact because he was already dead, then calls this fulfilment of Scripture."
   },
   "critical_case" : {
      "reasoning" : [
         "The original Exodus statement is a meal regulation, not a future-death oracle.",
         "Multiple OT passages overlap with John's quotation, although Passover is a strong source.",
         "John's assertion of fulfilment is evidence of his interpretation, not proof of an Exodus prediction."
      ],
      "source_ids" : [
         "src-driver-ex12",
         "src-grigsby-john19",
         "src-bsb-v59"
      ],
      "summary" : "In Exodus 12:46 the instruction addresses preparation and consumption of a Passover animal within one household; it does not predict how a future person will die. John applies it after narrating Jesus's death. The exact source of John's wording is debated: Numbers 9:12 repeats the Passover rule, while Psalm 34:20 speaks of a righteous person's protected bones. Bruce Grigsby surveys these options and favors a Passover source while noting the competition. That does not make John's typology arbitrary, but it prevents presenting Exodus 12:46 as an exclusive or originally predictive reference. The narrative establishes what John reports, not independent verification of the event."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "alt_text" : "Slide 1: The exact unbroken-bone correspondence.",
            "body" : "Exodus says no Passover animal's bone may be broken. John says soldiers left Jesus's legs unbroken and calls the event fulfilment of Scripture. The connection is specific and intentional.",
            "heading" : "John says ‘fulfilled’"
         },
         {
            "alt_text" : "Slide 2: The strongest Christian case is explicit typology.",
            "body" : "John's narration and Passover setting make the older rite a plausible pattern for Jesus. A named specialist identifies Exodus 12:46 and its parallel in Numbers 9:12 as backgrounds.",
            "heading" : "A strong Passover reading"
         },
         {
            "alt_text" : "Slide 3: The source and original meaning limit the prediction claim.",
            "body" : "Exodus gives a rule for preparing a meal, not a forecast of a crucifixion. Numbers repeats the rule, and Psalm 34 has similar words. John's reading is strong typology, but not a unique prior prediction.",
            "heading" : "But what did Exodus say?"
         }
      ],
      "scripture_excerpt" : "You are not to take any of the meat outside the house, and you may not break any of the bones.",
      "title" : "Not one bone broken",
      "website" : {
         "christian_case" : "Exodus bars breaking the Passover animal's bones. John says soldiers broke the legs of the other men but left Jesus's intact, then invokes Scripture's unbroken-bone wording. A specialist commentator reads Jesus as the Passover animal's antitype; the fit is concrete and intentional.",
         "critical_case" : "Exodus's rule concerns handling a Passover meal, not a forecast about a crucifixion. John's source could also be Numbers 9:12, which repeats the rule, or Psalm 34:20. Scholarly analysis favors a Passover background but acknowledges the competing texts. John's fulfilment language shows his interpretation of the event.",
         "description" : "John says Jesus's unbroken bones fulfil Scripture. Was Exodus 12:46 a prophecy?",
         "summary" : "John narrates Jesus's legs left unbroken and explicitly calls it fulfilment of Scripture.",
         "verdict" : "This is a strong Christian Passover reading made by John himself. Its source and original function do not establish Exodus 12:46 as a unique, prospective prediction of Jesus's unbroken legs.",
         "verdict_label" : "Explicit typology, not prior prediction"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-09-15",
         "author" : "Heinrich A. W. Meyer",
         "checked" : true,
         "id" : "src-meyer-john19",
         "locator" : "comment on John 19:36–37",
         "notes" : "Names Exodus 12:46 and Numbers 9:12 and explicitly treats Christ as the Passover animal's antitype.",
         "publisher" : "Bible Hub electronic edition",
         "stance" : "christian_case",
         "tier" : 2,
         "title" : "Meyer's NT Commentary on John 19",
         "type" : "commentary",
         "url" : "https://biblehub.com/commentaries/meyer/john/19.htm"
      },
      {
         "accessed" : "2026-09-15",
         "author" : "Bruce H. Grigsby",
         "checked" : true,
         "id" : "src-grigsby-john19",
         "locator" : "discussion and notes 75–79 on John 19:36",
         "notes" : "Surveys Passover/Psalm source debate and compares linguistic evidence of Numbers 9:12, Exodus 12:46, and Psalm 34:20.",
         "publisher" : "Journal for the Study of the New Testament 5 (1982)",
         "stance" : "critical_case",
         "tier" : 1,
         "title" : "The Cross as an Expiatory Sacrifice in the Fourth Gospel",
         "type" : "journal_article",
         "url" : "https://journals.sagepub.com/doi/10.1177/0142064X8200501505"
      },
      {
         "accessed" : "2026-09-15",
         "author" : "S. R. Driver",
         "checked" : true,
         "id" : "src-driver-ex12",
         "locator" : "note on Exodus 12:46",
         "notes" : "Explains the no-bone-breaking rule among three regulations for unity of the Passover meal company.",
         "publisher" : "Cambridge University Press; Bible Hub electronic edition",
         "stance" : "critical_case",
         "tier" : 2,
         "title" : "Cambridge Bible for Schools and Colleges: Exodus 12",
         "type" : "commentary",
         "url" : "https://biblehub.com/commentaries/cambridge/exodus/12.htm"
      },
      {
         "accessed" : "2026-09-15",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Exodus 12:43–49; Numbers 9:12; Psalm 34:20; John 19:31–36",
         "notes" : "Passages, John's fulfilment quotation, and BSB source footnote checked in local scripture store.",
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
         "The unbroken bones are a specific narrated event, not an abstract resemblance.",
         "John 19:36 overtly gives the event a scriptural fulfilment interpretation.",
         "A named specialist commentary relates it to the Passover regulations."
      ],
      "source_ids" : [
         "src-meyer-john19",
         "src-bsb-v59"
      ],
      "summary" : "The match is unusually concrete and John explicitly interprets it as Scripture's fulfilment. In John's narrative Jesus is already dead, so soldiers do not break his legs although they break the other men's; verse 36 quotes the unbroken-bone formula. Heinrich Meyer identifies the source with Exodus 12:46 and Numbers 9:12 and reads Jesus as the Passover animal's antitype. The Passover setting and Paul's independent Passover identification strengthen this canonical reading."
   },
   "textual_issues" : [
      {
         "issue" : "John 19:36's OT source cannot be assigned uniquely to Exodus 12:46; Numbers 9:12 repeats the Passover rule and Psalm 34:20 resembles the wording. Grigsby reviews linguistic evidence and favors the Passover passages over Psalm, while acknowledging scholarly disagreement.",
         "significance" : "material",
         "source_ids" : [
            "src-grigsby-john19",
            "src-bsb-v59"
         ]
      }
   ],
   "verdict" : {
      "category" : "plausible_typology_not_prediction",
      "confidence" : "medium",
      "summary" : "John's unbroken-bone interpretation is an explicit and plausible Passover typology, with Exodus 12:46 or Numbers 9:12 strong backgrounds. The original rule concerns an animal in a meal, not a predicted crucifixion; the precise citation source is debated. The Christian connection survives, but its status as a prior, unique prediction does not."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
