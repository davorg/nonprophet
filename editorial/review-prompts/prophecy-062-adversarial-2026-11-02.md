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

Seed-list wording: To own the title King
OT reference: Psalms 2:6
Ps.2.6: “I have installed My King on Zion, upon My holy mountain.”
NT reference: Matthew 2:2
Matt.2.2: asking, “Where is the One who has been born King of the Jews? We saw His star in the east and have come to worship Him.”
  Note: Or as it rose

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Psalm 2:6 predicted that Jesus would bear the title King, as in Matthew 2:2.",
      "scope_notes" : "Psalm 2 depicts a king installed on Zion. King is a role shared by many rulers; Matthew does not cite Psalm 2 in the Magi scene.",
      "type" : "prediction"
   },
   "claim_id" : "prophecy-062",
   "context" : {
      "shared_context_id" : "chronicles-job-psalm-2",
      "summary" : "God declares that he has installed his king on Zion despite foreign rebellion. The poem legitimates a Judean monarch and warns rival kings. Matthew's Magi ask for the newborn king of the Jews, provoking Herod's fear."
   },
   "critical_case" : {
      "reasoning" : [
         "Countless rulers bear the title.",
         "The passages describe different scenes.",
         "Matthew supplies no explicit Psalm 2 link here."
      ],
      "source_ids" : [
         "src-psalm-nicot",
         "src-torah-ps2",
         "src-bsb-v59"
      ],
      "summary" : "King is one of the least specific descriptions possible in royal literature. Psalm 2's immediate king is the monarch being installed on Zion, while Matthew's Magi do not quote this verse. The title can support a cumulative Davidic case but cannot independently predict Jesus."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "body" : "God installs His king on Zion. Matthew’s visitors later ask for the newborn King of the Jews.",
            "heading" : "Did Psalm 2 predict Jesus as King?"
         },
         {
            "body" : "Jesus is presented as David’s ruler while the hostile King Herod tries to stop him.",
            "heading" : "The royal pattern fits"
         },
         {
            "body" : "Many people carry that title. Matthew does not quote this verse, so the shared word proves little by itself.",
            "heading" : "But “king” identifies nobody"
         }
      ],
      "scripture_excerpt" : "I have installed My King on Zion.",
      "title" : "God's king on Zion",
      "website" : {
         "christian_case" : "Matthew calls Jesus King of the Jews and places him against the hostile ruler Herod. Christians see the newborn king as Psalm 2's final Davidic ruler.",
         "critical_case" : "Psalm 2 celebrates a king installed on Zion. Many rulers carry that title, and Matthew's Magi never quote this verse. The one shared word proves very little alone.",
         "description" : "Did Psalm 2 predict that Jesus would be called King?",
         "summary" : "Jesus is presented as the Jewish king, but the title is too general to identify him as Psalm 2's ruler by itself.",
         "verdict" : "Jesus fits the wider Christian reading of the royal psalm. Simply being called king is not a distinct fulfilled prediction.",
         "verdict_label" : "Too broad to identify Jesus"
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
         "locator" : "Psalm 2",
         "notes" : "Royal enthronement context.",
         "publisher" : "NICOT",
         "stance" : "both",
         "tier" : 2,
         "title" : "The Book of Psalms",
         "type" : "commentary",
         "url" : "https://www.thetbs.org/study-materials/wp-content/uploads/2023/03/The_Book_of_Psalms_New_International_Commentary_on_the_Old_Testament.pdf"
      },
      {
         "accessed" : "2026-11-02",
         "author" : "Marc Zvi Brettler",
         "checked" : true,
         "id" : "src-torah-ps2",
         "locator" : "original king and later messianic reception",
         "notes" : "Separates original monarch from later Messiah readings.",
         "publisher" : "TheTorah.com",
         "stance" : "both",
         "tier" : 2,
         "title" : "Psalm 2: Is the Messiah the Son of God?",
         "type" : "article",
         "url" : "https://www.thetorah.com/article/psalm-2-is-the-messiah-the-son-of-god"
      },
      {
         "accessed" : "2026-11-02",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Psalm 2:6; Matthew 2:1–12",
         "notes" : "Exact scenes checked locally.",
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
         "Jesus is explicitly called king of the Jews.",
         "Herod supplies a hostile-ruler setting.",
         "Psalm 2 became foundational messianic royal language."
      ],
      "source_ids" : [
         "src-psalm-nicot",
         "src-torah-ps2",
         "src-bsb-v59"
      ],
      "summary" : "Both texts concern God's chosen Jewish king in conflict with hostile rulers. Matthew's infancy story may evoke the same royal pattern, and Christian readers identify Jesus as the ultimate Davidic king celebrated by the psalm."
   },
   "textual_issues" : [],
   "verdict" : {
      "category" : "insufficiently_specific",
      "confidence" : "high",
      "summary" : "Jesus is presented as king and can plausibly be read as Psalm 2's climactic Davidic ruler. The bare title 'king' is far too general to function as a distinct prediction."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
