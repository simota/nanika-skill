# run-discipline.md: the quality of the run itself

**Owns:** the stance, the eight contract-lint conditions row 1.12 runs, the Decision Ledger, acceptance
provenance, and completion integrity.
**Read when:** at P1, for §1's eight lint conditions (row 1.12) and §2's Decision Ledger, which binds from
row 1.9 to P5; and at P5, for §5's classes (row 5.2) and §6's completion sweep (row 5.3). The two read triggers are task contexts, not measured instruction loads.

Contents: §0 stance · §1 contract lint · §2 Decision Ledger (Q4-Q6) · §5 acceptance provenance (Q12-Q15) · §6
completion integrity (Q16-Q19). Q1-Q3 were retired; Q7-Q11 now live on card rows 3.1, 3.7 and on N1, N3.

While the nanika machinery attempts to improve the artifact, these rules keep the *run* honest. A run that
quietly lowered its bar, dropped a criterion, or shipped a stub can still emit a beautiful Fulfillment Report.

## §0. Stance

> Do not compromise the goal to make the run easier. Do not abandon a task because the part that is left
> is the hard part. Do not forget, at cycle four, what finishing was supposed to mean.

Where a rule and this disposition point the same way, follow the rule. Where the rules are silent, which on a
long run is often, the disposition decides.

It does not mean repeating a failing approach: `SKILL.md` §3's exit table makes a repeated identical failure a
`BLOCK`, and the response is to stop and diagnose, then try a *different* approach. Thrash is giving up while
looking busy. A plateau is not a stop either: row 3.11 re-opens the search with new bets, and only after its
re-opens are spent is `diminishing-returns` with an honest residual gap finishing. Burning envelope past
marginal value is not a virtue but the failure `budget-reached` exists to name. Grinding past a confirmation
gate is not determination: the disposition raises effort, never permission (N8).

## §1. Contract lint, run at the end of P1, not after P2

Row 1.12 delegates the lint's contents to this section and requires each condition to be marked pass/fail; the
eight conditions are stated here and nowhere else, and each names the card row whose output it reads.
Conditions 1-6 check that a part is *present*, so that no part is missing. Conditions 7 and 8 check how the
present parts are *written*, so that what is there says one thing and says it once; they are the only two that
read every element of the contract once, the most expensive of the eight and still bounded by the contract's
own length.

1. The goal names an outcome, not an internal action (row 1.1).
2. Every acceptance criterion has a named oracle (row 1.2): a command, a check, a rubric dimension, or a named
   human reviewer. "The reviewer will know it when they see it" is not an oracle.
3. Non-goals are stated, and prohibited outcomes are stated or explicitly `none` (rows 1.3, 1.4). A blank field
   is not a declaration. They are different fields: non-goals bound the *work* this run will not do;
   prohibited outcomes bound the *consequences* that must not occur however the work is done.
4. Every disappointment criterion is attached to a rubric dimension as a score-0 trigger (rows 1.5, 1.10).
5. Every rubric dimension carries both a score-3 and a score-1 descriptor and an assigned evaluator
   archetype (rows 1.10, 1.11), and every descriptor not yet anchored is marked `invented-and-flagged`. The
   lint checks only that the mark is present and honest; 1A.2 discharges it.
6. The envelope and the cycle cap are written (rows 0.4, 0.6), and `contract.md` names who is escalated to
   on `BLOCK` and what ships on `budget-reached`. Do not ask either: `SKILL.md` §3's exit table fixes them as
   the user and best-so-far.

7. Every element admits exactly one reading (rows 1.1-1.7). The test is per element and mechanical, not
   taste: (a) every evaluative word carries a bound, a comparison target, or row 1.2's named oracle (`fast`,
   `clean`, `polished`, `comprehensive` are unbounded until one is attached); (b) every referent resolves
   without the dialogue in front of you, so no `it`, no `this`, no `the same as before`; (c) a term the run would
   act on differently under two readings is fixed at first use, by a one-line definition or by an `ASSUME-n`
   row (row 1.8) naming the reading taken. An element fails if two competent readers *could build materially
   different artifacts from this line, and both be right*. Ambiguity is removed from *the document*, which is
   reachable, not from the user's mind, which is not, so this does not license badgering the user: D7 caps the
   asking at one follow-up, and what the user will not resolve is parked as an `ASSUME-n` stating the reading
   the run adopted.

8. Every fact is stated once (row 1.9). The delete test: cut the sentence and re-read the contract; if no
   acceptance criterion, oracle, non-goal, prohibited outcome, disappointment criterion or recipient changes
   reading, the sentence was decoration and goes. The common case is one element restated in another
   element's words: cite the row instead. Two carve-outs bind. User evidence follows A2: retain only permitted
   minimal quotes or explicitly approved summaries/redactions; privacy-withheld evidence is not an unasked
   question (D9). Non-goals and prohibited outcomes are two axes, not a duplicated pair (condition 3), and
   collapsing them is the characteristic wrong deletion here.

**When 7 and 8 pull apart, 7 wins.** A line whose removal reopens a reading is not redundant, and length is
never the reason to leave a reading open. The converse binds equally: precision is never bought with a
second copy. Say it once, exactly, in the field that owns it.

Lint does not certify that the contract is *right*, that the thing said is what the user wanted; 1.8's quotes,
1A.5's Provenance Gate and P3R's personas carry that. Skipping the lint moves the same failures to P4, where
they cost the run a bonus cycle it may not have.

## §2. Decision Ledger (Q4-Q6)

