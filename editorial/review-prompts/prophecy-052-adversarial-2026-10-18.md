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

Seed-list wording: David’s house established forever
OT reference: 2 Samuel 7:16
2Sam.7.16: Your house and kingdom will endure forever before Me, and your throne will be established forever.”
  Note: Some Hebrew manuscripts and LXX; most Hebrew manuscripts you
NT reference: Luke 3:31
Luke.3.31: the son of Melea, the son of Menna, the son of Mattatha, the son of Nathan, the son of David,
NT reference: Revelation 22:16
Rev.22.16: “I, Jesus, have sent My angel to give you this testimony for the churches. I am the Root and the Offspring of David, the bright Morning Star.”

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "The everlasting house, kingdom and throne promised to David in 2 Samuel 7:16 predicted Jesus as David's descendant and eternal ruler.",
      "scope_notes" : "The promise explicitly concerns David's dynasty. Luke and Revelation identify Jesus as Davidic, but the cited verses do not quote this line.",
      "type" : "prediction"
   },
   "claim_id" : "prophecy-052",
   "context" : {
      "shared_context_id" : "davidic-covenant-and-elijah",
      "summary" : "Nathan's oracle concludes by promising that David's house, kingdom and throne will endure forever before God. 'House' here is a dynasty. The monarchy's historical collapse made this promise a major source of later hope for restored Davidic rule."
   },
   "critical_case" : {
      "reasoning" : [
         "A dynastic promise can have many members.",
         "The cited genealogy is not itself a claim of enthronement.",
         "The New Testament connection is canonical rather than an explicit citation here."
      ],
      "source_ids" : [
         "src-david-promise",
         "src-bsb-v59"
      ],
      "summary" : "The verse promises the endurance of David's house and throne, not a uniquely described individual. Luke 3:31 traces Jesus through David's son Nathan rather than the royal Solomonic line, and ancestry by itself cannot establish kingship. Revelation's Davidic title fits the promise but does not quote it."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "body" : "God promises that David’s family and throne will endure. The New Testament presents Jesus as David’s lasting heir.",
            "heading" : "Did David’s house point to Jesus?"
         },
         {
            "body" : "Luke places Jesus in David’s family. Revelation calls him both David’s root and his descendant.",
            "heading" : "The Davidic claim is deliberate"
         },
         {
            "body" : "The verse promises David an enduring royal house. It does not describe one unique future descendant.",
            "heading" : "But a dynasty includes many people"
         }
      ],
      "scripture_excerpt" : "Your house and kingdom will endure forever before Me.",
      "title" : "David's house forever",
      "website" : {
         "christian_case" : "Luke places Jesus in David's family, while Revelation calls him David's root and offspring. Luke also says he will receive David's throne and reign forever.",
         "critical_case" : "The verse promises a dynasty, not one uniquely described person. Many people belonged to David's house, and the cited genealogy alone does not establish who should rule.",
         "description" : "Did God's promise of David's everlasting house predict Jesus?",
         "summary" : "The promise genuinely concerns David's continuing dynasty, and the New Testament deliberately presents Jesus as its enduring heir.",
         "verdict" : "Jesus fits the New Testament's developed reading of the Davidic promise. The connection is substantial, though this verse alone cannot single him out from David's wider family.",
         "verdict_label" : "A broad but credible prediction"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-10-18",
         "author" : "William M. Schniedewind",
         "checked" : true,
         "id" : "src-david-promise",
         "locator" : "reception history of 2 Samuel 7",
         "notes" : "Academic history of the everlasting dynastic promise and its reception.",
         "publisher" : "Oxford University Press",
         "stance" : "both",
         "tier" : 2,
         "title" : "Society and the Promise to David",
         "type" : "monograph",
         "url" : "https://academic.oup.com/book/49657"
      },
      {
         "accessed" : "2026-10-18",
         "author" : "Andrew David Whittaker",
         "checked" : true,
         "id" : "src-sonship-study",
         "locator" : "2 Samuel 7 and Davidic dynasty",
         "notes" : "Treats the covenant as a claim for Davidic dynastic rule.",
         "publisher" : "University of Cambridge Repository",
         "stance" : "both",
         "tier" : 2,
         "title" : "Politics and Covenant in the Divine Davidic Kinship",
         "type" : "dissertation",
         "url" : "https://www.repository.cam.ac.uk/items/039e2546-69fb-417d-89cc-c3703fcb8080"
      },
      {
         "accessed" : "2026-10-18",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "2 Samuel 7:16; Luke 1:32–33; 3:31; Revelation 22:16",
         "notes" : "Exact wording and textual note checked locally.",
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
         "The Old Testament promise is genuinely dynastic and future-facing.",
         "New Testament writers repeatedly identify Jesus as Davidic.",
         "Jesus's everlasting reign answers the unresolved duration of the promise."
      ],
      "source_ids" : [
         "src-david-promise",
         "src-sonship-study",
         "src-bsb-v59"
      ],
      "summary" : "Jesus is explicitly presented as David's descendant, and elsewhere Luke describes him receiving David's throne and reigning forever. Revelation calls him both David's root and offspring. These claims intentionally place Jesus as the lasting heir of the Davidic promise."
   },
   "textual_issues" : [
      {
         "issue" : "Second Samuel 7:16 varies between 'your house ... before you' and 'his house ... before me' across Hebrew witnesses and the Septuagint. The variants affect viewpoint but not the central dynastic promise.",
         "significance" : "minor",
         "source_ids" : [
            "src-bsb-v59"
         ]
      }
   ],
   "verdict" : {
      "category" : "plausible_prediction",
      "confidence" : "medium",
      "summary" : "Second Samuel makes a real promise about David's enduring dynasty, and the New Testament deliberately presents Jesus as its lasting heir. The verse does not uniquely identify him, so it works as a broad dynastic prediction rather than a precise personal forecast."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
