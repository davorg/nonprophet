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

Seed-list wording: His Resurrection declared
OT reference: Psalms 22:22
Ps.22.22: I will proclaim Your name to my brothers; I will praise You in the assembly.
  Note: LXX I will sing Your praises in the assembly; cited in Hebrews 2:12.
NT reference: John 20:17
John.20.17: “ Do not cling to Me,” Jesus said, “for I have not yet ascended to the Father. But go and tell My brothers, ‘I am ascending to My Father and your Father, to My God and your God.’”

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Psalm 22:22 predicted Jesus's resurrection and declaration to His brothers, fulfilled in John 20:17.",
      "scope_notes" : "The verse follows the psalm's turn from danger to praise; Hebrews 2:12 explicitly places it on Jesus's lips, while John 20:17 supplies the post-resurrection brothers scene.",
      "type" : "canonical_typology"
   },
   "claim_id" : "prophecy-089",
   "context" : {
      "shared_context_id" : "psalms-16-22",
      "summary" : "After answered prayer, Psalm 22's speaker promises to proclaim God's name to his brothers. The risen Jesus tells Mary to go to his brothers and announces his coming ascent."
   },
   "critical_case" : {
      "reasoning" : [
         "Resurrection is not stated in the verse.",
         "Deliverance from danger can explain the transition.",
         "John supplies no explicit Psalm 22 citation."
      ],
      "source_ids" : [
         "src-janowski-ps22",
         "src-gleason-hebrews",
         "src-bsb-v59"
      ],
      "summary" : "Psalm 22:22 itself says nothing about death, return to life or ascent. Its speaker promises praise after deliverance, which need not mean resurrection. John does not quote the verse; the direct Christian bridge comes from Hebrews, whose typological use is later than the psalm."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "body" : "The rescued psalmist promises to speak to his brothers. John shows the risen Jesus sending a message to his brothers.",
            "heading" : "Did Psalm 22 predict Jesus’s resurrection?"
         },
         {
            "body" : "Hebrews directly quotes this verse as Jesus’s words. Psalm 22 also turns here from suffering to praise.",
            "heading" : "The Christian link is strong"
         },
         {
            "body" : "The speaker has been rescued and will praise God. The psalm never says he died and returned to life.",
            "heading" : "But resurrection is not stated"
         }
      ],
      "scripture_excerpt" : "I will proclaim Your name to my brothers.",
      "title" : "The risen Jesus and his brothers",
      "website" : {
         "christian_case" : "Psalm 22 turns from suffering to praise, and Hebrews gives verse 22 to Jesus. John then shows the risen Jesus calling his disciples brothers and sending them a message.",
         "critical_case" : "The psalm says the rescued speaker will praise God. It never says he died or rose again, and John does not identify this verse as his source.",
         "description" : "Did Psalm 22 predict Jesus declaring His resurrection?",
         "summary" : "Hebrews explicitly applies this verse to Jesus, but the resurrection link comes from its later Christian setting.",
         "verdict" : "This is strong canonical typology: later New Testament texts connect the pieces. It is not a direct resurrection prediction in Psalm 22:22.",
         "verdict_label" : "A plausible Christian pattern"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-11-24",
         "author" : "Bernd Janowski",
         "checked" : true,
         "id" : "src-janowski-ps22",
         "locator" : "turn from petition to praise after v. 21",
         "notes" : "Explains the literary transition without requiring literal resurrection.",
         "publisher" : "Arguing with God",
         "stance" : "both",
         "tier" : 2,
         "title" : "From Death to Life: Psalm 22",
         "type" : "book_chapter",
         "url" : "https://discere.pusc.it/pluginfile.php/131064/mod_folder/content/0/3.4.%20Sal%2022_Janowski%2C%20Arguing%20with%20God%2C%202013%2C%20pp.%20322-346.pdf?forcedownload=1"
      },
      {
         "accessed" : "2026-11-24",
         "author" : "Randall C. Gleason",
         "checked" : true,
         "id" : "src-gleason-hebrews",
         "locator" : "Psalm 22:22 in Hebrews 2:12",
         "notes" : "Discusses Hebrews' Christological use of the psalm.",
         "publisher" : "Bibliotheca Sacra",
         "stance" : "supportive",
         "tier" : 2,
         "title" : "Angels and the Eschatology of Hebrews 1–2",
         "type" : "journal_article",
         "url" : "https://www.marquette.edu/maqom/GleasonAngels.pdf"
      },
      {
         "accessed" : "2026-11-24",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Psalm 22:21–22; John 20:17; Hebrews 2:12",
         "notes" : "Psalm transition and both New Testament connections checked locally.",
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
         "Hebrews 2:12 explicitly applies Psalm 22:22 to Jesus.",
         "The verse follows a dramatic turn from suffering to answered prayer.",
         "John 20 combines resurrection, brothers and proclamation."
      ],
      "source_ids" : [
         "src-janowski-ps22",
         "src-gleason-hebrews",
         "src-bsb-v59"
      ],
      "summary" : "The canonical connection is substantial. Psalm 22 moves from near death to public praise, Hebrews explicitly quotes verse 22 as Jesus's words, and John records the risen Jesus calling the disciples brothers and sending them a declaration."
   },
   "textual_issues" : [],
   "verdict" : {
      "category" : "plausible_typology_not_prediction",
      "confidence" : "high",
      "summary" : "Hebrews explicitly gives Psalm 22:22 to Jesus, and John provides an attractive resurrection scene involving his brothers. This is strong Christian typology, but the psalmic verse itself predicts neither death nor resurrection."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
