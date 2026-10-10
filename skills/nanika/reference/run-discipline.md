# run-discipline.md — the quality of the run itself

**Owns:** the stance, the eight contract-lint conditions row 1.12 runs, the Decision Ledger, acceptance
provenance, and completion integrity.
**Read when:** at **P1**, for §1's eight lint conditions (row 1.12) and §2's Decision Ledger, which binds from
row 1.9 to P5; and at **P5**, for §5's classes (row 5.2) and §6's completion sweep (row 5.3). The two read triggers are task contexts, not measured instruction loads.

Contents: §0 stance · §1 contract lint · §2 Decision Ledger (Q4-Q6) · §3 drift control, relocated · §4
independent verification, relocated · §5 acceptance provenance (Q12-Q15) · §6 completion integrity
(Q16-Q19). Q1-Q3 were retired.

The nanika machinery attempts to improve the artifact. These rules keep the *run* honest while it does — a run that
quietly lowered its bar, dropped a criterion, or shipped a stub can still emit a beautiful Fulfillment
Report.

---

## §0 — Stance

> **Do not compromise the goal to make the run easier. Do not abandon a task because the part that is left
> is the hard part. Do not forget, at cycle four, what finishing was supposed to mean.**

Where a rule and this disposition point the same way, follow the rule. Where the rules are silent — and on a
long run they often are — the disposition decides.

**What it is not.** Repeating a failing approach is not perseverance: `SKILL.md` §3's exit table makes a
repeated identical failure a `BLOCK`, and the response is to stop and diagnose, then try a *different*
approach. Thrash is giving up while looking busy. Burning envelope past marginal value is the failure
`budget-reached` exists to name, not a virtue — exiting at `diminishing-returns` with an honest residual gap
**is** finishing. And grinding past a confirmation gate is not determination: the disposition raises effort,
never permission (N8).

## §1 — Contract lint, run at the end of P1, not after P2

**Row 1.12 delegates the lint's contents to this section**; the eight conditions are stated here and
nowhere else, and the row requires each to be marked pass/fail. Each names the card row whose output it
reads. Conditions 1-6 check that a part is **present**; 7 and 8 check how the present parts are **written**,
and they are the only two that read every element of the contract once — the most expensive of the eight,
and still bounded by the contract's own length:

1. The goal names an outcome, not an internal action (row 1.1).
2. Every acceptance criterion has a named oracle — a command, a check, a rubric dimension, or a named human
   reviewer (row 1.2). "The reviewer will know it when they see it" is not an oracle.
3. Non-goals are stated, and prohibited outcomes are stated or explicitly `none` (rows 1.3, 1.4). They are
   different fields: non-goals bound the *work* this run will not do; prohibited outcomes bound the
   *consequences* that must not occur however the work is done. A blank field is not a declaration.
4. Every disappointment criterion is attached to a rubric dimension as a score-0 trigger (rows 1.5, 1.10).
5. Every rubric dimension carries both a score-3 and a score-1 descriptor and an assigned evaluator
   archetype (rows 1.10, 1.11), and every descriptor not yet anchored is marked `invented-and-flagged` — 1A.2 is where
   that mark is discharged, and the lint only checks that it is present and honest.
6. The envelope and the cycle cap are written (rows 0.4, 0.6), and `contract.md` names who is escalated to
   on `BLOCK` and what ships on `budget-reached`.

7. **Every element admits exactly one reading** (rows 1.1-1.7). The test is per element and it is
   mechanical, not taste: (a) every evaluative word carries a bound, a comparison target, or row 1.2's
   named oracle — `fast`, `clean`, `polished`, `comprehensive` are unbounded until one is attached; (b)
   every referent resolves without the dialogue in front of you — no `it`, no `this`, no `the same as
   before`; (c) a term the run would act on differently under two readings is fixed at first use, by a
   one-line definition or by an `ASSUME-n` row (row 1.8) naming the reading taken. The question each
   element must survive: *could two competent readers build materially different artifacts from this line,
   and both be right?* If yes, it fails. **This does not license badgering the user** — D7 caps the asking
   at one follow-up, and what the user will not resolve is parked as an `ASSUME-n` stating the reading the
   run adopted. Ambiguity is removed from *the document*, which is reachable, not from the user's mind,
   which is not.