Every load-bearing decision made without the user gets a row, in `decisions.md` inside the run directory. A
`DEC-n` row and an ASSUME-n row on the card (row 1.8) are the same discipline at two moments: 1.8 covers a
contract element the user never supplied; a `DEC-n` covers a choice the run made after the contract froze.

```
| ID | Decision | Alternatives rejected | Why | Reversibility | Confidence | Breaks if wrong | Confirm by | Class |
|----|----------|----------------------|-----|---------------|------------|-----------------|------------|-------|
| DEC-1 | tournament angle 3 dropped for budget | keep 4 angles | envelope covers 3 | low | high | a lost bet goes untested | — | scope |
| DEC-2 | "investor deck" built as 12 slides, not 20 | 20-slide build | recipients named a 15-minute slot | medium | medium | the partners expect the appendix | cycle 2 | interpretation |
```

| # | Rule | Discipline |
|---|------|-----------|
| Q4 | Record, don't remember | A row is written when the decision is made, never reconstructed at delivery. `decisions.md` is the file of record, and a Ledger row cited in the report is cited as a path into it, like any other evidence (`SKILL.md` §0.3). |
| Q5 | Interpretation decisions are flagged | `class: interpretation` rows are the ones the user is most likely to have wanted differently. Each carries what breaks if the reading was wrong, and the point past which it must be confirmed; they get first claim on any confirmation opportunity. High impact plus low confidence is validated *during* the run: an assumption surfaced only at delivery has already been built on for five cycles. In the report's Contract section they are listed first, each cited by path into `decisions.md`. |
| Q6 | Irreversible plus uncertain is not a Ledger row | A decision that is hard to reverse AND low-confidence is a pause point, not a row. The Ledger is for judgment calls, not for gambling with irreversibility. |

## §5. Acceptance provenance (Q12-Q15)

| # | Rule | Discipline |
|---|------|-----------|
| Q12 | Bar unmet plus envelope remaining means iterate | Delivering a known-substandard artifact with envelope left is a protocol violation, not a style choice, unless an exit in `SKILL.md` §3's table other than `budget-reached` applies; that is a stated stop, not a lapse. |
| Q13 | Bar unmet plus envelope exhausted means best-so-far plus the residual gap | Report the gap precisely, under the exit reason `SKILL.md` §3's table gives it. Never silently stop; never burn cycles past marginal value. |
| Q14 | No status inflation | A precise `partial` beats a `verified` with hidden holes. Never write "all criteria met" as a blanket in the acceptance section: row 5.2 maps each criterion individually, and ID7 sums the partition. |
| Q15 | Every criterion is classified, and a prohibition is not a criterion | Row 5.2 requires both classifications; this rule owns the test each class must pass, in the two tables below. The axes are separate because a criterion is met by producing something and a prohibition is held by *nothing having happened*, which no amount of criterion evidence demonstrates. |

Acceptance criteria:

| Class | The test it must pass |
|-------|-----------------------|
| `verified` | met, with a path to the evidence that shows it met |
| `partial` | partly met, and the gap is stated precisely enough to be actioned |
| `missed` | not met, with why, and what the best-so-far state is |
| `dropped` | descoped mid-run, legal only when a `DEC-n` row in `decisions.md` dropped it with the user's recorded confirmation, cited by ID |
| *(silent)* | a criterion the report never mentions. Not a class: it is an incomplete report, and ID7 fires |

Prohibited outcomes, on their own axis, in the same section:

| Class | The test it must pass |
|-------|-----------------------|
| `held` | checked, with evidence that the forbidden result did not occur |
| `violated` | it happened: with blast radius, rollback attempted, and the residual state |
| `unverified` | no evidence either way. Legal, as a named risk; never reported as `held` |

A prohibited outcome may never be `dropped`. Descoping work is a `DEC-n`; descoping a *prohibition* is the
user's call, not the run's, and N8 is why row 0.7's confirmation does not pre-authorize it.

## §6. Completion integrity (Q16-Q19)

| # | Rule | Discipline |
|---|------|-----------|
| Q16 | The artifact is part of done | Complete means the *artifact* is complete, not the plan for it, and done-ness is deliverable-relative: a design-only wish is done when the design is complete. Q16 never licenses work outside the contract; finishing is not widening. The markers of an incomplete artifact: in code, `TODO`/`FIXME`, a placeholder body, `not implemented`, a mock standing in for the real path, an elided "same for the others" presented as finished; in documents, `TBD` other than a W5 `TBD(owner)`/`UNKNOWN` marker carrying a Q17 residual row, `[fill in]`, an empty heading, a section whose body is a promise to write it. |
| Q17 | Residuals are typed | Every leftover gets a row: what, why it is left, who or what finishes it, and where its marker lives. The binding is bidirectional: every marker left in a file has a row, and every row names its marker. An orphan marker and an orphan row are both incomplete reports. |
| Q18 | Completion sweep before delivery | Scan the files the run actually touched for the Q16 markers; scope is the touched files, not the repository. Residue the run did not introduce is reported `pre-existing` and left alone. Account for every hit individually rather than in aggregate, and state zero as a *scanned* zero, with the command that scanned it, never asserted. Row 5.3 owns what the evidence must contain; this rule owns the sweep. |
| Q19 | The bar does not move to meet the output | Read the descriptors in use from `rubric-frozen.md`, not from memory, at every cycle boundary (row 3.1) and again before the report is written. A descriptor that quietly changed wording between 1A.8 and P5 is the hardest self-deception to catch afterwards, and re-reading the frozen file is the only thing that catches it. N4 owns the prohibition and `SKILL.md` §6 owns the single legal path; this is a numbered rule here because the run-side duty is not a card row. |

Effort allocation is `engine-map.md` §3's; the output-length envelope is a separate N6 field.
