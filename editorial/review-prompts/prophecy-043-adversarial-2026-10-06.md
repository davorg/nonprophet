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

Seed-list wording: Whoever will not hear must bear his sin
OT reference: Deuteronomy 18:19
Deut.18.19: And I will hold accountable anyone who does not listen to My words that the prophet speaks in My name.
  Note: See Acts 3:23.
NT reference: Acts 3:22-23
Acts.3.22: For Moses said, ‘The Lord your God will raise up for you a prophet like me from among your brothers. You must listen to Him in everything He tells you.
  Note: Deuteronomy 18:15
Acts.3.23: Everyone who does not listen to Him will be completely cut off from among his people.’
  Note: See Deuteronomy 18:19.

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Deuteronomy 18:19 predicted judgment on anyone who rejects Jesus, fulfilled when Acts 3:22–23 applies the warning about the prophet like Moses to him.",
      "scope_notes" : "Acts explicitly quotes and strengthens the warning. Its 'completely cut off' wording is not a verbatim rendering of the extant Hebrew or Greek Deuteronomy 18:19.",
      "type" : "nt_rereading"
   },
   "claim_id" : "prophecy-043",
   "context" : {
      "shared_context_id" : "deuteronomy-18-21-joshua-5",
      "summary" : "Deuteronomy says God will hold accountable anyone who refuses the divinely commissioned prophet's words. Acts quotes the prophet promise in a speech about Jesus, then says nonlisteners will be completely cut off from the people. The latter wording resembles a standard Torah penalty and has prompted debate about a composite citation."
   },
   "critical_case" : {
      "reasoning" : [
         "The NT wording is not verbatim Deuteronomy 18:19.",
         "The original rule has an institutional prophetic setting.",
         "Explicit later application establishes reception but does not remove original ambiguity."
      ],
      "source_ids" : [
         "src-akagi",
         "src-stenschke",
         "src-bsb-v59"
      ],
      "summary" : "Acts makes the Christian application explicit, but its penalty is stronger and differently worded than Deuteronomy's 'I will hold accountable.' A recent textual study argues that Acts 3:23 is a composite or interpretive citation and evaluates proposed sources for 'cut off.' Deuteronomy originally governs response to authorised prophecy and may concern a succession of prophets. Acts therefore supplies a forceful Christian rereading rather than proof that the original verse uniquely forecast rejection of Jesus."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "alt_text" : "Slide 1: The warning and Christian application.",
            "body" : "Moses says God will hold people accountable for ignoring His prophet. Acts applies that warning while preaching about Jesus.",
            "heading" : "A warning about rejecting Jesus?"
         },
         {
            "alt_text" : "Slide 2: The strongest Christian case.",
            "body" : "It quotes the prophet promise and tells listeners they must hear him. This is not a modern connection.",
            "heading" : "Acts makes the link explicit"
         },
         {
            "alt_text" : "Slide 3: The material change in the quotation.",
            "body" : "Deuteronomy says God will demand an account. Acts says nonlisteners will be cut off. It is a forceful rereading, not an exact prediction.",
            "heading" : "But Acts changes the wording"
         }
      ],
      "scripture_excerpt" : "I will hold accountable anyone who does not listen to My words that the prophet speaks in My name.",
      "title" : "The warning about the Prophet",
      "website" : {
         "christian_case" : "Acts directly quotes the prophet promise during a speech about Jesus and warns listeners not to reject him. This is an explicit early Christian identification, not a modern guess.",
         "critical_case" : "Deuteronomy says God will hold a nonlistener accountable; Acts says that person will be completely cut off. The original law may govern a succession of prophets. Acts is interpreting and combining Scripture, not simply reporting a uniquely exact prediction.",
         "description" : "Did Moses predict judgment for rejecting Jesus?",
         "summary" : "Acts explicitly applies Moses's warning to Jesus, but strengthens and rewords the original penalty.",
         "verdict" : "The connection to Jesus is real because Acts makes it. The stronger wording and original context make it later interpretation rather than direct forecast.",
         "verdict_label" : "Explicit Christian rereading"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-10-06",
         "author" : "Kai Akagi",
         "checked" : true,
         "id" : "src-akagi",
         "locator" : "Acts 3:22–23 and sources of the cut-off clause",
         "notes" : "Detailed current treatment of the quotation's composition.",
         "publisher" : "New Testament Studies, Cambridge University Press",
         "stance" : "both",
         "tier" : 2,
         "title" : "The Prophet like Moses and the Word of the Lord: Reassigning the Composite Citation in Acts 3.22–3",
         "type" : "journal_article",
         "url" : "https://www.cambridge.org/core/journals/new-testament-studies/article/prophet-like-moses-and-the-word-of-the-lord-reassigning-the-composite-citation-in-acts-3223/EBDDDB0C463A96669699CC0EC98DFED8"
      },
      {
         "accessed" : "2026-10-06",
         "author" : "Christoph Stenschke",
         "checked" : true,
         "id" : "src-stenschke",
         "locator" : "Acts 3 reception",
         "notes" : "Places the application within wider reception history.",
         "publisher" : "Verbum et Ecclesia",
         "stance" : "both",
         "tier" : 2,
         "title" : "The prophet like Moses (Dt 18:15–22): Some trajectories in the history of interpretation",
         "type" : "journal_article",
         "url" : "https://verbumetecclesia.org.za/index.php/ve/article/view/1962/0"
      },
      {
         "accessed" : "2026-10-06",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Deuteronomy 18:18–22; Acts 3:19–26; Leviticus 23:29",
         "notes" : "Exact wording and proposed composite source checked locally.",
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
         "Acts quotes Deuteronomy's prophet promise.",
         "It addresses Jesus's audience and consequences of refusing him.",
         "The warning coheres with Deuteronomy's demand to listen."
      ],
      "source_ids" : [
         "src-stenschke",
         "src-akagi",
         "src-bsb-v59"
      ],
      "summary" : "Unlike an inferred parallel, Acts deliberately quotes Moses and applies the warning within proclamation about Jesus. The speech treats rejecting Jesus's message as rejecting God's promised prophet, giving the Christian identification direct New Testament authority."
   },
   "textual_issues" : [
      {
         "issue" : "Acts changes 'I will hold accountable' into 'will be completely cut off from among his people,' probably through interpretive or composite citation.",
         "significance" : "material",
         "source_ids" : [
            "src-akagi",
            "src-bsb-v59"
         ]
      }
   ],
   "verdict" : {
      "category" : "retrospective_rereading",
      "confidence" : "high",
      "summary" : "Acts explicitly applies Moses's warning to its proclamation of Jesus, making the Christian connection genuine. Its altered penalty and Deuteronomy's broader prophetic context show that this is an interpretive rereading, not a uniquely worded forecast of Jesus."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
