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

Seed-list wording: Stripped Him before the stares of men
OT reference: Psalms 22:17-18
Ps.22.17: I can count all my bones; they stare and gloat over me.
Ps.22.18: They divide my garments among them and cast lots for my clothing.
  Note: Cited in John 19:24; see also Matthew 27:35, Mark 15:24, and Luke 23:34
NT reference: Luke 23:34-35
Luke.23.34: Then Jesus said, “Father, forgive them, for they do not know what they are doing.” And they divided up His garments by casting lots.
  Note: Some manuscripts do not include Then Jesus said, “Father... what they are doing.”
  Note: See Psalm 22:18.
Luke.23.35: The people stood watching, and the rulers sneered at Him, saying, “He saved others; let Him save Himself if He is the Christ of God, the Chosen One.”
  Note: See Psalm 22:7.

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Psalm 22:17–18 predicted that Jesus would be stripped, watched and have His clothes divided by lot, fulfilled in Luke 23:34–35.",
      "scope_notes" : "Luke closely reproduces the garments, lots and watching; the question is whether this is prediction or literary application of a lament.",
      "type" : "narrative_reuse"
   },
   "claim_id" : "prophecy-085",
   "context" : {
      "shared_context_id" : "psalms-16-22",
      "summary" : "Psalm 22's humiliated sufferer is watched while enemies divide his clothes by lot. Luke places the same actions beside Jesus's crucifixion."
   },
   "critical_case" : {
      "reasoning" : [
         "The literary dependence is strong.",
         "Dependence does not establish independent predictive fulfilment.",
         "The psalm's original grammar describes present distress."
      ],
      "source_ids" : [
         "src-van-aarde-ps22",
         "src-lange-ps22",
         "src-bsb-v59"
      ],
      "summary" : "The close link shows that Gospel writers interpreted and narrated Jesus's death through Psalm 22. But the psalm is voiced as a current lament, not introduced as a future oracle, and familiarity with it could shape which details were preserved and emphasized."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "body" : "The psalm says enemies divide the sufferer’s clothes by lot. Luke describes soldiers doing exactly that to Jesus.",
            "heading" : "Did Psalm 22 predict the divided clothes?"
         },
         {
            "body" : "The clothes, the lots and the watching crowd appear together. John even calls the soldiers’ action fulfilled Scripture.",
            "heading" : "This is a very close match"
         },
         {
            "body" : "The Gospels use Psalm 22 to explain Jesus’s death. That does not prove the psalm began as a forecast of him.",
            "heading" : "The link is real—but what proves what?"
         }
      ],
      "scripture_excerpt" : "They divide my garments … and cast lots for my clothing.",
      "title" : "Clothes divided by lot",
      "website" : {
         "christian_case" : "The match is detailed: people watch, clothes are divided and lots are cast. John even says the soldiers' action fulfilled this scripture.",
         "critical_case" : "The Gospel connection is undeniable. The remaining question is direction: Psalm 22 is a lament about present suffering, and its familiar words helped Christians tell and interpret Jesus's death.",
         "description" : "Did Psalm 22 predict what happened to Jesus's clothes?",
         "summary" : "This is one of the closest links between Psalm 22 and the Gospel passion stories.",
         "verdict" : "The Gospels deliberately apply Psalm 22 to Jesus. That is strong literary reuse, but not independent proof of a centuries-ahead prediction.",
         "verdict_label" : "A later reading of the psalm"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-11-15",
         "author" : "Andries van Aarde",
         "checked" : true,
         "id" : "src-van-aarde-ps22",
         "locator" : "Psalm 22 shaping passion narration",
         "notes" : "Directly addresses the movement from original sense to passion reference.",
         "publisher" : "HTS Teologiese Studies",
         "stance" : "both",
         "tier" : 2,
         "title" : "Language, meaning, sense and reference: Matthew's passion narrative and Psalm 22",
         "type" : "journal_article",
         "url" : "https://hts.org.za/index.php/hts/article/view/2245/0"
      },
      {
         "accessed" : "2026-11-15",
         "author" : "Harvey D. Lange",
         "checked" : true,
         "id" : "src-lange-ps22",
         "locator" : "garments and lots correspondence",
         "notes" : "Treats this as one of the strongest correspondences.",
         "publisher" : "Concordia Theological Monthly",
         "stance" : "both",
         "tier" : 2,
         "title" : "The Relationship Between Psalm 22 and the Passion Narrative",
         "type" : "journal_article",
         "url" : "https://scholar.csl.edu/ctm/vol43/iss1/66/"
      },
      {
         "accessed" : "2026-11-15",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Psalm 22:17–18; Luke 23:34–35; John 19:24",
         "notes" : "Wording and Gospel cross-references checked locally.",
         "publisher" : "BSB Publishing",
         "stance" : "primary_text",
         "tier" : 1,
         "title" : "Berean Standard Bible v5.9",
         "type" : "biblical_text",
         "url" : "https://github.com/BSB-publishing/bsb2usfm/releases/tag/v5.9"
      }
   ],
   "status" : "draft",
   "strongest_case" : {
      "reasoning" : [
         "Several details appear in the same sequence.",
         "The garments and lots wording is distinctive.",
         "The tradition is early and multiply attested in the Gospels."
      ],
      "source_ids" : [
         "src-van-aarde-ps22",
         "src-lange-ps22",
         "src-bsb-v59"
      ],
      "summary" : "The cluster is unusually close: hostile onlookers, divided garments and casting lots occur together in both texts. All four Gospels preserve the clothing motif, and John explicitly calls it fulfilment of Scripture."
   },
   "textual_issues" : [],
   "verdict" : {
      "category" : "retrospective_rereading",
      "confidence" : "high",
      "summary" : "Luke's scene is a clear and close reuse of Psalm 22. It strongly supports Christian literary application of the psalm, but by itself cannot show that the lament was written as a forecast of Jesus."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
