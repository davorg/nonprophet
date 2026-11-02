Generated /home/dave/git/nonprophet/scripts/../editorial/review-prompts/prophecy-070-adversarial-2026-11-02.md (9076 bytes; roughly 2269 tokens)
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

Seed-list wording: Was not to see corruption
OT reference: Psalms 16:10
Ps.16.10: For You will not abandon my soul to Sheol, nor will You let Your Holy One see decay.
  Note: Cited in Acts 13:35
NT reference: Acts 2:31
Acts.2.31: Foreseeing this, David spoke about the resurrection of the Christ, that He was not abandoned to Hades, nor did His body see decay.
NT reference: Acts 13:35
Acts.13.35: So also, He says in another Psalm: ‘You will not let Your Holy One see decay.’
  Note: Psalm 16:10

## Complete pre-review editorial record

```json
{
   "claim" : {
      "precise" : "Psalm 16:10 predicted that Jesus's body would not decay because he would rise from the dead, as Acts 2:31 and 13:35 teach.",
      "scope_notes" : "Acts explicitly quotes and argues from the verse twice. In its original setting the psalmist expresses confidence that God will preserve him from Sheol or premature death.",
      "type" : "nt_rereading"
   },
   "claim_id" : "prophecy-070",
   "context" : {
      "shared_context_id" : "psalms-2-16",
      "summary" : "Psalm 16 is a prayer of trust in which the speaker expects God not to abandon him to Sheol or let his faithful one see the Pit or decay. Acts quotes the verse in two resurrection sermons, argues that David did die and decay, and therefore applies the words to his promised descendant Jesus."
   },
   "critical_case" : {
      "reasoning" : [
         "The psalm contains no death-and-return narrative.",
         "Rescue from Sheol can mean preservation from death.",
         "Acts supplies the Davidic and resurrection logic."
      ],
      "source_ids" : [
         "src-cuany-ps16",
         "src-groenewald-ps16",
         "src-bsb-v59"
      ],
      "summary" : "Within Psalm 16, the speaker asks for preservation and confidently expects continued life with God; the Hebrew need not mean bodily resurrection after death. Acts builds a new Davidic argument from the Greek wording and the known contrast between David's tomb and Jesus's resurrection. The Christian interpretation is early and explicit, but retrospective."
   },
   "human_review" : {
      "questions" : [],
      "required" : false
   },
   "publication_copy" : {
      "carousel" : [
         {
            "body" : "The psalm says God will not abandon His faithful one to the grave or let him see decay.",
            "heading" : "Did Psalm 16 predict resurrection?"
         },
         {
            "body" : "Peter and Paul both quote it, contrast David’s grave with Jesus and apply it to his resurrection.",
            "heading" : "Acts makes the strongest possible case"
         },
         {
            "body" : "Its speaker trusts God to preserve his life. Dying and rising enter the passage through Acts’s later argument.",
            "heading" : "But the psalm itself describes rescue"
         }
      ],
      "scripture_excerpt" : "You will not abandon my soul to Sheol, nor will You let Your Holy One see decay.",
      "title" : "Your Holy One will not decay",
      "website" : {
         "christian_case" : "Peter and Paul both quote the verse, contrast David's decayed body with Jesus and say the psalm points to the Messiah's resurrection. The link could hardly be more explicit.",
         "critical_case" : "Psalm 16 itself describes trust that God will not abandon the speaker to death. It never narrates dying and rising. Acts builds that specific meaning from David's tomb and the Greek wording.",
         "description" : "Did Psalm 16 predict Jesus rising before his body decayed?",
         "summary" : "Acts explicitly makes this argument twice, though the psalm originally reads as confidence that God will preserve its speaker from death.",
         "verdict" : "This is a foundational New Testament interpretation, not a modern word match. Its resurrection prediction becomes visible through Acts's retrospective argument rather than the psalm alone.",
         "verdict_label" : "An explicit resurrection rereading"
      }
   },
   "reviews" : [],
   "schema_version" : 1,
   "sources" : [
      {
         "accessed" : "2026-11-02",
         "author" : "Monique Cuany",
         "checked" : true,
         "id" : "src-cuany-ps16",
         "locator" : "abstract and discussion of Psalm 16 in Acts 2",
         "notes" : "Argues Acts uses the psalm to explain why resurrection was divinely necessary, not simply as predictive proof.",
         "publisher" : "New Testament Studies",
         "stance" : "both",
         "tier" : 2,
         "title" : "The Divine Necessity of the Resurrection: A Re-Assessment of the Use of Psalm 16 in Acts 2",
         "type" : "journal_article",
         "url" : "https://www.cambridge.org/core/journals/new-testament-studies/article/abs/divine-necessity-of-the-resurrection-a-reassessment-of-the-use-of-psalm-16-in-acts-2/4A352A46F38E4277DA164A989DF7762F"
      },
      {
         "accessed" : "2026-11-02",
         "author" : "Alphonso Groenewald",
         "checked" : true,
         "id" : "src-groenewald-ps16",
         "locator" : "Greek translation and resurrection application",
         "notes" : "Explains how Septuagint features enabled application to Jesus's resurrection.",
         "publisher" : "University of Pretoria repository",
         "stance" : "both",
         "tier" : 2,
         "title" : "Psalm 16 (LXX Psalm 15) and Acts of the Apostles",
         "type" : "journal_article",
         "url" : "https://repository.up.ac.za/items/ebbae2c0-8620-43d7-9cc8-013a87c9225a"
      },
      {
         "accessed" : "2026-11-02",
         "author" : "BSB Publishing",
         "checked" : true,
         "id" : "src-bsb-v59",
         "locator" : "Psalm 16:8–11; Acts 2:25–32; Acts 13:34–37",
         "notes" : "Psalm, quotations and both apostolic arguments checked locally.",
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
         "Acts quotes the verse twice.",
         "The sermons explicitly contrast David's decay with Jesus's resurrection.",
         "The Davidic promise supplies a coherent messianic bridge."
      ],
      "source_ids" : [
         "src-cuany-ps16",
         "src-groenewald-ps16",
         "src-bsb-v59"
      ],
      "summary" : "Acts's case is explicit, repeated and argumentative rather than a loose echo. Peter calls David a prophet, reasons that the words cannot finally describe David's decayed body, and says David foresaw the Messiah's resurrection. Paul independently deploys the same contrast in Acts 13."
   },
   "textual_issues" : [
      {
         "issue" : "The Hebrew term can refer to the Pit rather than bodily decomposition, while the Septuagint's 'corruption/decay' supports Acts's argument about a body not decomposing.",
         "significance" : "material",
         "source_ids" : [
            "src-groenewald-ps16",
            "src-bsb-v59"
         ]
      }
   ],
   "verdict" : {
      "category" : "retrospective_rereading",
      "confidence" : "high",
      "summary" : "Acts explicitly and repeatedly makes Psalm 16:10 a resurrection text about Jesus. The psalm itself most naturally expresses the speaker's confidence of rescue from death, while Acts constructs the specific resurrection prediction through Davidic and Greek-scriptural rereading."
   }
}

```

The drafting model verifies every objection against texts and sources, then records
it as `accepted`, `partly_accepted` or `rejected` with a reason. A model's assertion
never counts as a source.