8. **Every fact is stated once** (row 1.9). The delete test: cut the sentence and re-read the contract; if
   no acceptance criterion, oracle, non-goal, prohibited outcome, disappointment criterion or recipient
   changes reading, it was decoration — delete it. Restating one element in another element's words is the
   common case; cite the row instead of repeating it. **Two carve-outs, both binding.** User evidence follows A2: retain only permitted minimal quotes or explicitly approved summaries/redactions;
   privacy-withheld evidence is not an unasked question (D6). And non-goals and prohibited
   outcomes are two axes, not a duplicated pair; condition 3 says why, and collapsing them is the
   characteristic wrong deletion here.

**When 7 and 8 pull apart, 7 wins.** A line whose removal reopens a reading is not redundant, and length is
never the reason to leave a reading open. The converse binds equally: precision is never bought with a
second copy — say it once, exactly, in the field that owns it.

Lint does not certify the contract is *right*. Conditions 1-6 certify that no part is missing; 7 and 8
certify that what is there says one thing and says it once. Neither certifies that the thing said is what
the user wanted — 1.8's quotes, 1A.5's Provenance Gate and P3R's personas carry that. Skipping the lint
moves the same failures to P4, where they cost the run a bonus cycle it may not have.

## §2 — Decision Ledger (Q4-Q6)

Every load-bearing decision made without the user gets a row, in `decisions.md` inside the run directory:

```
| ID | Decision | Alternatives rejected | Why | Reversibility | Confidence | Breaks if wrong | Confirm by | Class |
|----|----------|----------------------|-----|---------------|------------|-----------------|------------|-------|
| DEC-1 | tournament angle 3 dropped for budget | keep 4 angles | envelope covers 3 | low | high | a lost bet goes untested | — | scope |
| DEC-2 | "investor deck" built as 12 slides, not 20 | 20-slide build | recipients named a 15-minute slot | medium | medium | the partners expect the appendix | cycle 2 | interpretation |
```

| # | Rule | Discipline |
|---|------|-----------|
| Q4 | **Record, don't remember** | A row is written when the decision is made, never reconstructed at delivery. `decisions.md` is the file of record, and a Ledger row cited in the report is cited as a path into it, like any other evidence (`SKILL.md` §0.3). |
| Q5 | **Interpretation decisions are flagged** | `class: interpretation` rows are the ones the user is most likely to have wanted differently. They are listed first in the report's **Contract** section, each cited by path into `decisions.md`, and get first claim on any confirmation opportunity. Each carries what breaks if the reading was wrong, and the point past which it must be confirmed. High impact plus low confidence is validated *during* the run — an assumption surfaced only at delivery has already been built on for five cycles. |
| Q6 | **Irreversible plus uncertain is not a Ledger row** | A decision that is hard to reverse AND low-confidence is a pause point, not a row. The Ledger is for judgment calls, not for gambling with irreversibility. |

An ASSUME-n row on the card (row 1.8) and a `DEC-n` row here are the same discipline at two moments: 1.8
covers a contract element the user never supplied; a `DEC-n` covers a choice the run made after the contract
froze.

## §3 — Drift control, relocated

Q7-Q8 are card rows 3.7 and 3.1, evidenced per cycle.

## §4 — Independent verification, relocated

Q9-Q11 are N1 with A5, N3 with `SKILL.md` §0 item 3, and row 3.7's semantic check.

## §5 — Acceptance provenance (Q12-Q15)

