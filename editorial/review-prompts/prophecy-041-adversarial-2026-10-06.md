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

Seed-list wording: "Had you believed Moses, you would believe me."
OT reference: Deuteronomy 18:15-16
Deut.18.15: The LORD your God will raise up for you a prophet like me from among your brothers. You must listen to him.
  Note: Cited in Acts 3:22
Deut.18.16: This is what you asked of the LORD your God at Horeb on the day of the assembly, when you said, “Let us not hear the voice of the LORD our God or see this great fire anymore, so that we will not die!”
  Note: That is, Mount Sinai, or possibly a mountain in the range containing Mount Sinai
NT reference: John 5:45-47
John.5.45: Do not think that I will accuse you before the Father. Your accuser is Moses, in whom you have put your hope.
John.5.46: If you had believed Moses, you would believe Me, because he wrote about Me.
John.5.47: But since you do not believe what he wrote, how will you believe what I say?”

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Deuteronomy 18:15–16 is the passage Jesus had in mind when he said Moses wrote about him in John 5:45–47, confirming that he is Moses's promised prophet.",
      "scope_notes" : "This overlaps claim 040. John does not identify a particular Mosaic passage; Acts 3:22 is the strongest explicit Christian link to Deuteronomy 18.",
      "type" : "prediction"
   },
   "claim_id" : "prophecy-041",
   "context" : {
      "shared_context_id" : "deuteronomy-18-21-joshua-5",
      "summary" : "Deuteronomy promises a prophet like Moses in the context of Israel's request for mediated revelation and laws governing prophets. John says Moses wrote about Jesus but does not quote Deuteronomy. Acts later quotes Deuteronomy 18 in a speech about Jesus."
   },
   "critical_case" : {
      "reasoning" : [
         "John supplies no quotation or unique verbal marker.",
         "Many Mosaic texts were read Christologically.",
         "A repeated citation is not a separate prediction."
      ],
      "source_ids" : [
         "src-prophet-motif",
         "src-stenschke",
         "src-bsb-v59"
      ],
      "summary" : "John 5:46 says only that Moses wrote about Jesus; it could refer to the Torah as a whole or to several Christian readings of it. A specialist study of the prophet-like-Moses motif calls the specific Deuteronomy 18 allusion questionable. Even if John or Acts applies the passage to Jesus, Deuteronomy's immediate legal context can describe Israel's continuing prophetic institution. This claim adds no independent evidence beyond the disputed identification already considered in claim 040."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "alt_text" : "Slide 1: Jesus's broad claim and the proposed source.",
            "body" : "Jesus says Moses wrote about him. Christians often identify the promised prophet in Deuteronomy as one of those passages.",
            "heading" : "Which words of Moses?"
         },
         {
            "alt_text" : "Slide 2: The strongest Christian connection.",
            "body" : "It promises a prophet like Moses, and Acts later quotes that promise while preaching about Jesus.",
            "heading" : "Why this passage is plausible"
         },
         {
            "alt_text" : "Slide 3: The source and original scope remain uncertain.",
            "body" : "Jesus may mean the Torah more broadly. Deuteronomy may also describe a line of prophets rather than one final person.",
            "heading" : "But John never names it"
         }
      ],
      "scripture_excerpt" : "The LORD your God will raise up for you a prophet like me from among your brothers.",
      "title" : "Moses wrote about me",
      "website" : {
         "christian_case" : "The promise of a prophet like Moses naturally fits Jesus's words. Acts later quotes Deuteronomy 18 while preaching about Jesus, and John records expectation of a particular Prophet.",
         "critical_case" : "Jesus says Moses wrote about him but never names this verse. He could mean the Torah more broadly. Deuteronomy's context may also promise a continuing line of prophets rather than one final figure.",
         "description" : "Was Deuteronomy 18 what Jesus meant when he said Moses wrote about him?",
         "summary" : "Deuteronomy's prophet is a plausible Christian reading, but John never identifies that particular passage.",
         "verdict" : "Deuteronomy 18 may be one text John has in view. John 5 alone cannot establish that identification or settle the passage's disputed meaning.",
         "verdict_label" : "Plausible, but not specified"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-10-06",
         "author" : "Christoph Stenschke",
         "checked" : true,
         "id" : "src-stenschke",
         "locator" : "original context and New Testament reception",
         "notes" : "Surveys collective, individual and Christian readings.",
         "publisher" : "Verbum et Ecclesia",
         "stance" : "both",
         "tier" : 2,
         "title" : "The prophet like Moses (Dt 18:15–22): Some trajectories in the history of interpretation",
         "type" : "journal_article",
         "url" : "https://verbumetecclesia.org.za/index.php/ve/article/view/1962/0"
      },
      {
         "accessed" : "2026-10-06",
         "author" : "Judith M. Schubert",
         "checked" : true,
         "id" : "src-schubert",
         "locator" : "abstract and thesis summary",
         "notes" : "Documents the early Christian identification.",
         "publisher" : "Fordham University",
         "stance" : "christian_case",
         "tier" : 2,
         "title" : "The image of Jesus as the Prophet like Moses in Luke-Acts",
         "type" : "dissertation",
         "url" : "https://research.library.fordham.edu/dissertations/AAI9223825/"
      },
      {
         "accessed" : "2026-10-06",
         "author" : "D. M. Manurung",
         "checked" : true,
         "id" : "src-prophet-motif",
         "locator" : "discussion of John 5:46 and Deuteronomy 18",
         "notes" : "Regards a specific John 5:46 allusion to Deuteronomy 18 as questionable.",
         "publisher" : "University of Pretoria",
         "stance" : "critical_case",
         "tier" : 2,
         "title" : "The Prophet Like Moses Motif",
         "type" : "dissertation",
         "url" : "https://repository.up.ac.za/bitstream/handle/2263/25667/dissertation.pdf"
      },
      {
         "accessed" : "2026-10-06",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Deuteronomy 18:9–22; John 5:45–47; Acts 3:22–23",
         "notes" : "Exact wording and contexts checked locally.",
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
         "The singular promise and Moses comparison suit Jesus's claim.",
         "Acts makes the connection explicit.",
         "John's Gospel elsewhere records expectation of 'the Prophet'."
      ],
      "source_ids" : [
         "src-stenschke",
         "src-schubert",
         "src-bsb-v59"
      ],
      "summary" : "Deuteronomy 18 is a natural candidate for Jesus's statement because it promises a prophet like Moses whom Israel must hear. Early Christian proclamation in Acts explicitly quotes that promise about Jesus, while Jewish reception could expect a particular end-time prophet."
   },
   "textual_issues" : [],
   "verdict" : {
      "category" : "mixed_or_indeterminate",
      "confidence" : "medium",
      "summary" : "Deuteronomy 18 is a plausible Christian referent for Jesus's claim that Moses wrote about him, especially in light of Acts. John itself does not specify the passage, and the original promise's singular scope remains disputed."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
