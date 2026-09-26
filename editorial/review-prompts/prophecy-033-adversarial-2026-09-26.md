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

Seed-list wording: Suffering outside the Camp
OT reference: Leviticus 16:27
Lev.16.27: The bull for the sin offering and the goat for the sin offering, whose blood was brought into the Most Holy Place to make atonement, must be taken outside the camp; and their hides, flesh, and dung must be burned up.
NT reference: Matthew 27:33
Matt.27.33: And when they came to a place called Golgotha, which means The Place of the Skull,
NT reference: Hebrews 13:11-12
Heb.13.11: Although the high priest brings the blood of animals into the Holy Place as a sacrifice for sin, the bodies are burned outside the camp.
Heb.13.12: And so Jesus also suffered outside the city gate, to sanctify the people by His own blood.

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Leviticus 16:27's requirement that Day of Atonement carcasses be burned outside the camp prefigures Jesus suffering outside Jerusalem, as interpreted in Hebrews 13:11–12.",
      "scope_notes" : "Hebrews explicitly draws the analogy. Matthew 27:33 locates Golgotha but does not cite Leviticus.",
      "type" : "nt_typology"
   },
   "claim_id" : "prophecy-033",
   "context" : {
      "shared_context_id" : "leviticus-14-17",
      "summary" : "Leviticus requires the remains of the bull and goat whose blood entered the sanctuary to be burned outside the camp. Hebrews directly recalls that rule and compares it with Jesus suffering outside the city gate, then urges readers to go outside the camp to him and bear disgrace."
   },
   "critical_case" : {
      "reasoning" : [
         "The sequence and action differ between the carcasses and Jesus.",
         "Leviticus gives waste-disposal and ritual instructions, not a future location prediction.",
         "Hebrews's own application is theological and exhortative."
      ],
      "source_ids" : [
         "src-cambridge-heb13",
         "src-eberhart-sacrifice",
         "src-bsb-v59"
      ],
      "summary" : "Leviticus does not describe the victim suffering outside the camp: it is slaughtered first, and its remains are later taken out and burned. Jesus is alive when taken outside the gate and is executed there. Hebrews knowingly forms an analogy rather than reporting a detailed prediction, and its next verse turns 'outside the camp' into a call to accept Jesus's disgrace. The NT link is real; the claim becomes misleading only when typology is relabelled advance prophecy."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "alt_text" : "Slide 1: The shared outside location.",
            "body" : "Leviticus says sacrificial remains were burned outside the camp. Jesus was crucified outside Jerusalem.",
            "heading" : "Did “outside the camp” predict Jesus?"
         },
         {
            "alt_text" : "Slide 2: The explicit New Testament comparison.",
            "body" : "Hebrews directly compares the two scenes and says Jesus suffered outside the gate to make his people holy.",
            "heading" : "Hebrews makes the connection"
         },
         {
            "alt_text" : "Slide 3: The analogy and its limits.",
            "body" : "The animals were killed before their remains were removed. Jesus was taken outside alive. Hebrews creates a theological comparison, not a prediction hidden in Leviticus.",
            "heading" : "But the details are different"
         }
      ],
      "scripture_excerpt" : "[They] must be taken outside the camp; and their hides, flesh, and dung must be burned up.",
      "title" : "Outside the camp",
      "website" : {
         "christian_case" : "Hebrews makes the connection directly: sacrificial animals were taken outside the camp, and Jesus suffered outside the gate to sanctify his people. This is clearly more than a modern word association.",
         "critical_case" : "The Levitical animals were already dead when their remains were removed and burned. Jesus was taken outside alive and executed there. Leviticus gives ritual instructions, while Hebrews forms an analogy and uses it to call Christians to share Jesus's disgrace.",
         "description" : "Did Leviticus predict that Jesus would suffer outside Jerusalem?",
         "summary" : "Hebrews explicitly compares sacrificial remains outside the camp with Jesus outside the city gate.",
         "verdict" : "Hebrews makes the comparison meaningful. Leviticus does not independently predict the place of Jesus's death.",
         "verdict_label" : "Explicit typology, not forecast"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-09-26",
         "author" : "J. Paul Tanner",
         "checked" : true,
         "id" : "src-tanner-hebrews",
         "locator" : "Hebrews 13:11–12",
         "notes" : "Explicitly identifies Leviticus 16:27 and describes the Christian typology.",
         "publisher" : "Author publication",
         "stance" : "christian_case",
         "tier" : 2,
         "title" : "Commentary to the Epistle to the Hebrews",
         "type" : "commentary",
         "url" : "https://paultanner.org/English%20Docs/Hebrews/Hebrews%20Comm%20w%20Cover_P%20Tanner_8.15.2020.pdf"
      },
      {
         "accessed" : "2026-09-26",
         "author" : "Frederic W. Farrar",
         "checked" : true,
         "id" : "src-cambridge-heb13",
         "locator" : "Hebrews 13:11–13",
         "notes" : "Identifies the Levitical rule and follows Hebrews's movement into exhortation.",
         "publisher" : "Cambridge University Press; Bible Hub edition",
         "stance" : "critical_case",
         "tier" : 2,
         "title" : "Cambridge Bible for Schools and Colleges: Hebrews 13",
         "type" : "commentary",
         "url" : "https://biblehub.com/commentaries/cambridge/hebrews/13.htm"
      },
      {
         "accessed" : "2026-09-26",
         "author" : "Christian Eberhart",
         "checked" : true,
         "id" : "src-eberhart-sacrifice",
         "locator" : "methodological discussion of NT sacrificial imagery",
         "notes" : "Supports treating sacrificial reuse as analogy rather than forced point-by-point identity.",
         "publisher" : "St Andrews Encyclopaedia of Theology",
         "stance" : "critical_case",
         "tier" : 2,
         "title" : "Sacrifice and the New Testament",
         "type" : "reference_work",
         "url" : "https://www.saet.ac.uk/Christianity/SacrificeandtheNewTestament"
      },
      {
         "accessed" : "2026-09-26",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Leviticus 16:27; Matthew 27:33; Hebrews 13:11–13",
         "notes" : "Exact wording and sequence checked in local scripture store.",
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
         "Hebrews explicitly recalls the sacrificial bodies burned outside the camp.",
         "It immediately applies the spatial pattern to Jesus outside the gate.",
         "The following exhortation makes the comparison pastorally central."
      ],
      "source_ids" : [
         "src-tanner-hebrews",
         "src-bsb-v59"
      ],
      "summary" : "Hebrews 13:11–12 gives an explicit verbal and conceptual bridge from the Levitical animals outside the camp to Jesus outside the gate. The shared setting supports a deliberate Christian typology involving sacrificial blood, sanctification and exclusion."
   },
   "textual_issues" : [],
   "verdict" : {
      "category" : "plausible_typology_not_prediction",
      "confidence" : "high",
      "summary" : "Hebrews explicitly creates a meaningful outside-the-camp typology. Leviticus itself does not predict that the Messiah will suffer outside Jerusalem, and the correspondence is analogical rather than exact."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
