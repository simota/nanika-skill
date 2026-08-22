# Reference manifest — the twelve shipped files

**All twelve reference files ship written.** None is described-but-absent, and no row below is a plan. This
document was a build list in cycle 4, when four files existed and eight did not; it is now a **record of
what each file carries and a recount of its rules**, and the two sentences that said otherwise are gone
because they became false the moment the last eight were written.

Rule counts below are the inputs to `SKILL.md` §0.6's load table. The count is "numbered rules the file
carries", and **every one of them is now measured against the shipped file by the grep the file itself
publishes** — the "projected" column that stood here has no rows left to hold.

| phase | reference inputs | measured or projected | load |
|---|---|---|---|
| P0 | `nanika-ledger.md` 5 + `engine-map.md` 4 | **both measured** | 124 |
| **P1** | `crystallization-dialogue.md` 12 + `run-discipline.md` 11 | **both measured** | **138 ← peak (tie)** |
| P1A | `benchmark-anchoring.md` 13 + `engine-map.md` 4 | **both measured** | 132 |
| P2 | `evaluator-roster.md` 8 | **measured** | 123 |
| P3 | `evaluator-loop.md` 8 + `refutation-panel.md` 6 | **both measured** | 129 |
| P3R | `evaluator-roster.md` 8 | **measured** | 123 |
| P4 | `evaluator-loop.md` 8 | **measured** | 123 |
| **P5** | `identities.md` 12 + `run-discipline.md` 11 | **both measured** | **138 ← peak (tie)** |

**The peak moved, and it moved for a reason that is not the files.** Cycle 4 published 135 against sixteen
inputs of which three were measured. All sixteen are now measured, and **every measured count came back
identical to its projection** — the recount changed no summand. The peak is **138** because the card grew:
`SKILL.md`'s clause census went 98 → 101 (3R.2's cap condition, 3R.3's reception re-entry, 4.1's
per-property exemplar verdict) and its rows 56 → 57. 115 clauses + 23 rules at P1 and P5 = **138**, which
is 92% of the ~150 adherence knee [EV-10], up from 90%. `SKILL.md` §0.6 says the same thing in the same
numbers; `identities.md` §0 carries the clause census the 101 is counted from.

**Two corrections carried forward from cycle 3, both against this document's own interest, both still true.**
(1) P1 counts `run-discipline.md` because card row 1.12 lints against its §1 — P1 is a peak, tied with P5,
and cycle 3 did not say so. (2) `benchmark-anchoring.md` does not "feed the published peak"; P1A has never
been the peak.

**Two corrections about the run that produced these files**, recorded here because the artifact must not
carry them wrongly:

- **A pair that failed to separate is not the same finding as no pair at all.** Only one dimension of the
  rubric this artifact was built against — portability — genuinely had *no calibration pair in the corpus*,
  established by four independent greps before it was ever scored. The others had pairs that **ran and did
  not discriminate**. Both are uncalibration and both block a ceiling ACCEPT, but they are different facts
  about different things, and conflating them credits the corpus with a gap that belongs to a property.
  `SKILL.md`'s P1A block now states the distinction in the artifact's own vocabulary: `non-separating` is a
  pair that exists and did not discriminate, struck at 1A.4; the 1A.4 fallback and `unanchored` are no pair
  in the corpus at all.
- **The budget is under strain; it has not paid a trade.** Across the run the peak went 88 (59% of the
  knee) → 138 (92%), and **nothing was cut** at any point. No required behaviour was ever given up to buy
  another, so "what one requirement demands, the other cannot afford" is not demonstrated by anything in
  this run. §0.6 states it as strain, with both numbers.

