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

Seed-list wording: The Drink-offering: "If any man thirst"
OT reference: Leviticus 23:36-37
Lev.23.36: For seven days you are to present a food offering to the LORD. On the eighth day you are to hold a sacred assembly and present a food offering to the LORD. It is a solemn assembly; you must not do any regular work.
Lev.23.37: These are the LORD’s appointed feasts, which you are to proclaim as sacred assemblies for presenting food offerings to the LORD — burnt offerings and grain offerings, sacrifices and drink offerings, each on its designated day.
NT reference: John 7:37
John.7.37: On the last and greatest day of the feast, Jesus stood up and called out in a loud voice, “If anyone is thirsty, let him come to Me and drink.

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "The drink offerings prescribed for the Feast of Tabernacles in Leviticus 23:36–37 predicted Jesus's invitation, 'If anyone is thirsty, let him come to me and drink,' in John 7:37.",
      "scope_notes" : "John's saying occurs at the festival and may engage a later water-pouring ceremony. Levitical drink offerings were libations offered to God, not drinks offered to thirsty worshippers.",
      "type" : "source_error"
   },
   "claim_id" : "prophecy-036",
   "context" : {
      "shared_context_id" : "leviticus-23-numbers-9-24-deuteronomy-18",
      "summary" : "Leviticus lists sacred assemblies and offerings for Israel's festivals, including drink offerings. John places Jesus at the Feast of Tabernacles, where a later-attested water-pouring ceremony provides a plausible setting for his invitation. John immediately explains the living water as the Spirit."
   },
   "critical_case" : {
      "reasoning" : [
         "The recipient and purpose of the two drinks differ.",
         "The water ceremony is not commanded in these Leviticus verses.",
         "John's imagery has several plausible scriptural backgrounds."
      ],
      "source_ids" : [
         "src-peake-john7",
         "src-icc-john7",
         "src-bsb-v59"
      ],
      "summary" : "Leviticus 23:36–37 does not describe the later water-drawing ceremony or an invitation to drink. Its drink offering is a libation presented to God alongside sacrifices. John's water imagery may engage the festival ceremony, Isaiah's invitation to the thirsty, wilderness-water traditions, or several of these together. The setting produces meaningful Christian symbolism, but the inherited equation between the Levitical drink offering and Jesus's words confuses different actions."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "alt_text" : "Slide 1: The claimed link between two kinds of drink.",
            "body" : "Leviticus lists drink offerings at a festival. During that festival, Jesus invites thirsty people to come to him and drink.",
            "heading" : "Did a drink offering predict Jesus?"
         },
         {
            "alt_text" : "Slide 2: The strongest festival connection.",
            "body" : "The festival later included a water-pouring ceremony. Jesus uses that powerful setting to present himself as the source of living water and God’s Spirit.",
            "heading" : "Why the setting matters"
         },
         {
            "alt_text" : "Slide 3: The two actions are distinguished.",
            "body" : "Leviticus’s drink offering was poured out to God. Jesus offers living water to people. The festival link is real, but this ritual is not a prediction.",
            "heading" : "But these are different drinks"
         }
      ],
      "scripture_excerpt" : "burnt offerings and grain offerings, sacrifices and drink offerings, each on its designated day.",
      "title" : "The festival drink offering",
      "website" : {
         "christian_case" : "John places Jesus's invitation on the festival's climactic day. A well-known Temple water ceremony probably formed the backdrop, making Jesus's claim to provide living water and the Spirit especially powerful.",
         "critical_case" : "Leviticus's drink offering was a libation presented to God, not water given to thirsty people. These verses do not prescribe the later water ceremony, and Jesus's words also echo other passages about living water.",
         "description" : "Did a Levitical drink offering predict Jesus offering living water?",
         "summary" : "Jesus offers living water at a festival whose sacrifices included drink offerings, but the rituals are not the same.",
         "verdict" : "The festival setting matters, but Leviticus's drink offering does not predict Jesus's invitation.",
         "verdict_label" : "The rituals have been confused"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-09-26",
         "author" : "A. Plummer",
         "checked" : true,
         "id" : "src-cambridge-john7",
         "locator" : "John 7:37 and festival water ceremony",
         "notes" : "Discusses the disputed festival day and later water-pouring custom.",
         "publisher" : "Cambridge University Press; BibliaPlus edition",
         "stance" : "both",
         "tier" : 2,
         "title" : "Cambridge Greek Testament Commentary: John 7:37",
         "type" : "commentary",
         "url" : "https://www.bibliaplus.org/en/commentaries/236/cambridge-greek-testament-for-schools-and-colleges-commentary/john/7/37"
      },
      {
         "accessed" : "2026-09-26",
         "author" : "J. H. Bernard",
         "checked" : true,
         "id" : "src-icc-john7",
         "locator" : "John 7:37–39",
         "notes" : "Connects the saying with the ceremony while identifying Isaiah and other living-water backgrounds.",
         "publisher" : "T&T Clark; Bible Hub edition",
         "stance" : "both",
         "tier" : 2,
         "title" : "International Critical Commentary: John 7",
         "type" : "commentary",
         "url" : "https://biblehub.com/commentaries/icc/john/7.htm"
      },
      {
         "accessed" : "2026-09-26",
         "author" : "Arthur S. Peake, editor",
         "checked" : true,
         "id" : "src-peake-john7",
         "locator" : "John 7:37–39",
         "notes" : "Distinguishes the festival setting and water tradition from the Levitical prescription.",
         "publisher" : "Thomas Nelson; BibliaPlus edition",
         "stance" : "critical_case",
         "tier" : 2,
         "title" : "Peake's Commentary on John 7:37–52",
         "type" : "commentary",
         "url" : "https://www.bibliaplus.org/en/commentaries/144/arthur-peakes-commentary-on-the-bible/john/7/37-52"
      },
      {
         "accessed" : "2026-09-26",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Leviticus 23:36–37; John 7:37–39; Isaiah 55:1",
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
         "John explicitly locates the saying at this festival.",
         "Ancient festival tradition included a prominent water libation.",
         "Jesus's public offer interprets the festival through himself."
      ],
      "source_ids" : [
         "src-icc-john7",
         "src-cambridge-john7",
         "src-bsb-v59"
      ],
      "summary" : "John deliberately dates Jesus's invitation to the climactic day of the festival established in Leviticus. The Temple water ceremony likely made his claim vivid: Jesus presents himself as the source of the living water and Spirit anticipated by the feast's prayers and prophetic readings."
   },
   "textual_issues" : [
      {
         "issue" : "The 'greatest day' may be the seventh or eighth day, and the water ceremony is not itself specified in Leviticus 23:36–37.",
         "significance" : "material",
         "source_ids" : [
            "src-cambridge-john7",
            "src-bsb-v59"
         ]
      }
   ],
   "verdict" : {
      "category" : "source_claim_incorrect",
      "confidence" : "high",
      "summary" : "John meaningfully places Jesus's living-water invitation at Tabernacles, but Leviticus's drink offering is a libation to God, not the water Jesus offers. The specific equation misstates the ritual."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
