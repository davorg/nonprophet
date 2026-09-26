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

Seed-list wording: "This is of a truth that prophet"
OT reference: Deuteronomy 18:15
Deut.18.15: The LORD your God will raise up for you a prophet like me from among your brothers. You must listen to him.
  Note: Cited in Acts 3:22
NT reference: John 6:14
John.6.14: When the people saw the sign that Jesus had performed, they began to say, “Truly this is the Prophet who is to come into the world.”
  Note: SBL, NA, NE, and WH He had performed

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Deuteronomy 18:15 predicted one final prophet like Moses, identified as Jesus when the crowd calls him 'the Prophet' in John 6:14 and when Acts 3:22 applies the passage to him.",
      "scope_notes" : "The seed cites only John 6:14, but Acts 3:22–23 is the strongest explicit Christian application and must be included.",
      "type" : "prediction"
   },
   "claim_id" : "prophecy-040",
   "context" : {
      "shared_context_id" : "leviticus-23-numbers-9-24-deuteronomy-18",
      "summary" : "Deuteronomy contrasts legitimate prophecy with forbidden divination and promises that God will raise up a prophet like Moses from Israel. The following verses give tests for prophets, supporting a collective or successive sense. Second Temple readers could also expect a particular end-time prophet. John records that a crowd identified Jesus as 'the Prophet'; Acts explicitly quotes Deuteronomy in a speech about Jesus."
   },
   "critical_case" : {
      "reasoning" : [
         "The legal context concerns Israel's continuing prophetic institution.",
         "Ancient interpretation was not uniform.",
         "New Testament reception cannot by itself settle the passage's original scope."
      ],
      "source_ids" : [
         "src-stenschke-prophet",
         "src-akagi-acts",
         "src-bsb-v59"
      ],
      "summary" : "In Deuteronomy's immediate context, the promise assures Israel of legitimate prophets as an alternative to divination; the tests in verses 20–22 assume repeated prophetic claims. Hebrew singular nouns can be collective. John 6:14 reports the crowd's interpretation after a sign, not an authorial statement that every criterion is fulfilled, and the crowd soon tries to make Jesus king. Acts gives an explicit Christian rereading, but scholars dispute whether its quotation identifies Jesus directly as the prophet like Moses or places him within the wider prophetic testimony. The evidence supports a serious Christian claim but not an uncontested original meaning."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "alt_text" : "Slide 1: Jesus and the prophet like Moses.",
            "body" : "Moses promises a prophet like himself. After seeing Jesus’s sign, a crowd calls him “the Prophet” who was expected to come.",
            "heading" : "Did Moses predict Jesus?"
         },
         {
            "alt_text" : "Slide 2: The singular and New Testament case.",
            "body" : "Some Jewish readers expected one final prophet. Acts later quotes this promise while preaching about Jesus.",
            "heading" : "The Christian case is strong"
         },
         {
            "alt_text" : "Slide 3: The disputed original scope.",
            "body" : "The surrounding law explains how Israel should recognise true prophets. The promise may describe a continuing line, not one unique person.",
            "heading" : "But Deuteronomy may mean many"
         }
      ],
      "scripture_excerpt" : "The LORD your God will raise up for you a prophet like me from among your brothers. You must listen to him.",
      "title" : "The prophet like Moses",
      "website" : {
         "christian_case" : "The singular promise and comparison with Moses can point to one exceptional figure. Jewish readers expected an end-time prophet, John calls Jesus 'the Prophet,' and Acts explicitly quotes this passage while preaching about him.",
         "critical_case" : "Deuteronomy contrasts true prophets with diviners and then explains how to test prophets, which fits an ongoing institution. The crowd in John offers its own interpretation, while Acts supplies a later Christian reading. The singular wording does not settle the question.",
         "description" : "Did Moses predict Jesus as the Prophet?",
         "summary" : "The New Testament identifies Jesus with Moses's promised prophet, but Deuteronomy may also describe Israel's continuing prophets.",
         "verdict" : "Jesus fits a well-established reading of this promise. The original context also permits a succession of Israelite prophets, so the identification is not uniquely required.",
         "verdict_label" : "A plausible but disputed prediction"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-09-26",
         "author" : "Christoph Stenschke",
         "checked" : true,
         "id" : "src-stenschke-prophet",
         "locator" : "original context and Acts 3 reception",
         "notes" : "Surveys collective, individual, Jewish and Christian readings.",
         "publisher" : "Verbum et Ecclesia",
         "stance" : "both",
         "tier" : 2,
         "title" : "The prophet like Moses (Dt 18:15–22): Some trajectories in the history of interpretation",
         "type" : "journal_article",
         "url" : "https://verbumetecclesia.org.za/index.php/ve/article/view/1962/0"
      },
      {
         "accessed" : "2026-09-26",
         "author" : "Judith M. Schubert",
         "checked" : true,
         "id" : "src-acts-study",
         "locator" : "abstract and thesis summary",
         "notes" : "Documents Luke-Acts' identification of Jesus through Deuteronomy 18.",
         "publisher" : "Fordham University",
         "stance" : "christian_case",
         "tier" : 2,
         "title" : "The image of Jesus as the Prophet like Moses in Luke-Acts",
         "type" : "dissertation",
         "url" : "https://research.library.fordham.edu/dissertations/AAI9223825/"
      },
      {
         "accessed" : "2026-09-26",
         "author" : "Kai Akagi",
         "checked" : true,
         "id" : "src-akagi-acts",
         "locator" : "abstract and discussion of Acts 3:22–23",
         "notes" : "Represents current debate over how the Acts citation identifies Jesus and the prophetic word.",
         "publisher" : "New Testament Studies, Cambridge University Press",
         "stance" : "critical_case",
         "tier" : 2,
         "title" : "The Prophet like Moses and the Word of the Lord: Reassigning the Composite Citation in Acts 3.22–3",
         "type" : "journal_article",
         "url" : "https://www.cambridge.org/core/journals/new-testament-studies/article/prophet-like-moses-and-the-word-of-the-lord-reassigning-the-composite-citation-in-acts-3223/EBDDDB0C463A96669699CC0EC98DFED8"
      },
      {
         "accessed" : "2026-09-26",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Deuteronomy 18:9–22; 34:10; John 6:14–15; Acts 3:19–26",
         "notes" : "Exact wording and wider contexts checked locally.",
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
         "The promise can naturally be heard as singular.",
         "Jewish reception included an eschatological prophet.",
         "Acts quotes the passage within proclamation about Jesus."
      ],
      "source_ids" : [
         "src-stenschke-prophet",
         "src-acts-study",
         "src-bsb-v59"
      ],
      "summary" : "The singular wording, comparison with Moses and later statement that no prophet like Moses had arisen support expectation of an exceptional future figure. Such an expectation existed in early Judaism. John repeatedly uses 'the Prophet,' and Acts explicitly quotes Deuteronomy 18:15 and applies the scriptural sequence to Jesus. The Christian identification is early and textually direct."
   },
   "textual_issues" : [
      {
         "issue" : "The Hebrew singular 'a prophet' can refer to an individual or represent a succession; the surrounding tests and Deuteronomy 34:10 pull interpretation in different directions.",
         "significance" : "material",
         "source_ids" : [
            "src-stenschke-prophet",
            "src-bsb-v59"
         ]
      }
   ],
   "verdict" : {
      "category" : "mixed_or_indeterminate",
      "confidence" : "medium",
      "summary" : "Jesus is explicitly and early associated with Deuteronomy's prophet in Christian texts, and a singular end-time reading has genuine Jewish precedent. Deuteronomy's own legal context also supports an ongoing succession of prophets, so the claim is plausible but not uniquely compelled."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
