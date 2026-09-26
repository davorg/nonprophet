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

Seed-list wording: The serpent on a pole-Christ lifted up
OT reference: Numbers 21:9
Num.21.9: So Moses made a bronze snake and mounted it on a pole. If anyone who was bitten looked at the bronze snake, he would live.
NT reference: John 3:14-18
John.3.14: Just as Moses lifted up the snake in the wilderness, so the Son of Man must be lifted up,
John.3.15: that everyone who believes in Him may have eternal life.
  Note: Or everyone who believes may have eternal life in Him.
John.3.16: For God so loved the world that He gave His one and only Son, that everyone who believes in Him shall not perish but have eternal life.
  Note: Or only begotten or unique; also in verse 18
John.3.17: For God did not send His Son into the world to condemn the world, but to save the world through Him.
John.3.18: Whoever believes in Him is not condemned, but whoever does not believe has already been condemned, because he has not believed in the name of God’s one and only Son.
NT reference: John 12:32
John.12.32: And I, when I am lifted up from the earth, will draw everyone to Myself.”

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "The bronze snake raised on a pole in Numbers 21:9 prefigures Christ being lifted up so believers receive eternal life, as John 3:14–15 explicitly teaches.",
      "scope_notes" : "John itself supplies the comparison. 'Lifted up' in John carries both crucifixion and exaltation resonance.",
      "type" : "nt_typology"
   },
   "claim_id" : "prophecy-038",
   "context" : {
      "shared_context_id" : "leviticus-23-numbers-9-24-deuteronomy-18",
      "summary" : "After Israelites complain and are bitten by snakes, God provides a bronze snake; those who look at it live. John directly compares Moses lifting the snake with the Son of Man being lifted up so believers receive eternal life. John 12 explains lifted up with reference to Jesus's death."
   },
   "critical_case" : {
      "reasoning" : [
         "Numbers has a complete meaning in its wilderness setting.",
         "John draws an analogy rather than claiming every detail corresponds.",
         "Later explicit application establishes reception, not original predictive intent."
      ],
      "source_ids" : [
         "src-icc-john3",
         "src-bsb-v59"
      ],
      "summary" : "Numbers explains a crisis and cure during Israel's wilderness journey; it never announces a future Messiah or crucifixion. The correspondences are also selective: Jesus is a person, not a bronze object, and Christian salvation differs from recovery from snakebite. John deliberately rereads the story as a pattern. That makes the typology strong within Christian theology, but does not turn Numbers's original narrative into a direct prediction."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "alt_text" : "Slide 1: The bronze snake and Jesus comparison.",
            "body" : "Moses raises a bronze snake so bitten Israelites can look and live. Jesus says the Son of Man must be lifted up too.",
            "heading" : "Is Jesus the raised bronze snake?"
         },
         {
            "alt_text" : "Slide 2: The explicit New Testament typology.",
            "body" : "John repeats “lifted up” and compares rescue from snakebite with eternal life through belief in Jesus.",
            "heading" : "Jesus makes the connection"
         },
         {
            "alt_text" : "Slide 3: The original narrative and later meaning.",
            "body" : "Numbers describes a past emergency and cure. John later turns it into a pattern for Jesus’s death and exaltation.",
            "heading" : "But Numbers predicts nothing"
         }
      ],
      "scripture_excerpt" : "Moses made a bronze snake and mounted it on a pole. If anyone who was bitten looked at the bronze snake, he would live.",
      "title" : "The snake on the pole",
      "website" : {
         "christian_case" : "John makes the comparison himself. In both stories, something is lifted up and people facing death receive life by turning to it. Elsewhere John uses the same phrase for Jesus's death.",
         "critical_case" : "Numbers tells how Israelites survived snakebites and never mentions a future Messiah. John selects parts of that earlier rescue and gives them a new Christian meaning; the many differences show that this is a theological pattern, not a literal forecast.",
         "description" : "Did the bronze snake predict Jesus being lifted up?",
         "summary" : "John directly compares the raised bronze snake with Jesus being lifted up to bring eternal life.",
         "verdict" : "John's connection is explicit and meaningful. The original Numbers story is still a past rescue, not an advance description of Jesus.",
         "verdict_label" : "Powerful typology, not prediction"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-09-26",
         "author" : "J. H. Bernard",
         "checked" : true,
         "id" : "src-icc-john3",
         "locator" : "John 3:14–15",
         "notes" : "Treats the explicit Numbers allusion while warning against expanding every detail into correspondence.",
         "publisher" : "T&T Clark; Bible Hub edition",
         "stance" : "both",
         "tier" : 2,
         "title" : "International Critical Commentary: John 3",
         "type" : "commentary",
         "url" : "https://biblehub.com/commentaries/icc/john/3.htm"
      },
      {
         "accessed" : "2026-09-26",
         "author" : "NET Bible translators",
         "checked" : true,
         "id" : "src-net-john3",
         "locator" : "study note on Numbers 21:5–9",
         "notes" : "Identifies the direct allusion.",
         "publisher" : "Biblical Studies Press",
         "stance" : "christian_case",
         "tier" : 2,
         "title" : "NET Bible notes: John 3:14",
         "type" : "translation_notes",
         "url" : "https://classic.net.bible.org/verse.php?book=Joh&chapter=3&verse=14"
      },
      {
         "accessed" : "2026-09-26",
         "author" : "United Bible Societies contributors",
         "checked" : true,
         "id" : "src-translation-john3",
         "locator" : "discussion of 'lifted up'",
         "notes" : "Explains the double reference to cross and glory in John's wording.",
         "publisher" : "Translation Insights and Perspectives",
         "stance" : "critical_case",
         "tier" : 2,
         "title" : "Translation commentary on John 3:14",
         "type" : "translation_commentary",
         "url" : "https://tips.translation.bible/story/translation-commentary-on-john-314/"
      },
      {
         "accessed" : "2026-09-26",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Numbers 21:4–9; John 3:14–18; 12:32–33",
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
         "John expressly introduces the Numbers scene.",
         "The lifted object mediates life in both narratives.",
         "John's repeated lifted-up language connects the saying to Jesus's death and exaltation."
      ],
      "source_ids" : [
         "src-icc-john3",
         "src-net-john3",
         "src-bsb-v59"
      ],
      "summary" : "This is explicit New Testament typology, not a similarity invented later. John names Moses's action, repeats 'lifted up,' and parallels physical rescue through looking with eternal life through believing. The surprising snake image strengthens rather than weakens the deliberate comparison."
   },
   "textual_issues" : [
      {
         "issue" : "John's verb 'lifted up' can refer simultaneously to crucifixion and exaltation; reducing it to physical placement on a pole misses the Gospel's wordplay.",
         "significance" : "material",
         "source_ids" : [
            "src-translation-john3",
            "src-bsb-v59"
         ]
      }
   ],
   "verdict" : {
      "category" : "plausible_typology_not_prediction",
      "confidence" : "high",
      "summary" : "John explicitly and powerfully turns the bronze snake into a pattern for Jesus's saving death and exaltation. Numbers narrates a past rescue rather than forecasting Jesus."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
