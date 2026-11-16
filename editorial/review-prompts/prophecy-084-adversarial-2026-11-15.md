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

Seed-list wording: They pierced His hands and His feet
OT reference: Psalms 22:16
Ps.22.16: For dogs surround me; a band of evil men encircles me; they have pierced my hands and feet.
  Note: DSS, LXX, Vulgate, and Syriac; most MT like a lion at my hands and feet
NT reference: John 19:34-37
John.19.34: Instead, one of the soldiers pierced His side with a spear, and immediately blood and water flowed out.
John.19.35: The one who saw it has testified to this, and his testimony is true. He knows that he is telling the truth, so that you also may believe.
John.19.36: Now these things happened so that the Scripture would be fulfilled: “Not one of His bones will be broken.”
  Note: Psalm 34:20; see also Exodus 12:46 and Numbers 9:12.
John.19.37: And, as another Scripture says: “They will look on the One they have pierced.”
  Note: Zechariah 12:10
NT reference: John 20:27
John.20.27: Then Jesus said to Thomas, “Put your finger here and look at My hands. Reach out your hand and put it into My side. Stop doubting and believe.”

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Psalm 22:16 predicted that Jesus's hands and feet would be pierced in crucifixion, fulfilled in John 19:34–37 and 20:27.",
      "scope_notes" : "The claimed wording is textually disputed, and John's explicit pierced-one quotation is from Zechariah 12:10.",
      "type" : "textual_variant_claim"
   },
   "claim_id" : "prophecy-084",
   "context" : {
      "shared_context_id" : "psalms-16-22",
      "summary" : "One ancient reading of Psalm 22:16 refers to the sufferer's hands and feet being dug or pierced; the Masoretic Text reads ‘like a lion.’ John describes Jesus's wounded hands and pierced side."
   },
   "critical_case" : {
      "reasoning" : [
         "The key word is textually disputed.",
         "‘Dug’ is not an unambiguous prediction of crucifixion.",
         "The cited fulfilment passage in John is Zechariah, and the proposed NT texts do not mention pierced feet."
      ],
      "source_ids" : [
         "src-hopkin-ps22-16",
         "src-lange-ps22",
         "src-bsb-v59"
      ],
      "summary" : "The Hebrew evidence is difficult and the major readings differ: ‘like a lion,’ ‘dug’ and the interpretive English ‘pierced.’ Even the verbal reading does not specify nails or crucifixion. John names Zechariah 12:10—not Psalm 22—when explaining the pierced side, and never says Jesus's feet were pierced."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "body" : "Some ancient texts say the sufferer’s hands and feet were ‘dug’ or ‘pierced.’ Jesus later shows wounds in his hands.",
            "heading" : "Did Psalm 22 predict pierced hands and feet?"
         },
         {
            "body" : "It was not invented by modern Christians. An early Greek translation—and perhaps an early Hebrew copy—supports a verb here.",
            "heading" : "The reading is genuinely ancient"
         },
         {
            "body" : "Other Hebrew texts say ‘like a lion.’ Even ‘dug’ does not clearly mean crucified, and John points to Zechariah instead.",
            "heading" : "But the wording is disputed"
         }
      ],
      "scripture_excerpt" : "They have pierced my hands and feet.",
      "title" : "Pierced hands and feet",
      "website" : {
         "christian_case" : "An ancient Greek translation says the sufferer's hands and feet were ‘dug,’ and an early Hebrew witness may support a similar reading. Jesus later shows wounds in his hands.",
         "critical_case" : "Other Hebrew manuscripts read ‘like a lion.’ Even ‘dug’ does not plainly mean nailed to a cross. John links the pierced side to Zechariah and says nothing here about pierced feet.",
         "description" : "Did Psalm 22 predict the wounds of Jesus's crucifixion?",
         "summary" : "The famous wording rests on a real ancient variant, but the text and its meaning are disputed.",
         "verdict" : "The connection is possible only after choosing and interpreting a contested reading; it is not the clear prediction often presented.",
         "verdict_label" : "Depends on a disputed text"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-11-15",
         "author" : "Shon D. Hopkin",
         "checked" : true,
         "id" : "src-hopkin-ps22-16",
         "locator" : "textual witnesses and proposed readings",
         "notes" : "Makes a strong case for the antiquity of the verbal reading; its confessional setting and conclusions are weighed accordingly.",
         "publisher" : "BYU Studies",
         "stance" : "supportive",
         "tier" : 2,
         "title" : "The Psalm 22:16 Controversy: New Evidence from the Dead Sea Scrolls",
         "type" : "journal_article",
         "url" : "https://archive.bookofmormoncentral.org/sites/default/files/archive-files/pdf/hopkin/2022-02-07/shon_d._hopkin_byus_44.3_the_psalm_22.16_controversy_2005_161-172.pdf"
      },
      {
         "accessed" : "2026-11-15",
         "author" : "Harvey D. Lange",
         "checked" : true,
         "id" : "src-lange-ps22",
         "locator" : "Psalm 22 and crucifixion tradition",
         "notes" : "Provides the wider Christian literary case.",
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
         "locator" : "Psalm 22:16; John 19:34–37; 20:27",
         "notes" : "The BSB itself footnotes the main textual alternatives.",
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
         "The verbal reading is ancient, not a modern Christian invention.",
         "Hands and feet are named in a death scene.",
         "John 20 identifies wounds in Jesus's hands."
      ],
      "source_ids" : [
         "src-hopkin-ps22-16",
         "src-lange-ps22",
         "src-bsb-v59"
      ],
      "summary" : "The pre-Christian Greek translation reads ‘they dug my hands and feet,’ and an early Hebrew witness may support a verbal reading. Combined with Psalm 22's wider passion links, this can look remarkably like crucifixion wounds later shown to Thomas."
   },
   "textual_issues" : [
      {
         "impact" : "The apparent precision of the prediction depends heavily on choosing and interpreting one disputed reading.",
         "issue" : "Most Masoretic manuscripts read ‘like a lion at my hands and feet’; the Greek reads ‘they dug,’ while an early Hebrew witness is often read as supporting a verbal form. ‘Pierced’ is an interpretive English rendering."
      }
   ],
   "verdict" : {
      "category" : "depends_on_disputed_text_or_translation",
      "confidence" : "high",
      "summary" : "An ancient verbal reading makes the Christian connection understandable, but ‘pierced’ is not a secure or uncontested Hebrew text and even ‘dug’ does not specify crucifixion. John's explicit piercing citation comes from Zechariah."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