| File | What it carries | Rules (measured) |
|---|---|---|
| `benchmark-anchoring.md` | The sweep, the locator + verbatim span protocol, the reject-list protocol, the Provenance Gate (1A.5), the four-part 1A.3 protocol (B8 re-quote · B9 property · B10 separation · B11 challenge) and 1A.4's disposition table, in which `non-separating` and `non-comparable` are strike conditions alongside `mismatch` and `property-absent`; only `exact-match ∧ property-present ∧ separating` rows become score-3 descriptors. The separation protocol states that the checker opens the *control's* locator at each named property, names the clause it read, and returns `separating` / `non-separating` / `non-comparable` — and that this, like the property verdict, is a **judgment**, so the worker states the clause and never a bare word. The same-house-style rule for the control is kept and now says why: an absurd control is what `non-comparable` exists to catch. `grep -c '^\*\*B[0-9]'` → 13. | 13 |
| `run-discipline.md` | §0 stance, §1 contract lint (the six conditions row 1.12 triggers, each citing the row it lints), Q4-Q6 Decision Ledger persisting to `decisions.md`, Q12-Q15 acceptance provenance, §6 completion integrity (Q16-Q19, Q18 being row 5.3's sweep). The identities left for `identities.md` in cycle 3 and did not return. Q4-Q6 + Q12-Q19 = **11**. This file is named on **two** `READ:` lines (P1 for §1, P5 for §6) and is a summand of both peaks; `SKILL.md` §0.6 says so. §1's six lint conditions are not numbered rules and are not in the count. | 11 |
| `crystallization-dialogue.md` | *How to ask*, never *what to ask* — the card owns that. D1 (one question per turn) is deleted; it is A6, stated once in the whole skill. §8's failure-modes table is deleted; the Provenance Gate lives in `benchmark-anchoring.md`. D9's ledger rows carry the quoted utterance so ID2 is computable from the file. The label set is deliberately non-contiguous (D2-D10, D12, D13, D15) because two pairs that said the same thing twice were merged; the file's header states each move. `grep -c '^| D'` → 12. | 12 |
| `evaluator-roster.md` | §4 blind judge panel (RS3-RS4), §5 reception personas (RS5-RS6: verbatim stop-span, grep check, void-and-re-run), §6 generators (RS7-RS8). §5 states that row 3R.2 owns the three disposals and **row 3R.3 owns the re-entry**, and that this file adds no fourth disposal and no second exit. §6's `spawns/` rule is deleted as a rule of this file and replaced by RS8, a pointer to N6, which carries it for every spawn kind rather than for generators and judges only — cycle 3's `spawns/` orphan closes there. The outline-vs-full-build *decision* is read off the card header (row 0.4); this file keeps only how to brief a generator at each level. | 8 |
| `engine-map.md` | The only place a host-specific tool name appears. §0 (M1) maps the frontmatter's `requires-capability: spawn-independent-worker` to the host's actual tool. §2a (M2) is row 0.8's **spawn preflight**: the literal throwaway-worker command per host, its expected exit status, and the rule that a non-zero exit sets `mode: single-agent(declared)` — shipped as three commands, not as a description of one. §2b (M3) is 1A.7's **engine reachability preflight**, same form, writing to `engines.md`. §3 (M4) carries role names and no model names, and states that this file is the only place a model name *may* appear. Everything that consumes §2a and §2b — card rows 0.8 and 1A.7, P0's and P1A's `READ:` lines, §3's fourteen-row degraded list, ID10, worked example B — resolves against the shipped file. **The per-host commands are carried forward from the pre-edit file, not executed in the authoring environment**; M1 requires a host without a row to get one before the run rather than improvise at 0.8. | 4 |
| `nanika-ledger.md` | Location, schema, the counting rule, §4's backfill question verbatim (row 0.3 quotes it), §5. §3's "what Phase 0 surfaces" list is deleted (rows 0.2/0.3/0.5/0.6 own it), as is the dangling `SKILL.md §6 Phase 0` pointer. `grep -c '^## LG'` → 5. | 5 |
| `refutation-panel.md` | How to brief a skeptic, the staging trigger, and the aggregation rule. §4's restatement of the ACCEPT arithmetic is deleted (§3's exit table owns it). The single-round, non-interacting, aggregated-not-voted conditions are **card row 3.4's clause**; this file points at the row rather than asserting them itself — the second of cycle 3's three orphans, closed, and the reason `SKILL.md` §7's contradicted-classes paragraph can say the conditions are executable. Every `unproven-because-new` call routes into ID5's own bucket, which the §5 terminal line prints. G1-G6, one per section. | 6 |
| `doc-deliverables.md` | Unchanged in content; stale phase labels retargeted to this document's names. Trigger is a card clause: row 2.2 attaches it to each generator spawn when 0.4's class is `document`. The orchestrator never reads it, so it never enters the load table. W1-W12 plus W11b. | 13 (in the spawn, not the orchestrator) |
| `identities.md` | §0's clause census (C1), the ten run identities ID1-ID10, AUD's audit protocol, five worked examples one per legal run state, and §4 on what an imbalance never licenses. Carries its own clause-expanded recount — **36, not 12** — so `SKILL.md` §0.6's mixed-unit floor is checkable rather than asserted. C1 · ID1-ID10 · AUD. | 12 |
| `evaluations.md` | E1-E4, every one headed `status: NEVER RUN`: the with/without A/B with its arms, n, judge count and pre-registered effect size; the evidence-quality probe; E3's deletion control with four anchor sub-ablations and a pre-registered cut rule; E4, the cheapest of them. Read on question only; never in the load table. | 4 (E1-E4) |
| `evidence.md` | EV-1…EV-30, each with the scope it was measured in, its source, its retrieval date and its tier, plus §3's resumption conditions for every cut mechanism. A4 makes this the sole owner of every literature figure. Read on question only; never in the load table. | 30 rows (not rules) |
| `evaluator-loop.md` | L1-L8: the per-cycle loop, the `SCORECARD` schema ID9 reads, and the **`PAIRWISE_VERDICT` schema row 4.1 hands to its four workers** — now carrying the exemplar pairing's **per-property** verdict list, matched entry by entry across the two orders, against the runner-up pairing's single overall verdict. N6 forbids a spawn without an exact schema, so row 4.1 was blocked by the skill's own rule until this file shipped. | 8 |

`#TODO(agent): rewrite README.md` — it still describes the seven-mechanism framing and the 27-102 agent
range, both gone, and it is the surviving instance of the SKILL/README contradiction class. Outside the
artifact; carried here, not into the rubric.

`#TODO(agent): I5 — nothing requires the artifact under evaluation to be settled, or its hash recorded,
when scoring spawns are dispatched.` One clause on row 3.2, open. It is not closed here, and the reason is
stated without leaning on the budget: this revision had three named jobs and I5 was not one of them.
