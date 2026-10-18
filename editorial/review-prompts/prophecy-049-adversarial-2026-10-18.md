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

Seed-list wording: David’s Seed
OT reference: 2 Samuel 7:12
2Sam.7.12: And when your days are fulfilled and you rest with your fathers, I will raise up your descendant after you, who will come from your own body, and I will establish his kingdom.
NT reference: Matthew 1:1
Matt.1.1: This is the record of the genealogy of Jesus Christ, the son of David, the son of Abraham:

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "God's promise to raise David's bodily descendant in 2 Samuel 7:12 predicted Jesus as the son of David named in Matthew 1:1.",
      "scope_notes" : "The immediate descendant is Solomon, but the oracle also establishes a continuing Davidic dynasty that later Jewish and Christian messianism could extend.",
      "type" : "direct_prediction"
   },
   "claim_id" : "prophecy-049",
   "context" : {
      "shared_context_id" : "ruth-4-1-samuel-2-2-samuel-7",
      "summary" : "David proposes to build a temple, but Nathan's oracle reverses the plan: God will build David a house or dynasty. After David dies, his bodily descendant will reign, build God's house and be treated as God's son. The narrative and Chronicles identify Solomon as the temple-building heir, while the enduring dynasty generated wider royal hope."
   },
   "critical_case" : {
      "reasoning" : [
         "The surrounding details match Solomon directly.",
         "Davidic ancestry is a qualification, not a unique identifier.",
         "Matthew calls Jesus son of David but does not quote this verse here."
      ],
      "source_ids" : [
         "src-workingpreacher-solomon",
         "src-torah-solomon",
         "src-bsb-v59"
      ],
      "summary" : "The verse's nearest and clearest referent is Solomon: he comes from David's body, succeeds him and builds the temple. Matthew's genealogy asserts that Jesus belongs to the same dynasty, but descent from David was shared by many people and does not by itself identify one descendant as the promised king. The Christian claim works through the wider covenant, not by replacing Solomon in verse 12."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "body" : "God says David’s own descendant will rule after him. Matthew opens by calling Jesus the son of David.",
            "heading" : "Did God promise Jesus to David?"
         },
         {
            "body" : "Matthew traces Jesus through David and Solomon. Christians see him as the final king promised to David’s family.",
            "heading" : "The Davidic link is deliberate"
         },
         {
            "body" : "Solomon succeeds David and builds the temple mentioned next. Davidic ancestry alone does not identify one descendant.",
            "heading" : "But Solomon comes first"
         }
      ],
      "scripture_excerpt" : "I will raise up your descendant after you, who will come from your own body.",
      "title" : "David's promised descendant",
      "website" : {
         "christian_case" : "Matthew opens by calling Jesus the son of David and traces his family through Solomon. The promise of David's royal house became a major foundation for hope in a future Messiah.",
         "critical_case" : "Solomon is the descendant who succeeds David and builds the temple described in the next verse. Many people could claim Davidic ancestry, so that fact alone does not uniquely identify Jesus.",
         "description" : "Did God's promise of David's descendant predict Jesus?",
         "summary" : "The promise immediately points to Solomon and also establishes the dynasty in which Matthew deliberately places Jesus.",
         "verdict" : "The verse directly promises Solomon and, more broadly, David's royal line. Applying that larger promise to Jesus is plausible, but it is not a one-person identification by itself.",
         "verdict_label" : "A genuine dynastic promise"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-10-18",
         "author" : "Christopher T. Holmes",
         "checked" : true,
         "id" : "src-workingpreacher-solomon",
         "locator" : "1 Kings 2:10–12",
         "notes" : "Explicitly identifies Solomon's accession as fulfilment of 2 Samuel 7:12.",
         "publisher" : "Working Preacher, Luther Seminary",
         "stance" : "critical_case",
         "tier" : 2,
         "title" : "Commentary on 1 Kings 2:10–12; 3:3–14",
         "type" : "commentary",
         "url" : "https://www.workingpreacher.org/commentaries/revised-common-lectionary/ordinary-20-2/commentary-on-1-kings-210-12-33-14-6"
      },
      {
         "accessed" : "2026-10-18",
         "author" : "Sara Milstein",
         "checked" : true,
         "id" : "src-torah-solomon",
         "locator" : "discussion of Solomon and 2 Samuel 7",
         "notes" : "Identifies Solomon as the biological heir who fulfils the promise.",
         "publisher" : "TheTorah.com",
         "stance" : "critical_case",
         "tier" : 2,
         "title" : "Of Lambs and Lambasting: The Message of Nathan's Parable to David",
         "type" : "article",
         "url" : "https://www.thetorah.com/article/of-lambs-and-lambasting-the-message-in-nathans-parable-to-david"
      },
      {
         "accessed" : "2026-10-18",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "2 Samuel 7:8–16; 1 Kings 2:10–12; Matthew 1:1–16",
         "notes" : "Exact covenant, succession and genealogy wording checked locally.",
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
         "Matthew explicitly claims Davidic descent for Jesus.",
         "The promise creates an enduring royal line rather than an isolated resemblance.",
         "Later messianic expectation legitimately grows from the Davidic covenant."
      ],
      "source_ids" : [
         "src-workingpreacher-solomon",
         "src-torah-solomon",
         "src-bsb-v59"
      ],
      "summary" : "Matthew deliberately opens by calling Jesus son of David and traces his line through Solomon. Jesus therefore fits the promised dynasty, and the covenant became a foundational source of Jewish hope for a future Davidic ruler after the historical monarchy failed."
   },
   "textual_issues" : [],
   "verdict" : {
      "category" : "plausible_prediction",
      "confidence" : "medium",
      "summary" : "Second Samuel 7 establishes the Davidic dynasty and immediately promises Solomon. Matthew deliberately places Jesus in that line, making the wider messianic application plausible, though Davidic descent alone cannot uniquely identify him."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