| # | Rule | Discipline |
|---|------|-----------|
| Q12 | **Bar unmet plus envelope remaining means iterate** | Delivering a known-substandard artifact with envelope left is a protocol violation, not a style choice — unless an exit in `SKILL.md` §3's table other than `budget-reached` applies, which is a stated stop, not a lapse. |
| Q13 | **Bar unmet plus envelope exhausted means best-so-far plus the residual gap** | Report the gap precisely, under the exit reason `SKILL.md` §3's table gives it. Never silently stop; never burn cycles past marginal value. |
| Q14 | **No status inflation** | A precise `partial` beats a `verified` with hidden holes. The acceptance section never says "all criteria met" as a blanket — row 5.2 maps each criterion individually, and ID7 sums the partition. |
| Q15 | **Every criterion is classified, and a prohibition is not a criterion** | Row 5.2 requires both classifications; this rule owns the test each class must pass, below. The two axes are separate because a criterion is met by producing something and a prohibition is held by *nothing having happened*, which no amount of criterion evidence demonstrates. |

Acceptance criteria — the test for each class:

| Class | The test it must pass |
|-------|-----------------------|
| `verified` | met, with a path to the evidence that shows it met |
| `partial` | partly met, and the gap is stated precisely enough to be actioned |
| `missed` | not met, with why, and what the best-so-far state is |
| `dropped` | descoped mid-run — legal only when a `DEC-n` row in `decisions.md` dropped it with the user's recorded confirmation, cited by ID |
| *(silent)* | a criterion the report never mentions. Not a class: it is an incomplete report, and ID7 fires |

Prohibited outcomes, on their own axis, in the same section:

| Class | The test it must pass |
|-------|-----------------------|
| `held` | checked, with evidence that the forbidden result did not occur |
| `violated` | it happened — with blast radius, rollback attempted, and the residual state |
| `unverified` | no evidence either way. Legal, as a named risk; never reported as `held` |

A prohibited outcome may never be `dropped`. Descoping work is a `DEC-n`; descoping a *prohibition* is the
user's call, not the run's, and N8 is why row 0.7's confirmation does not pre-authorize it.

## §6 — Completion integrity (Q16-Q19)

| # | Rule | Discipline |
|---|------|-----------|
| Q16 | **The artifact is part of done** | Complete means the *artifact* is complete, not the plan for it. **Code:** no `TODO`/`FIXME`, no placeholder body, no `not implemented`, no mock standing in for the real path, no elided "same for the others" presented as finished. **Documents:** no `TBD` other than a W5 `TBD(owner)`/`UNKNOWN` marker carrying a Q17 residual row, no `[fill in]`, no empty heading, no section whose body is a promise to write it. Done-ness is deliverable-relative: a design-only wish is done when the design is complete. Q16 never licenses work outside the contract — finishing is not widening. |
| Q17 | **Residuals are typed** | Every leftover gets a row: what, why it is left, who or what finishes it, and where its marker lives. The binding is bidirectional — every marker left in a file has a row, and every row names its marker. An orphan marker and an orphan row are both incomplete reports. |
| Q18 | **Completion sweep before delivery** | Scan the files the run actually touched for the Q16 markers. Row 5.3 owns what the evidence must contain; this rule owns the sweep: scope is the touched files, not the repository; residue the run did not introduce is reported `pre-existing` and left alone; every hit is accounted for individually rather than in aggregate; and zero is stated as a *scanned* zero, with the command that scanned it, never asserted. |
| Q19 | **The bar does not move to meet the output** | **N4 owns the prohibition** and `SKILL.md` §6 owns the single legal path. This is a numbered rule here because the run-side duty is not a card row: descriptors in use are read from `rubric-frozen.md` rather than from memory, at every cycle boundary (row 3.1) and again before the report is written. A descriptor that quietly changed wording between 1A.8 and P5 is the hardest self-deception to catch afterwards, and re-reading the frozen file is the only thing that catches it. |

**Effort allocation** is `engine-map.md` §3's; the output-length envelope is a separate N6 field.
