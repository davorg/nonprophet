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

Seed-list wording: They parted His garments
OT reference: Psalms 22:18
Ps.22.18: They divide my garments among them and cast lots for my clothing.
  Note: Cited in John 19:24; see also Matthew 27:35, Mark 15:24, and Luke 23:34
NT reference: John 19:23-24
John.19.23: When the soldiers had crucified Jesus, they divided His garments into four parts, one for each soldier, with the tunic remaining. It was seamless, woven in one piece from top to bottom.
John.19.24: So they said to one another, “Let us not tear it. Instead, let us cast lots to see who will get it.” This was to fulfill the Scripture: “They divided My garments among them, and cast lots for My clothing.” So that is what the soldiers did.
  Note: Psalm 22:18

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Psalm 22:18 predicted that Jesus's garments would be divided and His clothing assigned by lot, fulfilled in John 19:23–24.",
      "scope_notes" : "John quotes the psalm almost verbatim and explicitly calls the soldiers' action fulfilment.",
      "type" : "explicit_fulfillment_claim"
   },
   "claim_id" : "prophecy-086",
   "context" : {
      "shared_context_id" : "psalms-16-22",
      "summary" : "Psalm 22's sufferer says enemies divide his clothes and cast lots for them. John narrates the soldiers dividing Jesus's garments and casting lots for his seamless tunic."
   },
   "critical_case" : {
      "reasoning" : [
         "Quotation establishes reception, not original predictive intent.",
         "The psalm is not introduced as a future oracle.",
         "Historical occurrence and narrative shaping can coexist."
      ],
      "source_ids" : [
         "src-van-aarde-ps22",
         "src-lange-ps22",
         "src-bsb-v59"
      ],
      "summary" : "The literary relationship is certain, but it does not independently establish advance prediction. Psalm 22 presents a sufferer's current humiliation, and John's knowledge of the verse may have shaped how the scene was selected, described or interpreted."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "body" : "The psalm says enemies divide the sufferer’s garments and cast lots. John describes soldiers doing both to Jesus.",
            "heading" : "Did Psalm 22 predict the divided clothes?"
         },
         {
            "body" : "He quotes Psalm 22 almost word for word and says the soldiers’ action fulfilled Scripture.",
            "heading" : "John makes the link explicit"
         },
         {
            "body" : "What remains unproved is advance prediction. John knew the psalm and deliberately used it to explain Jesus’s death.",
            "heading" : "The connection is certain"
         }
      ],
      "scripture_excerpt" : "They divide my garments … and cast lots for my clothing.",
      "title" : "They divided his clothes",
      "website" : {
         "christian_case" : "The match is exact and detailed: the soldiers both divide Jesus's garments and cast lots for his clothing. John says directly that this fulfilled Scripture.",
         "critical_case" : "There is no doubt that John applies the psalm to Jesus. But a later writer's explicit quotation does not by itself prove that the original lament was a future prediction.",
         "description" : "Did Psalm 22 predict the soldiers dividing Jesus's clothes?",
         "summary" : "John makes the connection explicit and quotes the psalm almost word for word.",
         "verdict" : "This is exceptionally strong literary fulfilment. It demonstrates John's interpretation, not independent advance knowledge.",
         "verdict_label" : "A later reading of the psalm"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-11-24",
         "author" : "Andries van Aarde",
         "checked" : true,
         "id" : "src-van-aarde-ps22",
         "locator" : "Psalm 22 and passion narration",
         "notes" : "Supports distinguishing the psalm's earlier sense from its later passion reference.",
         "publisher" : "HTS Teologiese Studies",
         "stance" : "both",
         "tier" : 2,
         "title" : "Language, meaning, sense and reference: Matthew's passion narrative and Psalm 22",
         "type" : "journal_article",
         "url" : "https://hts.org.za/index.php/hts/article/view/2245/0"
      },
      {
         "accessed" : "2026-11-24",
         "author" : "Harvey D. Lange",
         "checked" : true,
         "id" : "src-lange-ps22",
         "locator" : "garments and lots correspondence",
         "notes" : "Treats the garments passage as a major passion correspondence.",
         "publisher" : "Concordia Theological Monthly",
         "stance" : "both",
         "tier" : 2,
         "title" : "The Relationship Between Psalm 22 and the Passion Narrative",
         "type" : "journal_article",
         "url" : "https://scholar.csl.edu/ctm/vol43/iss1/66/"
      },
      {
         "accessed" : "2026-11-24",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Psalm 22:18; John 19:23–24",
         "notes" : "Quotation and fulfilment formula checked locally.",
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
         "John directly quotes Psalm 22:18.",
         "Both dividing garments and casting lots appear.",
         "John explicitly uses fulfilment language."
      ],
      "source_ids" : [
         "src-van-aarde-ps22",
         "src-lange-ps22",
         "src-bsb-v59"
      ],
      "summary" : "This is among the closest passion correspondences: John reproduces both halves of the verse, supplies a concrete reason for dividing and casting lots, and explicitly labels the action fulfilment of Scripture."
   },
   "textual_issues" : [],
   "verdict" : {
      "category" : "retrospective_rereading",
      "confidence" : "high",
      "summary" : "John deliberately and explicitly applies Psalm 22:18 to Jesus. That is unusually strong literary fulfilment, but the quotation alone cannot show that the original lament was written as a centuries-ahead forecast."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
