# doc-deliverables.md — W1-W12

**Owns:** the extra rules that apply when the nanika's deliverable is a document or a document package.
**Read when:** never by the orchestrator. **Card row 2.2 attaches this file to each generator spawn when row
0.4's deliverable class is `document`** — that attachment is its only trigger, and it is why this file has no
`READ:` line of its own and never enters `SKILL.md` §0.6's load table.

Thirteen numbered rules live here — W1-W12 plus W11b — and they are carried by the spawn, not by the
orchestrator, so the count is stated here for recounting rather than as an input to a load figure.

Code has tests; documents have readers. So quality here means: the declared reader can make the declared
decision from the artifact alone, every externally-checkable fact is grounded, and the set is internally
coherent. W12 becomes a rubric dimension; the rest are production rules for the generator.

---

## 1. Reader contract (W1-W3)

| # | Rule | Discipline |
|---|------|-----------|
| W1 | **Audience + decision declared** | Each document states WHO reads it (role, expertise) · WHAT decision or action it supports · WHEN it is consumed. A technically perfect document for the wrong reader is a miss. In a wish this is already half-done — the Wish Contract's named recipients are the W1 audience. Multi-document packages declare it per document, not per package. |
| W2 | **Register calibration** | Vocabulary, depth, and assumed context follow W1's reader. Mixed audiences get layered structure (W10), not averaged prose that serves no one. |
| W3 | **Freshness metadata** | Every document carries an `as-of` date for its facts · an owner · a **review trigger** (the event or interval that makes it stale). Documents rot silently; the trigger makes rot detectable. Time-insensitive documents state `evergreen` instead. |

## 2. Grounding (W4-W6)

| # | Rule | Discipline |
|---|------|-----------|
| W4 | **Universal grounding** | Every **externally-checkable fact** — market sizes, statistics, competitor features, dates, "studies show" — is `sourced` (citation) · `ASSUMPTION` (flagged inline) · or `research-to-do`. Internal propositions (the user's own plan, opinions, recommendations) are exempt; the rule targets facts a reader could check and find false. |
| W5 | **UNKNOWN over fabrication** | A gap the run could not verify is written as `UNKNOWN` / `TBD(owner)`, never filled with a plausible guess. Specifics are where fabrication hides: numbers, product names, URLs, API signatures, legal citations are verified or flagged, never improvised. |
| W6 | **Quote fidelity** | Anything presented as a quotation, spec excerpt, or reproduced requirement is verbatim from source, or explicitly marked as paraphrase. Silent paraphrase inside quotation marks is fabrication with extra steps. |

A one-shot document is where W4-W6 matter most: there is no second version in which the fabricated number gets corrected, and a single checkable falsehood is exactly the kind of thing that makes a recipient discount everything around it.

## 3. Structure and coherence (W7-W9)

| # | Rule | Discipline |
|---|------|-----------|
| W7 | **Template completeness** | A document authored against a template carries every required section — present, or `N/A` with a one-line reason. A silently missing section reads as "considered and empty" when it means "never considered". |
| W8 | **Single source of truth** | In a multi-document set, every shared fact (a number, a date, a scope boundary, an entity name) has ONE owning document; others reference it rather than restating it. Restated facts fork silently on the first edit. |
| W9 | **Terminology ledger** | One concept, one term, package-wide. Synonym drift ("user"/"member"/"account" for the same entity) is a defect, not style. On an existing codebase, terms follow the code's established vocabulary — the document adapts to the code, not the reverse. |

## 4. Readability (W10-W11)

| # | Rule | Discipline |
|---|------|-----------|
| W10 | **Summary-first, layered** | Every document opens with what the W1 reader needs in ~5 lines — the decision-relevant core — then layers detail progressively. Front-load conclusions; never make the reader excavate them. Tables for short enumerable facts; prose for reasoning; a diagram when structure beats words. |
| W11 | **Scannability envelope** | One idea per section; headings state findings ("Auth tokens expire too early"), not topics ("Token analysis"); section length matched to the reader's stake in it. A document nobody finishes delivers nothing regardless of its accuracy. |
| W11b | **No-padding calibration on every authoring spawn** | A spawn that writes files without an explicit length instruction will over-produce, and the padding lands in filler sections, restated summaries, and boilerplate — exactly what W10/W11 exist to prevent. Every document-authoring spawn carries: *"Match the length to what the task needs: cover the substance, but do not pad with filler sections, redundant summaries, or boilerplate."* For a multi-file package, state the envelope **per file** — a set-level budget silently reallocates into whichever file gets written first. |

## 5. The W12 gate — as a rubric dimension

For a document wish, W12 is not a separate gate bolted onto the loop. It is **a rubric dimension**, scored every cycle by a Rigor or Behavior evaluator (`evaluator-roster.md`), with these sub-questions:

| Sub-dimension | Question |
|---------------|----------|
| Reader-path | Can the W1 reader make the W1 decision from this artifact **alone**, with no author present to explain? |
| Grounding | Zero ungrounded externally-checkable facts (W4-W6)? |
| Coherence | Shared facts single-sourced, terminology consistent, no cross-document contradictions (W8-W9)? |
| Completeness | Every required section present or `N/A` + reason (W7)? |
| Readability | Summary-first, findings-headed, scannable (W10-W11)? |
| Freshness | as-of / owner / review-trigger present (W3)? |

Its score-3 descriptor is anchored like every other dimension — against the P1A exemplar document, not against this checklist. The checklist is the floor; the exemplar is the ceiling.

**The reader-path check is run *as* the W1 reader**, and the reviewer is never the author. In a wish this overlaps the P3R reception simulation, and the two are deliberately different: W12's reader-path check is a scored dimension run by an evaluator who *knows* the contract; a P3R persona knows nothing. Both run. A document that passes the first and fails the second is the common and expensive case.

## 6. Failure modes prevented

| Failure | Mitigation |
|---------|------------|
| Technically perfect document for the wrong reader | W1 audience + decision, W2 register |
| Silent rot | W3 as-of + review trigger |
| **Plausible-but-fabricated specifics** | W4 grounding + W5 UNKNOWN-over-fabrication + W6 quote fidelity |
| Missing section read as "considered and empty" | W7 present-or-N/A + reason |
| Shared facts forking across a package | W8 single source of truth |
| Synonym drift confusing readers | W9 terminology ledger |
| Buried conclusions / a document nobody finishes | W10 summary-first + W11 scannability |
| Padding shipped as thoroughness | W11b per-file no-padding calibration |
| Author-graded prose shipped as reviewed | W12 as a scored dimension, reviewer ≠ author |
