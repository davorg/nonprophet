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

Seed-list wording: The Resurrection predicted
OT reference: Job 19:23-27
Job.19.23: I wish that my words were recorded and inscribed in a book,
Job.19.24: by an iron stylus on lead, or chiseled in stone forever.
Job.19.25: But I know that my Redeemer lives, and in the end He will stand upon the earth.
  Note: Or Vindicator
  Note: Or on my grave
Job.19.26: Even after my skin has been destroyed, yet in my flesh I will see God.
  Note: Or without my flesh
Job.19.27: I will see Him for myself; my eyes will behold Him, and not as a stranger. How my heart yearns within me!
  Note: Hebrew my kidneys yearn
NT reference: John 5:24-29
John.5.24: Truly, truly, I tell you, whoever hears My word and believes Him who sent Me has eternal life and will not come under judgment. Indeed, he has crossed over from death to life.
John.5.25: Truly, truly, I tell you, the hour is coming and has now come when the dead will hear the voice of the Son of God, and those who hear will live.
John.5.26: For as the Father has life in Himself, so also He has granted the Son to have life in Himself.
John.5.27: And He has given Him authority to execute judgment, because He is the Son of Man.
John.5.28: Do not be amazed at this, for the hour is coming when all who are in their graves will hear His voice
John.5.29: and come out — those who have done good to the resurrection of life, and those who have done evil to the resurrection of judgment.
  Note: See Daniel 12:2.

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Job 19:23–27 predicted bodily resurrection, fulfilled or explained by Jesus's teaching in John 5:24–29.",
      "scope_notes" : "Job's Hebrew is exceptionally difficult and supports readings ranging from post-mortem bodily sight of God to vindication before death or apart from flesh. John does not cite Job.",
      "type" : "prediction"
   },
   "claim_id" : "prophecy-058",
   "context" : {
      "shared_context_id" : "chronicles-job-psalm-2",
      "summary" : "Abandoned by friends and convinced that God has wronged him, Job longs for permanent testimony and declares that his go'el lives and will finally stand over the dust. He expects somehow to see God himself. The syntax, condition of his body and identity of the vindicator are heavily disputed."
   },
   "critical_case" : {
      "reasoning" : [
         "Key Hebrew clauses permit sharply different translations.",
         "The desired event is personal vindication.",
         "The alleged New Testament fulfilment contains no citation or distinctive echo."
      ],
      "source_ids" : [
         "src-job-jhs",
         "src-job-hts",
         "src-peake-job",
         "src-bsb-v59"
      ],
      "summary" : "The passage is among Job's most textually and syntactically difficult. Go'el can mean Job's vindicator rather than the Christian Redeemer, and 'from/in/apart from my flesh' materially changes the sense. Job seeks vindication of his innocence; he does not describe Jesus, a general resurrection, or two outcomes of judgment. John never links its teaching to Job."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "body" : "Job says his skin may be destroyed, yet he will see God. Christians often read this as hope of bodily resurrection.",
            "heading" : "Did Job predict resurrection?"
         },
         {
            "body" : "Job stresses his flesh, his own eyes and seeing God personally. That can sound like life beyond death.",
            "heading" : "The reading has real force"
         },
         {
            "body" : "Key words can mean vindication before death, after death or apart from flesh. Job never identifies Jesus.",
            "heading" : "But the Hebrew is deeply disputed"
         }
      ],
      "scripture_excerpt" : "Even after my skin has been destroyed, yet in my flesh I will see God.",
      "title" : "I know that my Redeemer lives",
      "website" : {
         "christian_case" : "Job speaks of destroyed skin, his flesh, his own eyes and seeing God. Christians have long read this as a striking early hope of bodily resurrection.",
         "critical_case" : "Almost every key phrase is disputed. Job may expect vindication before death, after death, in flesh or apart from it. His subject is his own innocence, while John teaches a general resurrection and never cites Job.",
         "description" : "Did Job predict the resurrection taught by Jesus?",
         "summary" : "Job may hope to see God beyond death, but the Hebrew is famously difficult and does not identify Jesus or John's teaching.",
         "verdict" : "Resurrection is a serious reading, but not the only defensible one. Even on that reading, Job does not specifically predict Jesus or John's later teaching.",
         "verdict_label" : "Possible resurrection hope, uncertain text"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-11-02",
         "author" : "Journal of Hebrew Scriptures contributor",
         "checked" : true,
         "id" : "src-job-jhs",
         "locator" : "textual and syntactic analysis",
         "notes" : "Documents severe uncertainty in construing the passage and its resurrection reception.",
         "publisher" : "Journal of Hebrew Scriptures",
         "stance" : "critical_case",
         "tier" : 2,
         "title" : "Job 19:25–28 and the Difficulty of the Hebrew Text",
         "type" : "journal_article",
         "url" : "https://jhsonline.org/index.php/jhs/article/download/29342/21362/77575"
      },
      {
         "accessed" : "2026-11-02",
         "author" : "J. A. van der Zwan",
         "checked" : true,
         "id" : "src-job-hts",
         "locator" : "Job 19:25–27",
         "notes" : "Surveys redeemer, vindication and resurrection readings.",
         "publisher" : "HTS Teologiese Studies",
         "stance" : "both",
         "tier" : 2,
         "title" : "The addition of apocalyptic theology in the dialogue section of Job",
         "type" : "journal_article",
         "url" : "https://scielo.org.za/pdf/hts/v81n1/79.pdf"
      },
      {
         "accessed" : "2026-11-02",
         "author" : "Jon Paulien",
         "checked" : true,
         "id" : "src-job-resurrection-defense",
         "locator" : "Job 19:25–27",
         "notes" : "Defends bodily-resurrection significance while acknowledging the preposition problem.",
         "publisher" : "Journal of the Adventist Theological Society",
         "stance" : "christian_case",
         "tier" : 3,
         "title" : "Resurrection in the Old Testament",
         "type" : "journal_article",
         "url" : "https://www.atsjats.org/paulien-resurrection.pdf"
      },
      {
         "accessed" : "2026-11-02",
         "author" : "Arthur S. Peake",
         "checked" : true,
         "id" : "src-peake-job",
         "locator" : "Job 19:25–27",
         "notes" : "Warns that Christian resurrection reception can obscure the disputed original sense.",
         "publisher" : "The Century Bible; BiblicalStudies.org.uk edition",
         "stance" : "critical_case",
         "tier" : 2,
         "title" : "Job: The Century Bible",
         "type" : "commentary",
         "url" : "https://biblicalstudies.org.uk/pdf/e-books/peake/job_century-bible_peake.pdf"
      },
      {
         "accessed" : "2026-11-02",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Job 19:23–29; John 5:24–29",
         "notes" : "Exact displayed wording checked locally.",
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
         "Job's hope reaches beyond immediate human help.",
         "The body and personal sight receive emphasis.",
         "John supplies an explicit doctrine of resurrection."
      ],
      "source_ids" : [
         "src-job-resurrection-defense",
         "src-job-hts",
         "src-bsb-v59"
      ],
      "summary" : "The language of destroyed skin, flesh, personal eyes and seeing God can naturally express hope beyond death. Christian tradition has long heard bodily resurrection here, and Jesus in John clearly promises that the dead will leave their graves."
   },
   "textual_issues" : [
      {
         "issue" : "Job 19:25–27 has disputed syntax and possibly a disturbed text. Especially important are the identity of go'el, whether 'dust' means earth or grave, and whether Job sees God in, from, or apart from flesh.",
         "significance" : "decisive",
         "source_ids" : [
            "src-job-jhs",
            "src-job-hts",
            "src-peake-job"
         ]
      }
   ],
   "verdict" : {
      "category" : "mixed_or_indeterminate",
      "confidence" : "medium",
      "summary" : "Job may express a remarkable hope of seeing God beyond bodily destruction, making resurrection a serious reading. The Hebrew cannot securely bear the precise claim, and the passage neither identifies Jesus nor predicts John's resurrection teaching."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
