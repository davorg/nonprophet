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

Seed-list wording: Sent by the Father to speak His word
OT reference: Deuteronomy 18:18
Deut.18.18: I will raise up for them a prophet like you from among their brothers. I will put My words in his mouth, and he will tell them everything I command him.
NT reference: John 8:28-29
John.8.28: So Jesus said, “When you have lifted up the Son of Man, then you will know that I am He, and that I do nothing on My own, but speak exactly what the Father has taught Me.
John.8.29: He who sent Me is with Me. He has not left Me alone, because I always do what pleases Him.”

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Deuteronomy 18:18 predicted Jesus as the prophet sent by the Father to speak only God's words, fulfilled in John 8:28–29.",
      "scope_notes" : "Speaking God's supplied message defines biblical prophets generally. The claim becomes stronger only if Deuteronomy promises one unique final prophet.",
      "type" : "thematic_parallel"
   },
   "claim_id" : "prophecy-042",
   "context" : {
      "shared_context_id" : "deuteronomy-18-21-joshua-5",
      "summary" : "Deuteronomy says God will put words in the mouth of a prophet like Moses. John presents Jesus as sent by the Father and speaking what the Father taught him. Similar commissioned-speech language applies broadly to prophets."
   },
   "critical_case" : {
      "reasoning" : [
         "The feature is shared by many prophets.",
         "John supplies no distinctive quotation.",
         "The argument risks circularly treating a consequence of the identification as proof of it."
      ],
      "source_ids" : [
         "src-stenschke",
         "src-bsb-v59"
      ],
      "summary" : "Receiving and transmitting God's words is the ordinary role of a prophet, not a unique identifier. Deuteronomy's surrounding rules anticipate multiple true and false prophets. John 8 does not quote Deuteronomy or call Jesus the prophet like Moses. The connection depends entirely on first deciding the disputed single-prophet question, so it cannot serve as additional confirmation of that decision."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "alt_text" : "Slide 1: The shared commissioned-speech claim.",
            "body" : "God promises a prophet who will speak His words. Jesus later says he speaks exactly what the Father taught him.",
            "heading" : "Did Moses predict Jesus’s words?"
         },
         {
            "alt_text" : "Slide 2: The strongest Christian case.",
            "body" : "Jesus says the Father sent him, and Acts identifies him with the prophet promised by Moses.",
            "heading" : "Why Christians connect them"
         },
         {
            "alt_text" : "Slide 3: The description is not unique.",
            "body" : "Speaking God’s message is the basic job of a prophet. John never quotes this verse, so the feature cannot identify Jesus by itself.",
            "heading" : "But every prophet does this"
         }
      ],
      "scripture_excerpt" : "I will put My words in his mouth, and he will tell them everything I command him.",
      "title" : "Speaking the Father's words",
      "website" : {
         "christian_case" : "Deuteronomy promises a prophet who will speak God's own words. Jesus says the Father sent him and taught him exactly what to say. Acts elsewhere identifies Jesus with Moses's promised prophet.",
         "critical_case" : "This is what prophets normally do, so the feature identifies no one by itself. John 8 never quotes Deuteronomy. The argument works only after accepting the disputed claim that Moses meant one final prophet.",
         "description" : "Did Moses predict that Jesus would speak the Father's words?",
         "summary" : "Jesus fits the description, but speaking God's supplied message is true of prophets generally.",
         "verdict" : "The parallel fits Jesus, but it supplies no independent or unique prediction about him.",
         "verdict_label" : "Too broad to identify Jesus"
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
         "locator" : "original context and interpretation history",
         "notes" : "Shows the contested individual and collective readings.",
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
         "notes" : "Supports the strongest canonical Christian case.",
         "publisher" : "Fordham University",
         "stance" : "christian_case",
         "tier" : 2,
         "title" : "The image of Jesus as the Prophet like Moses in Luke-Acts",
         "type" : "dissertation",
         "url" : "https://research.library.fordham.edu/dissertations/AAI9223825/"
      },
      {
         "accessed" : "2026-10-06",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Deuteronomy 18:9–22; John 8:28–29; Jeremiah 1:7–9",
         "notes" : "Exact wording and a prophetic comparison checked locally.",
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
         "Both figures speak words received directly from God.",
         "Jesus describes himself as sent by the Father.",
         "Acts explicitly connects Jesus with the prophet passage."
      ],
      "source_ids" : [
         "src-stenschke",
         "src-schubert",
         "src-bsb-v59"
      ],
      "summary" : "The verbal and conceptual fit is close: God raises and commissions the prophet, places words in his mouth, and requires the people to listen; Jesus says the Father sent and taught him exactly what to speak. Within John's wider Moses imagery and Acts's quotation, Christians can see deliberate fulfilment."
   },
   "textual_issues" : [],
   "verdict" : {
      "category" : "insufficiently_specific",
      "confidence" : "high",
      "summary" : "Jesus fits Deuteronomy's description of a prophet speaking God's words, but so do Israel's other prophets. John 8 does not uniquely connect him with this promise."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
