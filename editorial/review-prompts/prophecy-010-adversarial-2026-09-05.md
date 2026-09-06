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

Seed-list wording: Seed of Isaac (Gen 21:12)
OT reference: Genesis 17:19
Gen.17.19: But God replied, “Your wife Sarah will indeed bear you a son, and you are to name him Isaac. I will establish My covenant with him as an everlasting covenant for his descendants after him.
  Note: Isaac means he laughs.
NT reference: Romans 9:7
Rom.9.7: Nor because they are Abraham’s descendants are they all his children. On the contrary, “Through Isaac your offspring will be reckoned.”
  Note: Genesis 21:12

## Additional context selected by the drafting editor

Gen.17.20: As for Ishmael, I have heard you, and I will surely bless him; I will make him fruitful and multiply him greatly. He will become the father of twelve rulers, and I will make him into a great nation.
Gen.17.21: But I will establish My covenant with Isaac, whom Sarah will bear to you at this time next year.”
Gen.21.12: But God said to Abraham, “Do not be distressed about the boy and your maidservant. Listen to everything that Sarah tells you, for through Isaac your offspring will be reckoned.
  Note: Cited in Romans 9:7 and Hebrews 11:18
Rom.9.6: It is not as though God’s word has failed. For not all who are descended from Israel are Israel.
Rom.9.8: So it is not the children of the flesh who are God’s children, but it is the children of the promise who are regarded as offspring.
Rom.9.9: For this is what the promise stated: “At the appointed time I will return, and Sarah will have a son.”
  Note: Genesis 18:14
Rom.9.10: Not only that, but Rebecca’s children were conceived by one man, our father Isaac.
Rom.9.11: Yet before the twins were born or had done anything good or bad, in order that God’s plan of election might stand,
Rom.9.12: not by works but by Him who calls, she was told, “The older will serve the younger.”
  Note: Genesis 25:23
Rom.9.13: So it is written: “Jacob I loved, but Esau I hated.”
  Note: Malachi 1:2–3
