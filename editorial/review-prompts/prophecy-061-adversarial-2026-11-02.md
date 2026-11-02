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

Seed-list wording: His Character-Holiness
OT reference: Psalms 2:6
Ps.2.6: “I have installed My King on Zion, upon My holy mountain.”
NT reference: John 8:46
John.8.46: Which of you can prove Me guilty of sin? If I speak the truth, why do you not believe Me?
NT reference: Revelation 3:7
Rev.3.7: To the angel of the church in Philadelphia write: These are the words of the One who is holy and true, who holds the key of David. What He opens no one can shut, and what He shuts no one can open.
  Note: See Isaiah 22:22.

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Psalm 2:6 predicted Jesus's holy character by describing God's king in connection with holiness.",
      "scope_notes" : "In the verse, 'holy' modifies Mount Zion, not the installed king. The alleged character prediction rests on a grammatical misreading.",
      "type" : "source_error"
   },
   "claim_id" : "prophecy-061",
   "context" : {
      "shared_context_id" : "chronicles-job-psalm-2",
      "summary" : "God responds to rebellious rulers by declaring that he has installed his king on Zion, his holy mountain. Zion is holy because it is God's chosen sacred place. The verse says nothing here about the king's moral character."
   },
   "critical_case" : {
      "reasoning" : [
         "The adjective directly modifies mountain.",
         "The verse concerns installation and location.",
         "The cited New Testament texts do not quote this verse."
      ],
      "source_ids" : [
         "src-psalm-nicot",
         "src-bsb-v59"
      ],
      "summary" : "The grammar is decisive: 'holy' describes the mountain, not the king. Moving an adjective from Zion to the king creates a claim the psalm does not make. Jesus's holiness may be Christian teaching, but it is not predicted in Psalm 2:6."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "body" : "God says He installed His king on Zion, His holy mountain. Some lists turn this into a claim about Jesus’s character.",
            "heading" : "Does Psalm 2 call the king holy?"
         },
         {
            "body" : "John and Revelation portray Jesus as sinless, holy and true. That Christian claim is clear.",
            "heading" : "Jesus is called holy elsewhere"
         },
         {
            "body" : "The adjective belongs to Zion, not the king. This verse makes no statement about the ruler’s character.",
            "heading" : "But “holy” describes the mountain"
         }
      ],
      "scripture_excerpt" : "I have installed My King on Zion, upon My holy mountain.",
      "title" : "The holy mountain",
      "website" : {
         "christian_case" : "The New Testament portrays Jesus as sinless, holy and true. Christians also identify him as Psalm 2's ideal king.",
         "critical_case" : "In Psalm 2:6, 'holy' describes the mountain where the king is installed. It says nothing about his character. The claim moves the adjective to the wrong subject.",
         "description" : "Did Psalm 2 predict Jesus's holy character?",
         "summary" : "The verse calls Mount Zion holy, not the king. Jesus's holiness comes from other New Testament claims.",
         "verdict" : "Jesus may be holy in Christian theology, but this verse does not predict that quality. Its holy object is the mountain.",
         "verdict_label" : "The adjective describes Zion"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-11-02",
         "author" : "Nancy deClaissé-Walford et al.",
         "checked" : true,
         "id" : "src-psalm-nicot",
         "locator" : "Psalm 2:6",
         "notes" : "Explains Zion as the sacred installation place.",
         "publisher" : "NICOT",
         "stance" : "critical_case",
         "tier" : 2,
         "title" : "The Book of Psalms",
         "type" : "commentary",
         "url" : "https://www.thetbs.org/study-materials/wp-content/uploads/2023/03/The_Book_of_Psalms_New_International_Commentary_on_the_Old_Testament.pdf"
      },
      {
         "accessed" : "2026-11-02",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Psalm 2:6; John 8:46; Revelation 3:7",
         "notes" : "Grammar and cited descriptions checked locally.",
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
         "The New Testament clearly attributes holiness to Jesus.",
         "A holy king suits God's holy place.",
         "The wider Christian royal portrait connects Jesus with Zion."
      ],
      "source_ids" : [
         "src-psalm-nicot",
         "src-bsb-v59"
      ],
      "summary" : "Jesus is described as holy and true in Revelation and challenges opponents to prove him guilty of sin. As the ideal king on God's holy Zion, holiness coheres with his Christian portrayal."
   },
   "textual_issues" : [
      {
         "issue" : "The claim transfers 'holy' from Mount Zion to the king. This is a grammatical source error, not a disputed translation.",
         "significance" : "decisive",
         "source_ids" : [
            "src-bsb-v59"
         ]
      }
   ],
   "verdict" : {
      "category" : "source_claim_incorrect",
      "confidence" : "high",
      "summary" : "Psalm 2:6 calls Zion holy; it does not describe the king's character. The proposed prophecy results from attaching the adjective to the wrong noun."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
