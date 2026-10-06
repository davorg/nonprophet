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

Seed-list wording: Cursed is he that hangs on a tree
OT reference: Deuteronomy 21:23
Deut.21.23: you must not leave the body on the tree overnight, but you must be sure to bury him that day, because anyone who is hung on a tree is under God’s curse. You must not defile the land that the LORD your God is giving you as an inheritance.
  Note: LXX; Hebrew anyone who is hanged is under God’s curse; cited in Galatians 3:13
NT reference: Galatians 3:10-13
Gal.3.10: All who rely on works of the law are under a curse. For it is written: “Cursed is everyone who does not continue to do everything written in the Book of the Law.”
  Note: Deuteronomy 27:26 (see also LXX)
Gal.3.11: Now it is clear that no one is justified before God by the law, because, “The righteous will live by faith.”
  Note: Habakkuk 2:4
Gal.3.12: The law, however, is not based on faith; on the contrary, “The man who does these things will live by them.”
  Note: Leviticus 18:5; see also Ezekiel 20:11, 13, and 21.
Gal.3.13: Christ redeemed us from the curse of the law by becoming a curse for us. For it is written: “Cursed is everyone who is hung on a tree.”
  Note: Deuteronomy 21:23 (see also LXX)

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Deuteronomy 21:23's statement that a person hung on wood is under God's curse predicted Christ bearing the law's curse through crucifixion, as Paul teaches in Galatians 3:13.",
      "scope_notes" : "Paul explicitly quotes the verse. Deuteronomy describes display and prompt burial of an executed criminal, not crucifixion as a future messianic death.",
      "type" : "nt_rereading"
   },
   "claim_id" : "prophecy-044",
   "context" : {
      "shared_context_id" : "deuteronomy-18-21-joshua-5",
      "summary" : "Deuteronomy requires the corpse of an executed offender displayed on wood to be buried the same day because it is under God's curse and would defile the land. By the Second Temple period, the text could be applied to suspension of living people. Paul quotes it to explain Christ becoming a curse through crucifixion and redeeming others from the law's curse."
   },
   "critical_case" : {
      "reasoning" : [
         "The execution sequence and subject differ.",
         "Paul grammatically adapts the citation.",
         "The transfer of curse to a redeeming innocent comes from Paul's argument, not Deuteronomy 21."
      ],
      "source_ids" : [
         "src-o-brien",
         "src-retrodiction",
         "src-cambridge-deut21",
         "src-bsb-v59"
      ],
      "summary" : "Deuteronomy regulates treatment of a person already executed for a capital offence; it does not predict that a righteous Messiah will be crucified or bear others' curse. Paul adapts the wording, drops 'of God,' and combines it with his argument from Deuteronomy 27:26. Scholarship describes this as creative rereading or retrodiction as well as typology. The Christian theology is clearly Pauline, but it is not the original rule's explicit prospective meaning."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "alt_text" : "Slide 1: The curse and crucifixion connection.",
            "body" : "Deuteronomy calls a body hung on wood cursed by God. Paul says Jesus became a curse for others by hanging on a cross.",
            "heading" : "Did this curse predict the cross?"
         },
         {
            "alt_text" : "Slide 2: The explicit Pauline argument.",
            "body" : "He quotes Deuteronomy directly and uses it to explain how Jesus redeems people from the law’s curse.",
            "heading" : "Paul makes the connection"
         },
         {
            "alt_text" : "Slide 3: The original law and later typology.",
            "body" : "Deuteronomy orders burial of an executed criminal’s displayed body. Paul gives that old rule a new meaning for the cross.",
            "heading" : "But the law predicts nothing"
         }
      ],
      "scripture_excerpt" : "anyone who is hung on a tree is under God’s curse.",
      "title" : "Cursed on a tree",
      "website" : {
         "christian_case" : "Paul directly quotes this verse and makes it central to his explanation of the cross. Jesus takes the cursed position of a lawbreaker in order to redeem others from the law's curse.",
         "critical_case" : "Deuteronomy concerns prompt burial after an offender has been executed and displayed. It predicts neither crucifixion nor a righteous Messiah bearing another person's curse. Paul adapts the wording and gives the rule a new theological role.",
         "description" : "Did Deuteronomy predict Jesus becoming a curse on the cross?",
         "summary" : "Paul explicitly applies a law about a displayed criminal's corpse to Jesus's crucifixion and redemptive death.",
         "verdict" : "Paul's Christian interpretation is explicit and substantial. The original burial law does not independently predict Jesus's death.",
         "verdict_label" : "Strong typology, not forecast"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-10-06",
         "author" : "Kelli S. O'Brien",
         "checked" : true,
         "id" : "src-o-brien",
         "locator" : "argument and citation analysis",
         "notes" : "Specialist treatment of Paul's use of the curse text.",
         "publisher" : "Journal for the Study of the New Testament",
         "stance" : "both",
         "tier" : 2,
         "title" : "The Curse of the Law (Galatians 3.13): Crucifixion, Persecution, and Deuteronomy 21.22–23",
         "type" : "journal_article",
         "url" : "https://journals.sagepub.com/doi/10.1177/0142064X06068383"
      },
      {
         "accessed" : "2026-10-06",
         "author" : "Jason S. DeRouchie",
         "checked" : true,
         "id" : "src-sbjt",
         "locator" : "thesis and Galatians 3:13 sections",
         "notes" : "Strong evangelical defence of divinely intended typology.",
         "publisher" : "Southern Baptist Journal of Theology",
         "stance" : "christian_case",
         "tier" : 3,
         "title" : "Anyone Hung Upon a Pole Is Under God's Curse",
         "type" : "journal_article",
         "url" : "https://equip.sbts.edu/publications/journals/journal-of-theology/anyone-hung-upon-a-pole-is-under-gods-curse-deuteronomy-2122-23-in-old-and-new-covenant-contexts/"
      },
      {
         "accessed" : "2026-10-06",
         "author" : "Gerhard van den Heever",
         "checked" : true,
         "id" : "src-retrodiction",
         "locator" : "Deuteronomy 21:23 in Galatians",
         "notes" : "Frames Paul's use as retrospective construction.",
         "publisher" : "HTS Teologiese Studies",
         "stance" : "critical_case",
         "tier" : 2,
         "title" : "Retrodiction of the Old Testament in the New",
         "type" : "journal_article",
         "url" : "https://www.scielo.org.za/scielo.php?pid=S0259-94222015000100078&script=sci_arttext"
      },
      {
         "accessed" : "2026-10-06",
         "author" : "George Adam Smith",
         "checked" : true,
         "id" : "src-cambridge-deut21",
         "locator" : "Deuteronomy 21:22–23",
         "notes" : "Explains the original corpse-display and land-defilement rule.",
         "publisher" : "Cambridge University Press; Bible Hub edition",
         "stance" : "critical_case",
         "tier" : 2,
         "title" : "Cambridge Bible: Deuteronomy 21",
         "type" : "commentary",
         "url" : "https://biblehub.com/commentaries/cambridge/deuteronomy/21.htm"
      },
      {
         "accessed" : "2026-10-06",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Deuteronomy 21:22–23; 27:26; Galatians 3:10–14",
         "notes" : "Exact wording and translation note checked locally.",
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
         "Paul directly quotes Deuteronomy 21:23.",
         "Wooden suspension gives a real conceptual bridge to crucifixion.",
         "The application explains a theological problem posed by Jesus's shameful death."
      ],
      "source_ids" : [
         "src-o-brien",
         "src-sbjt",
         "src-bsb-v59"
      ],
      "summary" : "Paul's link is explicit and central to his argument, not based on a loose resemblance. A cross is wooden suspension, and Jewish interpretation had already extended the Deuteronomic language toward live hanging. Paul sees Christ willingly occupying the cursed covenant-breaker's position to redeem others."
   },
   "textual_issues" : [
      {
         "issue" : "The Hebrew can mean a curse of or by God; Paul omits that phrase and adjusts the Greek wording to join this verse with the curse in Deuteronomy 27:26.",
         "significance" : "material",
         "source_ids" : [
            "src-o-brien",
            "src-bsb-v59"
         ]
      }
   ],
   "verdict" : {
      "category" : "plausible_typology_not_prediction",
      "confidence" : "high",
      "summary" : "Paul deliberately and powerfully rereads the cursed displayed body through Jesus's crucifixion. Deuteronomy's burial law does not itself predict a Messiah, crucifixion or substitutionary curse-bearing."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