Luke.3.34: the son of Jacob, the son of Isaac, the son of Abraham, the son of Terah, the son of Nahor,

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Genesis 17:19 establishes Isaac as the covenant line through which Jesus would eventually descend.",
      "scope_notes" : "The inherited wording is only ‘Seed of Isaac’ and cites Romans 9:7, which quotes Genesis 21:12 to discuss promise and election. The strongest Jesus-specific version adds Luke's genealogy; ancestry and predictive identification are assessed separately.",
      "type" : "genealogy"
   },
   "claim_id" : "prophecy-010",
   "context" : {
      "shared_context_id" : "isaac-covenant-line",
      "summary" : "God promises Abraham that Sarah will bear Isaac and that the covenant will continue with Isaac's descendants. Romans 9 cites the related Genesis 21:12 wording to distinguish children of promise from physical descent alone. Luke 3 lists Jesus in the line Jacob–Isaac–Abraham."
   },
   "critical_case" : {
      "reasoning" : [
         "The stated near-term fulfilment is Isaac's birth; the covenant is then with his plural descendants after him.",
         "Romans 9:7 quotes Genesis 21:12, not Genesis 17:19, and verses 8-13 apply the principle to children of promise and to Jacob over Esau.",
         "Neither Genesis 17 nor Romans 9 identifies a Messiah in this verse.",
         "Countless descendants belong to Isaac's line. A later genealogy can establish membership in that large class but does not show that this text predicted one particular member."
      ],
      "source_ids" : [
         "src-carson-gen17",
         "src-popovic-2006",
         "src-bsb-v59"
      ],
      "summary" : "Genesis predicts Isaac and a continuing community of descendants, not Jesus as one uniquely identifiable descendant. Romans 9 is discussing God's freedom in defining the people of promise and does not claim that Jesus fulfils Genesis 17:19. Luke supplies the later genealogy. The ancestry claim is internally explicit in Luke, but it is far too broad to operate as a distinctive prediction."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "alt_text" : "Slide one introduces the claim that Jesus fulfils the promised line through Isaac.",
            "body" : "God says Sarah will bear Isaac and establishes the covenant with his descendants. Luke later lists Jesus in the line of Jacob, Isaac and Abraham.",
            "heading" : "Did Isaac's covenant line predict Jesus?"
         },
         {
            "alt_text" : "Slide two presents the Christian case for covenant continuity through Isaac to Jesus.",
            "body" : "Genesis deliberately carries the covenant through Isaac rather than Ishmael. Romans calls Isaac's family the children of promise, and Luke explicitly locates Jesus in that same covenant ancestry.",
            "heading" : "The strongest Christian case"
         },
         {
            "alt_text" : "Slide three distinguishes a genuine genealogy from a specific predictive prophecy.",
            "body" : "Genesis predicts Isaac, then many descendants—not one named Messiah. Romans discusses who counts as God's promised people; it never calls Jesus the fulfilment of this verse. Luke establishes ancestry, but millions could share it.",
            "heading" : "Ancestry is not unique identification"
         }
      ],
      "scripture_excerpt" : "I will establish My covenant with him as an everlasting covenant for his descendants after him.",
      "title" : "Did Isaac's covenant line predict Jesus?",
      "website" : {
         "christian_case" : "Genesis does make a consequential choice: although Abraham has more than one son, God's covenant is established through Sarah's son Isaac. Romans 9 treats that promised birth as evidence that covenant membership depends on God's promise rather than physical descent alone. Luke's genealogy later places Jesus explicitly in the line Jacob–Isaac–Abraham. Christians can therefore locate Jesus within the same promised covenant history instead of treating him as detached from Israel's story. The genealogy is not invented from a vague resemblance; it states the relationship directly.",
         "critical_case" : "Genesis 17:19 first predicts Isaac's own birth and then speaks of a covenant with his descendants. It does not single out Jesus from that enormous lineage. Romans 9:7 actually quotes Genesis 21:12, and Paul's subject is God's definition of the people of promise—not Jesus's fulfilment of Genesis 17. Luke supplies the ancestry much later. If Luke's genealogy is accepted, Jesus is indeed in Isaac's line; but membership in a vast class is not a distinctive prediction of one member.",
         "description" : "A fair examination of Isaac's covenant line as a supposed prophecy of Jesus.",
         "summary" : "Jesus is listed as Isaac's descendant. Does belonging to the promised family count as fulfilled prophecy?",
         "verdict" : "Genesis genuinely makes Isaac the covenant line, and Luke explicitly includes Jesus in that ancestry. Romans uses the promise to discuss election, not to identify a messianic prediction. The genealogy claim can be true while the prophecy claim remains far too broad.",
         "verdict_label" : "True genealogy; nonspecific prophecy"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-09-05",
         "author" : "D. A. Carson",
         "checked" : true,
         "id" : "src-carson-gen17",
         "locator" : "Genesis 17 devotional",
         "notes" : "States that the covenant line passes through Isaac while Ishmael also receives blessing.",
         "publisher" : "The Gospel Coalition",
         "stance" : "christian_case",
         "tier" : 3,
         "title" : "Read the Bible: Genesis 17, Matthew 16, Nehemiah 6, and Acts 16",
         "type" : "web_article",
         "url" : "https://www.thegospelcoalition.org/devotionals/read-the-bible/genesis-17-matthew-16-nehemiah-6-acts-16/"
      },
      {
         "accessed" : "2026-09-05",
         "author" : "Anto Popović",
         "checked" : true,
         "id" : "src-popovic-2006",
         "locator" : "pp. 551-572; abstract and genealogy analysis",
         "notes" : "Analyses Luke's connection of Jesus with Abraham within salvation history.",
         "publisher" : "Bogoslovska smotra 76.3",
         "stance" : "background",
         "tier" : 1,
         "title" : "Jesus and Abraham in the Context of Luke's Genealogy (Lk 3:23-38)",
         "type" : "journal_article",
         "url" : "https://hrcak.srce.hr/index.php/23827"
      },
      {
         "accessed" : "2026-09-05",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Genesis 17:18-21; 21:12; Romans 9:6-13; Luke 3:23-38",
         "notes" : "Project display text and citation comparison.",
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
         "Genesis 17:19-21 explicitly distinguishes Isaac as the bearer of the covenant from Ishmael, who is also promised blessing and descendants.",
         "Romans 9:7-9 treats Isaac's birth as an example of God's promise determining the covenant family rather than biology alone.",
         "Luke 3:34 explicitly places Jesus's recorded genealogy through Jacob, Isaac and Abraham.",
         "As a canonical genealogy claim, this does not depend on pretending that Genesis 17 names Jesus."
      ],
      "source_ids" : [
         "src-carson-gen17",
         "src-popovic-2006",
         "src-bsb-v59"
      ],
      "summary" : "The canonical line is real and important: Genesis deliberately narrows Abraham's covenant succession to Isaac rather than Ishmael; it then runs through Jacob, Judah and David, and Luke identifies Jesus within that line. Christian theology can therefore say Jesus comes through the promised Isaac branch rather than appearing without covenantal continuity."
   },
   "textual_issues" : [
      {
         "issue" : "Romans 9:7 quotes Genesis 21:12 (‘through Isaac your offspring will be reckoned’), whereas the inherited OT citation is Genesis 17:19. The passages express the same narrowing of the covenant line but are not the same text.",
         "significance" : "material",
         "source_ids" : [
            "src-bsb-v59"
         ]
      }
   ],
   "verdict" : {
      "category" : "insufficiently_specific",
      "confidence" : "high",
      "summary" : "Genesis genuinely narrows Abraham's covenant line to Isaac, and Luke explicitly places Jesus in that ancestry. Romans uses the Isaac promise to discuss election, not to announce a Jesus prophecy. Descent through a vast lineage is a true Christian genealogy claim but not a sufficiently specific prediction of Jesus."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
