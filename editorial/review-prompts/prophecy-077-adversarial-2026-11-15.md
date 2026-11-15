Generated /home/dave/git/nonprophet/scripts/../editorial/review-prompts/prophecy-077-adversarial-2026-11-15.md (8398 bytes; roughly 2100 tokens)
 provider/model identity and date.

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

Seed-list wording: They shoot out the lip and shake the head
OT reference: Psalms 22:7
Ps.22.7: All who see me mock me; they sneer and shake their heads:
NT reference: Matthew 27:39-44
Matt.27.39: And those who passed by heaped abuse on Him, shaking their heads
Matt.27.40: and saying, “You who are going to destroy the temple and rebuild it in three days, save Yourself! If You are the Son of God, come down from the cross!”
Matt.27.41: In the same way, the chief priests, scribes, and elders mocked Him, saying,
Matt.27.42: “He saved others, but He cannot save Himself. He is the King of Israel! Let Him come down now from the cross, and we will believe in Him.
Matt.27.43: He trusts in God. Let God deliver Him now if He wants Him. For He said, ‘I am the Son of God.’”
  Note: Psalm 22:8
Matt.27.44: In the same way, even the robbers who were crucified with Him berated Him.

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Psalm 22:7 predicted onlookers mocking Jesus and shaking their heads at the crucifixion, as Matthew 27:39–44 reports.",
      "scope_notes" : "Matthew's wording closely echoes the psalm within a passion narrative shaped by Psalm 22.",
      "type" : "nt_rereading"
   },
   "claim_id" : "prophecy-077",
   "context" : {
      "shared_context_id" : "psalms-16-22",
      "summary" : "Psalm 22's sufferer is publicly mocked by everyone who sees him; they sneer and shake their heads. Matthew describes passers-by abusing the crucified Jesus while shaking their heads, followed by leaders and robbers mocking him."
   },
   "critical_case" : {
      "reasoning" : [
         "The gesture is not unique to crucifixion.",
         "The psalm uses present first-person lament.",
         "Literary dependence explains the close wording."
      ],
      "source_ids" : [
         "src-van-aarde-ps22",
         "src-lange-ps22",
         "src-bsb-v59"
      ],
      "summary" : "Mocking and head-shaking are conventional gestures of contempt, and Psalm 22 describes the speaker's own experience rather than announcing a future one. Matthew deliberately scripts the scene in psalmic language. That is strong reception and typology, but the match cannot serve as independent evidence when the later account is itself shaped by the source."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "body" : "The psalmist is mocked by people shaking their heads. Matthew describes passers-by doing the same to Jesus.",
            "heading" : "Did Psalm 22 predict Jesus’s mockers?"
         },
         {
            "body" : "Matthew uses more Psalm 22 language throughout the scene. Jesus is presented as its suffering figure.",
            "heading" : "The match is deliberate"
         },
         {
            "body" : "The original is a sufferer’s present prayer. Literary reuse explains why Matthew’s later account matches it so closely.",
            "heading" : "But Matthew knows the psalm"
         }
      ],
      "scripture_excerpt" : "All who see me mock me; they sneer and shake their heads.",
      "title" : "Mocked with shaking heads",
      "website" : {
         "christian_case" : "Passers-by abuse Jesus while shaking their heads, then other groups mock him. Together with nearby Psalm 22 echoes, the connection is unmistakable.",
         "critical_case" : "The psalm describes a sufferer's present experience, and head-shaking is a common contempt gesture. Matthew's use of the psalm itself explains the close match.",
         "description" : "Did Psalm 22 predict people mocking Jesus and shaking their heads?",
         "summary" : "Matthew deliberately recreates the psalm's scene around Jesus, but literary reuse is not independent prediction evidence.",
         "verdict" : "Matthew clearly presents Jesus as Psalm 22's righteous sufferer. This is powerful retrospective identification rather than a future event plainly forecast by the psalm.",
         "verdict_label" : "A strong narrative reenactment"
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
         "locator" : "mockery in Matthew 27",
         "notes" : "Matthew uses psalmic language for the passion narrative.",
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
         "locator" : "mockery and head-shaking",
         "notes" : "Identifies this as a major Psalm 22 passion link.",
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
         "locator" : "Psalm 22:7–8; Matthew 27:39–46",
         "notes" : "Close wording checked locally.",
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
         "The verbal and physical details closely match.",
         "Several groups fulfil the universal mockery motif.",
         "Recurring Psalm 22 echoes establish literary intention."
      ],
      "source_ids" : [
         "src-van-aarde-ps22",
         "src-lange-ps22",
         "src-bsb-v59"
      ],
      "summary" : "The combination of public mockery, passers-by and head-shaking is distinctive, and Matthew uses further Psalm 22 language in the same scene. The narrative correspondence is deliberate, presenting Jesus as the righteous sufferer the psalm portrays."
   },
   "textual_issues" : [],
   "verdict" : {
      "category" : "retrospective_rereading",
      "confidence" : "high",
      "summary" : "Matthew deliberately depicts Jesus through Psalm 22's mocked sufferer, and the match is strong. The psalm does not state a future forecast, while Matthew's dependence on it explains the narrative correspondence."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
