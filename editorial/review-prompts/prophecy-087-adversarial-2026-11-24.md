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

Seed-list wording: He committed Himself to God
OT reference: Psalms 22:20-21
Ps.22.20: Deliver my soul from the sword, my precious life from the power of wild dogs.
Ps.22.21: Save me from the mouth of the lion; at the horns of the wild oxen You have answered me!
NT reference: Luke 23:46
Luke.23.46: Then Jesus called out in a loud voice, “Father, into Your hands I commit My Spirit.” And when He had said this, He breathed His last.
  Note: Psalm 31:5

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Psalm 22:20–21 predicted that Jesus would commit Himself to God at death, fulfilled in Luke 23:46.",
      "scope_notes" : "Luke's words directly quote Psalm 31:5; Psalm 22:20–21 asks God for rescue from violent enemies.",
      "type" : "misattributed_source"
   },
   "claim_id" : "prophecy-087",
   "context" : {
      "shared_context_id" : "psalms-16-22",
      "summary" : "Psalm 22's sufferer pleads for God to save his life from sword and animals. Luke's dying Jesus entrusts his spirit to the Father using words from Psalm 31."
   },
   "critical_case" : {
      "reasoning" : [
         "Psalm 22 asks for deliverance rather than committing the spirit.",
         "Luke's direct source is Psalm 31:5.",
         "The seed claim conflates two different psalms."
      ],
      "source_ids" : [
         "src-janowski-ps22",
         "src-bsb-v59"
      ],
      "summary" : "The claimed action is not in Psalm 22:20–21, which asks to be saved from death. Luke instead quotes Psalm 31:5 directly: ‘Into Your hand I commit my spirit.’ The thematic similarity cannot transfer Psalm 31's wording into Psalm 22."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "body" : "Psalm 22 asks God to rescue the sufferer. Luke says Jesus entrusted his spirit to the Father before dying.",
            "heading" : "Did Psalm 22 predict Jesus’s final prayer?"
         },
         {
            "body" : "Each speaker turns to God in mortal danger. That makes the comparison understandable.",
            "heading" : "Both passages show trust"
         },
         {
            "body" : "‘Into Your hands I commit My Spirit’ comes from Psalm 31:5. Those words are not in Psalm 22.",
            "heading" : "But Luke quotes another psalm"
         }
      ],
      "scripture_excerpt" : "Deliver my soul from the sword … Save me from the mouth of the lion.",
      "title" : "Into Your hands",
      "website" : {
         "christian_case" : "Psalm 22's sufferer trusts God while facing death. Jesus also turns to his Father in his final moments, so the spiritual posture is similar.",
         "critical_case" : "Psalm 22 asks God to save the speaker's life. Jesus's actual words—‘Into Your hands I commit My Spirit’—quote Psalm 31:5, not Psalm 22.",
         "description" : "Did Psalm 22 predict Jesus committing Himself to God?",
         "summary" : "The claimed words come from a different psalm.",
         "verdict" : "This is a broad trust theme attached to the wrong passage; Psalm 22:20–21 does not predict Luke's final prayer.",
         "verdict_label" : "The source says something else"
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
         "locator" : "pp. 322–346; petition in vv. 20–21",
         "notes" : "Analyzes the psalm's movement from lament and petition to praise.",
         "publisher" : "Arguing with God",
         "stance" : "both",
         "tier" : 2,
         "title" : "From Death to Life: Psalm 22",
         "type" : "book_chapter",
         "url" : "https://discere.pusc.it/pluginfile.php/131064/mod_folder/content/0/3.4.%20Sal%2022_Janowski%2C%20Arguing%20with%20God%2C%202013%2C%20pp.%20322-346.pdf?forcedownload=1"
      },
      {
         "accessed" : "2026-11-24",
         "author" : "Harvey D. Lange",
         "checked" : true,
         "id" : "src-lange-ps22",
         "locator" : "passion use of Psalm 22",
         "notes" : "Supports the wider Christian context without identifying Luke 23:46 with these verses.",
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
         "locator" : "Psalm 22:20–21; Psalm 31:5; Luke 23:46",
         "notes" : "Luke's direct quotation and both psalm passages checked locally.",
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
         "Both speakers address God in mortal danger.",
         "Both express reliance on God.",
         "Psalm 22 already frames the passion in Christian reading."
      ],
      "source_ids" : [
         "src-janowski-ps22",
         "src-lange-ps22",
         "src-bsb-v59"
      ],
      "summary" : "Psalm 22 portrays the righteous sufferer still addressing God and depending on divine rescue at the edge of death. Jesus likewise turns to the Father in his final words, so the two passages share a posture of trust."
   },
   "textual_issues" : [],
   "verdict" : {
      "category" : "source_claim_incorrect",
      "confidence" : "high",
      "summary" : "Psalm 22 contains trust and prayer, but not the act claimed. Luke's final words are a direct quotation of Psalm 31:5, so citing Psalm 22:20–21 as their prediction misidentifies the source."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
