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

Seed-list wording: His blood poured out when they pierced His side
OT reference: Psalms 22:14
Ps.22.14: I am poured out like water, and all my bones are disjointed. My heart is like wax; it melts away within me.
NT reference: John 19:34
John.19.34: Instead, one of the soldiers pierced His side with a spear, and immediately blood and water flowed out.

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Psalm 22:14 predicted that Jesus's blood and water would flow when His side was pierced, fulfilled in John 19:34.",
      "scope_notes" : "The psalmist says he is poured out like water; John reports actual blood and water after a spear wound.",
      "type" : "thematic_parallel"
   },
   "claim_id" : "prophecy-081",
   "context" : {
      "shared_context_id" : "psalms-16-22",
      "summary" : "Psalm 22 uses bodily metaphors to describe a sufferer's collapse. John records a soldier piercing Jesus's side, followed by blood and water."
   },
   "critical_case" : {
      "reasoning" : [
         "The grammar makes the sufferer, not his blood, like water.",
         "Every distinctive detail in John is absent from the psalm.",
         "John supplies no Psalm 22 signal here."
      ],
      "source_ids" : [
         "src-van-aarde-ps22",
         "src-lange-ps22",
         "src-bsb-v59"
      ],
      "summary" : "The psalm says the speaker himself is poured out like water—a common metaphor for physical and emotional collapse. It mentions neither blood, a spear, a side wound nor two fluids, and John does not cite this verse."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "body" : "The psalmist says, ‘I am poured out like water.’ John says blood and water flowed from Jesus’s pierced side.",
            "heading" : "Did Psalm 22 predict blood and water?"
         },
         {
            "body" : "Psalm 22 is strongly linked with Jesus’s death, so its water language can bring John’s scene to mind.",
            "heading" : "The shared image is striking"
         },
         {
            "body" : "The sufferer is like poured-out water. The verse says nothing about blood, a spear or a wound in his side.",
            "heading" : "But the claim changes the words"
         }
      ],
      "scripture_excerpt" : "I am poured out like water … My heart is like wax.",
      "title" : "Poured out like water",
      "website" : {
         "christian_case" : "Psalm 22 is closely associated with Jesus's death. Its water imagery can therefore sound like John's striking report of blood and water flowing from Jesus's side.",
         "critical_case" : "The psalm says ‘I am poured out like water.’ It does not say the speaker's blood is poured out, or mention a spear, a side wound or blood mixed with water.",
         "description" : "Did Psalm 22 predict blood and water flowing from Jesus's side?",
         "summary" : "The parallel relies on changing a metaphor about the sufferer into a statement about fluid leaving his body.",
         "verdict" : "John's scene can recall the psalm, but Psalm 22:14 does not make the detailed prediction claimed.",
         "verdict_label" : "The source says something else"
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
         "locator" : "Psalm 22 and passion narration",
         "notes" : "Provides the wider literary context for passion use of Psalm 22.",
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
         "locator" : "passion correspondences",
         "notes" : "Helps distinguish close correspondences from broad imagery.",
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
         "locator" : "Psalm 22:14; John 19:34",
         "notes" : "Wording checked locally.",
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
         "Psalm 22 is repeatedly echoed in passion accounts.",
         "Both texts mention water in a scene of mortal suffering.",
         "John emphasizes eyewitness testimony for the event."
      ],
      "source_ids" : [
         "src-van-aarde-ps22",
         "src-lange-ps22",
         "src-bsb-v59"
      ],
      "summary" : "The unusual water imagery in a psalm repeatedly connected with the passion resembles John's distinctive report that blood and water flowed from Jesus's pierced side."
   },
   "textual_issues" : [],
   "verdict" : {
      "category" : "source_claim_incorrect",
      "confidence" : "high",
      "summary" : "This claim changes Psalm 22's metaphor. The speaker is ‘poured out like water’; the verse does not predict blood and water flowing from a pierced side."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
