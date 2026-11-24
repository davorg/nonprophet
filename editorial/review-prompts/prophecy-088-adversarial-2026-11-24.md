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

Seed-list wording: Satanic power bruising the Redeemer’s heel
OT reference: Psalms 22:20-21
Ps.22.20: Deliver my soul from the sword, my precious life from the power of wild dogs.
Ps.22.21: Save me from the mouth of the lion; at the horns of the wild oxen You have answered me!
NT reference: Hebrews 2:14
Heb.2.14: Now since the children have flesh and blood, He too shared in their humanity, so that by His death He might destroy him who holds the power of death, that is, the devil,

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Psalm 22:20–21 predicted Satan bruising the Redeemer's heel, fulfilled when Jesus's death destroyed the devil in Hebrews 2:14.",
      "scope_notes" : "The cited psalm names sword, dogs, lion and wild oxen; Satan, a Redeemer and a bruised heel are absent.",
      "type" : "conflated_passages"
   },
   "claim_id" : "prophecy-088",
   "context" : {
      "shared_context_id" : "psalms-16-22",
      "summary" : "Psalm 22's sufferer asks rescue from violent human and animal threats. Hebrews says Jesus shared humanity and died in order to destroy the devil's power of death."
   },
   "critical_case" : {
      "reasoning" : [
         "Satan and the heel come from other texts.",
         "The psalm's speaker asks for deliverance from enemies.",
         "Hebrews supplies no Psalm 22 link in verse 14."
      ],
      "source_ids" : [
         "src-janowski-ps22",
         "src-bsb-v59"
      ],
      "summary" : "None of the claim's identifying language occurs in Psalm 22:20–21. The animals represent dangers from which the speaker asks rescue; the passage does not identify them as Satan, mention a heel or call the sufferer Redeemer. Hebrews does not cite the psalm here."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "body" : "Psalm 22 asks for rescue from a sword and wild animals. Hebrews says Jesus defeated the devil through death.",
            "heading" : "Did Psalm 22 predict Satan bruising Jesus?"
         },
         {
            "body" : "Jesus suffers, dies and defeats evil. Genesis also describes a victor wounded in the heel.",
            "heading" : "The larger Christian story fits"
         },
         {
            "body" : "It names no Satan, Redeemer or bruised heel. The claim combines three separate passages.",
            "heading" : "But Psalm 22 says none of that"
         }
      ],
      "scripture_excerpt" : "Deliver my soul from the sword … Save me from the mouth of the lion.",
      "title" : "Satan bruised his heel",
      "website" : {
         "christian_case" : "Taken together, the Bible presents Jesus suffering a deadly attack yet defeating the devil through death. Christians can fit Psalm 22 into that larger story.",
         "critical_case" : "Psalm 22 mentions dangerous enemies, but no Satan, Redeemer or heel. The heel comes from Genesis 3, while defeating the devil comes from Hebrews.",
         "description" : "Did Psalm 22 predict Satan bruising the Redeemer's heel?",
         "summary" : "The claim combines ideas from three different Bible passages.",
         "verdict" : "The combined Christian theme may be meaningful, but it is not a prediction made by Psalm 22:20–21.",
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
         "locator" : "petition and enemy imagery in vv. 20–21",
         "notes" : "Treats the lines as the sufferer's plea for deliverance.",
         "publisher" : "Arguing with God",
         "stance" : "both",
         "tier" : 2,
         "title" : "From Death to Life: Psalm 22",
         "type" : "book_chapter",
         "url" : "https://discere.pusc.it/pluginfile.php/131064/mod_folder/content/0/3.4.%20Sal%2022_Janowski%2C%20Arguing%20with%20God%2C%202013%2C%20pp.%20322-346.pdf?forcedownload=1"
      },
      {
         "accessed" : "2026-11-24",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Genesis 3:15; Psalm 22:20–21; Hebrews 2:14",
         "notes" : "The three distinct passages and their vocabulary checked locally.",
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
         "The psalm portrays deadly attack.",
         "Hebrews connects Jesus's death with defeating the devil.",
         "Genesis 3:15 supplies the heel-bruising motif used by the seed claim."
      ],
      "source_ids" : [
         "src-janowski-ps22",
         "src-bsb-v59"
      ],
      "summary" : "Christian readers can combine the psalm's deadly enemies with Genesis 3:15's wounded victor and Hebrews' claim that Jesus defeats the devil through death. Together they form a coherent theological picture of evil striking Christ and being overcome."
   },
   "textual_issues" : [],
   "verdict" : {
      "category" : "source_claim_incorrect",
      "confidence" : "high",
      "summary" : "This claim combines Psalm 22, Genesis 3:15 and Hebrews 2:14, then assigns the combined idea to Psalm 22. The cited psalm verses contain none of the Satan, Redeemer or bruised-heel details."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
