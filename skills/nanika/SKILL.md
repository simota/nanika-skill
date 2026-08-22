---
name: nanika
description: "Once-in-a-lifetime request delivery: a scarcity-gated, one-shot, quality-ceiling harness for any deliverable — code, document, design, or plan. Use when the user frames a request as their most important ask, or when there is no second delivery."
allowed-tools: Read, Write, Edit, Bash, WebSearch, WebFetch
requires-capability: spawn-independent-worker
---
# Wish — the one-shot delivery harness

**REQUIRES:** a filesystem you may write to, and the ability to spawn an independent worker with its own context. The
frontmatter declares that capability by name, not by host tool: **the spawn tool's name, the model names and every
per-host command live in `reference/engine-map.md` and nowhere else** — porting nanika is one file's edit, and the
host's allowlist must admit what it names. Row 0.8 tests the capability by using it; §3's degraded block says what a
failure costs. Nothing depends on another skill.

**DELTA: UNMEASURED.** No with-skill / without-skill A/B has been run on this document. Four evaluations that would
measure it — including a deletion control that can only shrink this skill — ship written and unrun in
`reference/evaluations.md`, each headed `status: NEVER RUN`, E1 carrying its arms, its n, its judge count and its
pre-registered effect size. Until they run, an untested harness and a tested one are indistinguishable until the run
you need.

## 0. How to execute this document

This is not an essay about quality. It is a harness, and you are the machine in it.

1. **The specification is the Run Card (§1) plus the Always/Never rules (§2)** — 57 rows and 14 rules, and nothing
   else in this file adds one. Two counts, both recountable, neither rounded: **71 addressable requirements** (`grep
   -c '^\[ \] '` = 57, plus A1-A6 and N1-N8) and, at clause level — every requirement inside a row that can be failed
   on its own and leaves its own evidence — **101 row clauses + 14 rules = 115**, itemised per row in `identities.md`
   §0 so it can be recounted rather than believed. §0.6 uses the higher unit. Where a row names a table in this file
   (§3's exit table, scope line and degraded-mode list; §P2's calibration table), that table is part of that row. §4's
   phase blocks are commentary. **If a phase block reads like a requirement the card does not carry, the card is
   wrong** — record it as a residual in the report's Amendment section; do not silently obey it and do not silently
   drop it.
2. **Copy the card into your visible response now**, before Phase 0, and write it to `.nanika/runs/<slug>/card.md`. A1
   owns re-emission after that.
3. **Evidence is a path** — this item owns that rule; the card legend and N3 point at it. Every filled cell holds
   `file:line` inside the run directory. A quoted user utterance is evidence once it is in `contract.md`; a command is
   evidence once its output is in a file. A row you performed but cannot point at is an unperformed row. Verbal and
   actual compliance have been measured up to 100 percentage points apart, and human reviewers caught the gap 0 times
   in 15 [EV-14]. The run directory holds, at minimum: `card.md` · `gate.md` · `contract.md` · `rubric-draft.md` ·
   `anchors.md` · `requote.md` · `rubric-frozen.md` · `candidates/` · `cycles/<n>.md` · `personas/` · `gate4.md` ·
   `unexplored.md` · `report.md` · and three directories: `scorecards/` (one per scorer, counted by ID9), `ext/` (one
   per `ext` cell, counted by ID8), and `spawns/` (one file per spawn prompt, required by N6 and **counted by no
   identity** — §7 prices that residue rather than letting this line imply a check).
4. **Three cells are `ext`** — 1A.3, 4.1 and 5.7. The card legend defines the state, ID8 counts it from `ext/`, and
   **A5** says what it buys and what it does not.
5. **The gate is hard.** A phase begins only when every card row of the previous phase carries evidence or a legal
   `not-run: <reason>`. If a row is empty, the only legal next action is to fill it.
6. **Instruction budget: 115 clauses here.** Peak load is those 115 plus the heaviest phase's reference reads, at
   **file** level (one section read = the file open): P0 124 · **P1 138** · P1A 132 · P2 123 · P3 129 · P3R 123 · P4
   123 · **P5 138** — two tie. **No summand is projected:** all twelve reference files ship and every rule count was
   recounted against the shipped file (`MANIFEST.md`'s table and greps). The peak moved **135 → 138 — not because of
   the files**, whose twelve measured counts came back identical to the projection, but because of three clauses added
   here (3R.2's cap condition, 3R.3's re-entry, 4.1's per-property verdict). Adherence is near-perfect to ~150
   explicit instructions and decays past it, errors peaking at 150-200 [EV-10]: **138 is 92% of that knee.** Three
   qualifiers. **The unit is not identical** — IFScale counts atomic keywords, a card clause is a procedural
   requirement: an order-of-magnitude check, not a measurement, and the coarse unit (71 + 23) puts the peak at 94.
   **Nor are the summands one unit, so 138 is a floor:** this file is clause-expanded (57 rows → 101, ×1.77),
   reference files are numbered rules (×1.0) — recount `identities.md` in clauses and it is **36, not 12**, past the
   knee. **And the rise is strain, not a paid trade:** the peak went 88 (59%) → 138 (92%) with **nothing cut**; no
   required behaviour was given up to buy another. Recount after any edit.

## 1. The Run Card

```
WISH RUN CARD — run: <slug> · scope: <S|M|L|XL> · class: <code|document|design|plan>
cycles: <N + ≤1 bonus> · generation: <outline|full-build>   (both read off §3 at row 0.4)
rubric: <R1|R2> · mode: <full | single-agent(declared)>
tick = evidence present, as a path into the run dir (§0.3). blank = not done.
not-run:<reason> = skipped; the reason must be one of six: `no spawn` · `no external worker` ·
  `not applicable(<class|scope>)` · `precondition unmet(<row>)` · `user declined(<path>)` ·
  `capability absent(<name>)`. Any other string is an ID1 imbalance at 5.7.
ext = fillable only by a worker that was not in the context it checks, AND `ext/<row>.md` holds
that worker's spawn prompt and raw return.

P0 SCARCITY GATE  → gate.md
[ ] 0.1 run dir `.nanika/runs/<slug>/` exists and holds this card                                                                ev:
[ ] 0.2 ledger read; "this is wish #N", last date/intent/exit stated                                                           ev:
[ ] 0.3 previous nanika's `outcome` backfilled by asking, or `unknown` because they declined                                     ev:
[ ] 0.4 deliverable class and scope class chosen and written; the cycle cap AND the generation level read off §3's scope line
        for that class and written into the card header                                                                        ev:
[ ] 0.5 routine test, scored one at a time: (a) the request maps onto ordinary work, no one-shot or irreversibility framing;
        (b) the phrasing carries no scarcity vocabulary; (c) a redo would cost the user little. 2-of-3 yes → the cheaper path
        is priced and recommended out loud                                                                                     ev:
[ ] 0.6 envelope computed from the §3 formula, not quoted from prose                                                           ev:
[ ] 0.7 user confirmed; their reply quoted verbatim; any override journaled                                                    ev:
[ ] 0.8 spawn preflight: a throwaway worker was actually spawned and its exit status recorded; `mode:` set from that result;
        on failure §3's degraded list binds                                                                                    ev:

P1 CRYSTALLIZE  (orchestrator only — no spawns)  → contract.md, rubric-draft.md
[ ] 1.1 goal: an outcome, 1-3 lines                                                                                            ev:
[ ] 1.2 acceptance criteria — asked, each with a named oracle                                                                  ev:
[ ] 1.3 non-goals — asked, stated                                                                                              ev:
[ ] 1.4 prohibited outcomes — asked, stated or explicitly `none`                                                               ev:
[ ] 1.5 disappointment criteria — asked, pushed past the first answer; >=2 recorded                                            ev:
[ ] 1.6 named recipients — role-specific enough to simulate                                                                    ev:
[ ] 1.7 probe run verbatim — "if this lands, what changes for you?" — and answer quoted                                        ev:
[ ] 1.8 every row 1.1-1.7 either quotes the user or carries an ASSUME-n row with its default, its reason, and its status       ev:
[ ] 1.9 contract written to `contract.md`                                                                                      ev:
[ ] 1.10 draft rubric: 3-5 dims, weights sum to 1.0, each with a score-3 AND a score-1 descriptor; each disappointment
         criterion attached to a dim as a score-0 trigger                                                                      ev:
[ ] 1.11 one evaluator archetype assigned per dimension                                                                        ev:
[ ] 1.12 contract lint run (`run-discipline.md` §1, 6 conditions), each marked pass/fail                                       ev:

P1A ANCHOR, VERIFY, THEN FREEZE  → anchors.md, requote.md, rubric-frozen.md
[ ] 1A.1 exemplar sweep → `anchors.md`: >=1 exemplar and >=1 control, each row carrying a LOCATOR (file:line or URL), the
         VERBATIM SPAN at it, the NAMED PROPERTY the span shows, and a REJECT LIST — >=2 candidates considered for that property
         and beaten, each with its own locator and one line on why it lost; a one-candidate sweep writes `unchallenged`        ev:
[ ] 1A.2 every score-3 descriptor rewritten to cite an exemplar and its named property; every score-1 rewritten to the
         control; and each descriptor NAMES THE DIMENSION IT ANCHORS — a property may anchor at most one dimension unless
         the header declares `shared-property(n)`, so five dimensions resting on one property print as what they are         ev:
[ ] 1A.3 ext — RE-QUOTE, PROPERTY, SEPARATION, CHALLENGE: a worker that did not run the sweep re-opens EVERY 1A.1 locator →
         `requote.md`, one line per locator, line count equal to `anchors.md`'s, each line carrying TWO verdicts: (i)
         `exact-match | mismatch | unreachable` WITH WHAT IT READ; (ii) `property-present | property-absent | not-assessed`,
         naming the clause of the span that carries the property. Then, PER NAMED PROPERTY, it opens the CONTROL's locator and
         returns, naming the clause it read, `separating` (absent or materially weaker there) | `non-separating` (the control
         has it too, so the property cannot separate a 3 from a 1) | `non-comparable` (the control is not the same class of
         document doing the same job). It then returns, per exemplar, EITHER a locator and span of a document exhibiting that
         property MORE strongly, OR `none-better-found` naming where it searched. No checker → `unverified` / `unanchored`     ev:
[ ] 1A.4 1A.3's verdicts acted on: every `mismatch`, `property-absent`, `non-separating` or `non-comparable` row struck and its
         descriptor reverted to invented-and-flagged; a stronger candidate found → re-anchor (1A.1-1A.2 re-run on it) or declare
         `out-anchored`, which §3 makes ACCEPT-unreachable; no-exemplar fallback fired / did not fire — stated either way       ev:
[ ] 1A.5 Provenance Gate: every contract element elicited/ratified/parked; `silent` = 0                                        ev:
[ ] 1A.6 envelope recomputed from the §3 formula with the frozen dimension count, and re-authorized by the user (authorized,
         not restated)                                                                                                         ev:
[ ] 1A.7 engine preflight: per extra engine the spawn command was actually run and its exit status recorded; unreachable
         engines struck before P2 plans around them                                                                            ev:
[ ] 1A.8 rubric copied byte-for-byte to `rubric-frozen.md`, tagged R1 — after 1A.4, never before                               ev:

P2 TOURNAMENT  → candidates/, spawns/, scorecards/
[ ] 2.1 3-5 angles chosen, each a one-line bet, each disagreeing with the others                                               ev:
[ ] 2.2 generators spawned in isolation — none sees another's output or the loop history; `doc-deliverables.md` attached to
        each generator spawn when 0.4's class is `document`                                                                    ev:
[ ] 2.3 BLIND PAIR: every judge scored the exemplar and the control as two unlabelled, per-scorer-shuffled items BEFORE seeing
        any candidate — a score AND quoted evidence for each, persisted to `scorecards/<scorer>.md`; the orchestrator holds
        the key, applies the §P2 table itself and writes its verdict `calibrated | re-prompted | replaced` onto that
        scorecard. No `calibration:` field is accepted from a scorer                                                           ev:
[ ] 2.4 judging blind: provenance stripped AND candidate order shuffled per judge, and the shuffle recorded as a seed          ev:
[ ] 2.5 every candidate persisted in full to `candidates/`, not just the winner                                                ev:
[ ] 2.6 salvage list: >=1 grafting candidate per losing entry, or an explicit "nothing salvageable" for that entry             ev:
[ ] 2.7 winner and runner-up named from the judges' scores — never by majority vote, which discards correct answers already
        in the pool [EV-22]                                                                                                    ev:

P3 CONVERGE  (repeat per cycle; one `cycles/<n>.md` per cycle)
[ ] 3.1 cycle open: `rubric-frozen.md` and `contract.md` re-read, and the frozen dimension names and weights quoted into the
        cycle file — a quote a drifted memory cannot produce                                                                   ev:
[ ] 3.2 evaluators scored independently, each score stamped with its rubric version and citing an observation rather than an
        impression; no generator scored                                                                                        ev:
[ ] 3.3 ONE revision brief compiled, carrying every unconsumed salvage item until it is consumed, deferred with a reason, or
        carried into the next cycle                                                                                            ev:
[ ] 3.4 panel staged in at all-dims>=2: 2-4 skeptics, distinct angles; each briefed without the others' output, run for ONE
        round, and aggregated against the rubric rather than by vote — the conditions under which §7 keeps it at all           ev:
[ ] 3.5 at all-dims=3 the panel ratified or demoted; survivors carried forward as generator exclusions                         ev:
[ ] 3.6 every cycle's artifact retained; the one entering P4 is the best-scoring, not the last                                 ev:
[ ] 3.7 goal-alignment check written into the cycle file at the boundary: does this still serve the contract, semantically and
        not only by score                                                                                                      ev:
[ ] 3.8 unexplored-space rows appended to `unexplored.md` as they occurred, tagged with the cycle — never reconstructed later  ev:
[ ] 3.9 loop verdict per cycle from the §3 exit table, and that table's action taken. The last cycle's verdict is this run's
        exit; "Phase 3 exited" = this row carries a verdict                                                                    ev:
[ ] 3.10 §6 amendment, if opened: (a)-(d) each evidenced separately, R2 tagged, retained artifacts re-scored. Else `not
         applicable(no amendment)`                                                                                             ev:

P3R RECEPTION  → personas/
[ ] 3R.1 one persona per named recipient (max 5), built from the contract, rubric and loop history withheld; each returns THE
         VERBATIM SENTENCE IT STOPPED AT, and the span is grepped against the artifact — absent → the return is void and
         re-run                                                                                                                ev:
[ ] 3R.2 every finding routed to a named dimension and re-scored, or routed to §6 amendment, or recorded as a residual with
         the reason no dimension fits — a residual is legal ONLY once the cycle cap is spent                                   ev:
[ ] 3R.3 RE-ENTRY, written either way: a 3R.2 finding that moved a score re-opens P3 while cycles remain under §3's cap —
         counter advances, new `cycles/<n>.md`, P4 waits, causing finding named. Else: no score moved, or cap spent → demoted  ev:

P4 EXIT GATE  → gate4.md
[ ] 4.1 ext — blind comparative vs the P1A exemplar and vs the retained runner-up, each pairing judged in BOTH ORDERS by workers
        who never touched the artifact, each returning `PAIRWISE_VERDICT`; only order-consistent verdicts count, an inconsistent
        pairing is `inconsistent` (a state, not a loss); no worker → `not-run`, printed. **The EXEMPLAR pairing is judged PER
        NAMED PROPERTY — one verdict per 1A.1 property, never one overall**; the runner-up pairing is judged whole, and a
        consistent loss there names its property                                                                               ev:
[ ] 4.2 verdict acted on — loss to the runner-up re-runs the P3 evaluators over the two and 3.6 is recomputed; a property lost
        to the exemplar spends the bonus cycle WITH THAT PROPERTY AS ITS WRITTEN BRIEF, or becomes a named residual; at most one
        bonus cycle total, and any second verdict is advisory, reported not acted                                              ev:

P5 DELIVER  → report.md
[ ] 5.1 Fulfillment Report emitted, opening with the §5 state header; every §5 section present or `N/A + one-line reason`      ev:
[ ] 5.2 each acceptance criterion classified verified/partial/missed/dropped; each prohibited outcome classified
        held/violated/unverified on its own axis                                                                               ev:
[ ] 5.3 completion sweep run: the command, the hit count, the accounting for each hit                                          ev:
[ ] 5.4 unexplored-space ledger delivered as accrued; row count equals `unexplored.md`'s                                       ev:
[ ] 5.5 ledger entry appended with `outcome: pending`                                                                          ev:
[ ] 5.6 this card delivered with every row ticked or `not-run:`, and diffed against `card.md` on disk — the file is the card
        of record                                                                                                              ev:
[ ] 5.7 ext — IDENTITY AUDIT: a worker that did not run this wish recomputes the ten identities from the run directory
        (`identities.md`), naming every file it opened, and returns pass or the imbalance; pasted verbatim into the report and
        summarized in the header. An imbalance is a phase that did not run: name it, then run it or record it `not-run` — never
        adjust a count to close one                                                                                            ev:
```

## 2. Always / Never — the other half of the specification

**ALWAYS**

- **A1** Emit the Run Card into your visible response at every phase gate, evidence filled. A card held in your head
  is a card that loses rows.
- **A2** Quote the user's own words as the evidence for any row claiming elicitation. A paraphrase you wrote records
  your intent, not theirs.
- **A3** Write a phase's output to a file before opening the next phase. Prose about a step is not the step.
- **A4** State a figure once, in the file that owns it. `reference/evidence.md` owns every literature figure with its
  scope; this file carries one `[EV-n]` use-site each and the bare tag elsewhere. **Scope, named:** this binds
  literature figures; the document's own counts are owned by `identities.md` §0, recounted there.
- **A5** Grade a filled cell with a worker that was not in the context that filled it — the three `ext` cells, on the
  two-part condition the card legend states. **Sourced half:** intrinsic self-correction, with no external feedback,
  degrades performance on every benchmark tested [EV-20]. **Asserted half, measured nowhere in `evidence.md`:** that a
  fresh-context instance of the *same* model supplies the missing signal — fresh context removes context, not
  self-recognition, and self-preference is tied to the latter [EV-17]. **If that half is wrong**, two of the three
  cells still buy what a re-read catches mechanically: a locator that does not open, a span not in the file, an
  identity that does not sum — but not 1A.3's property and separation verdicts, judgments both.
- **A6** Ask one question, or one batch of at most four dimensions, per turn during P1. `crystallization-dialogue.md`
  owns how to ask; this rule owns the rate.

**NEVER**

- **N1** Never let the worker that produced or revised the artifact score, judge, attack or audit it — informally
  included, "a quick self-check" included [EV-20]. In `single-agent(declared)` mode it cannot be satisfied; §3's
  degraded-mode block, not your discretion, says what happens then.
- **N2** Never open a phase whose `ENTER` line is unmet. A skipped early phase poisons every later one: your own
  earlier errors in context raise your later error rate, and model scale does not fix it [EV-12].
- **N3** Never tick a card row without a path (§0.3). An empty cell is a truthful card; a tick with no file is the
  failure this harness detects last and least.
- **N4** Never reword a frozen rubric descriptor so the artifact can reach 3 — a goalpost move, and the hardest
  self-deception to catch afterwards. §6 is the only legal path, it produces R2, and it may never be opened by whoever
  produced the output that failed. Re-anchoring at 1A.4 happens before the freeze and may only raise the bar, so it is
  not this.
- **N5** Never present a same-model run as engine-diverse, a `mixed`, unverified or out-anchored anchor as `sourced`,
  an inconsistent pairing as a verdict, a single-agent run as full, or an unrun step as `N/A`. Each of the five has a
  declared state; use it.
- **N6** Never spawn a worker without three fields: the frozen rubric with its version tag, the exact output schema,
  and an output-length envelope — **and its prompt written to `spawns/` before it is issued, every spawn, not only the
  ones a card row names.** A **scoring** spawn carries a fourth field: the exemplar and control, now labelled, with
  the orchestrator's own breakdown for each, as worked examples. No schema returns prose you cannot aggregate; no
  envelope returns padding; no worked examples gives up the largest single effect here [EV-16a].
- **N7** Never run a second improvement loop inside this one. If the wrapped task owns its own, take that process's
  generator step and drop its termination gate — nested loops multiply cost and duel over oracles.
- **N8** Never treat row 0.7's confirmation as pre-authorizing anything but the spend. Ordinary duties on the wrapped
  work are unchanged — confirmation before a destructive action, commit and PR discipline when the deliverable is code
  — and autonomous mode does not skip 0.7, 1A.6 or §6.

## 3. Pre-resolved decisions — decided here so no phase improvises them

**Scope**, judged by how much one generator can produce well in one pass, read off at row 0.4 with both its values:
**S** one artifact, one sitting, one reader-path — N=3, outline · **M** one artifact with internal structure — N=3,
outline · **L** several coupled artifacts, or one whose parts must cohere — N=5, full-build · **XL** a set whose
composition is itself the design problem — N=5, full-build. N=5 requires an envelope that covers it, else N=3.
*Outline* = generators compete at outline level, one built; *full-build* = each ships a complete artifact. Plus at
most one bonus cycle from P4 — total N+1.

**Envelope.** Computed at card row 0.6, never quoted from here. Each term's range lives on the row that spends it:

```
agents = 1 (row 0.8) + 0 (P1 — the dialogue spawns nothing)
       + S (row 1A.1 sweep) + 1 (row 1A.3 checker) + E (row 1A.7, one per extra engine)
       + C (row 2.1 angles) + J (row 2.4 judges)
       + cycles × (D evaluators, row 1.10 + K skeptics, row 3.4)
       + P (row 3R.1) + 4 (row 4.1: 2 pairings × 2 orders) + 1 (row 5.7)
```

| Exit | Meaning |
|------|---------|
| `ACCEPT` | all dims = 3 on evaluators ID9 counts as calibrated, panel-ratified with 0 surviving attacks, no reception finding left undisposed **and 3R.3's re-entry taken wherever one moved a score**, `mode: full`, and `anchoring: sourced`. **`sourced` is defined here and nowhere else:** every score-3 descriptor's locator came back `exact-match` **and** `property-present` **and** `separating` — ID3(c)'s `anchored`, with `unreachable-and-flagged` and `invented-and-flagged` both 0 — and no `out-anchored` exemplar left un-re-anchored. Any other mixture prints `mixed(<anchored>/<descriptors>)`, which is a legal run and is **not** `sourced` |
| `reception-demoted` | a named recipient bounced off a rubric-perfect artifact, so the rubric mis-measured and the score moved — **and the cap was already spent, which is the only state in which 3R.3 may convert that finding into a residual instead of another cycle.** Ships best-so-far with the persona's verbatim stop-span. **Never reports as `ACCEPT`** |
| `diminishing-returns` | weighted Δ < 0.2 between cycles — a chosen constant, not a measured one. With surviving attacks open this reports as **plateau-with-open-attacks**, every attack listed — never as a clean plateau |
| `cap-reached` | the cycle cap (+ ≤1 bonus) elapsed below the ceiling |
| `budget-reached` | the envelope ceiling hit mid-loop → deliver best-so-far with the residual gap, and every carried salvage item listed as carried |
| `single-agent-best-effort` | `mode: single-agent(declared)`; the ceiling is unreachable by construction and the report says which checks were never available |
| `BLOCK` | any dim = 0, two identical failures in a row, or a second amendment request — stop and escalate to the user |

The ceiling is often unreachable; a clean `diminishing-returns` is honourable, and the report names what plateaued, and why.

**Degraded mode**, binding when row 0.8's preflight fails. These fourteen rows are `not-run: no spawn` — 1A.3, 1A.7,
2.2, 2.3, 2.4, 3.2, 3.4, 3.5, 3R.1, 3R.2, 3R.3, 4.1, 4.2, 5.7 — and no other row may carry that reason (ID10 checks
the biconditional). N1 is then unsatisfiable: the only available scorer is the producer, the configuration [EV-20]
measures as degrading. Scores are advisory and reported as such, `ACCEPT` is unreachable, and the only legal exits are
`single-agent-best-effort`, `budget-reached` or `BLOCK`. The header prints the mode.

## 4. Phases — entry, what to read, the failure prevented. Reference files below are basenames; all live in `reference/`.

### P0 — Scarcity Gate · rows 0.1-0.8
**ENTER:** the request exists. **READ:** `nanika-ledger.md`; `engine-map.md` §2a, holding row 0.8's literal command.

The ledger's entries are counted, not parsed from prose; a challenged invocation is priced, not refused, because a
gate that refuses gets routed around. **This gate changes nothing about the artifact — that is the whole of its
claim.** Row 0.8 is the load-bearing half: every `ext` cell, every judge and the whole envelope rest on being able to
spawn, and one throwaway worker makes that a detected capability rather than a declared one.

### P1 — Crystallize · rows 1.1-1.12
**ENTER:** rows 0.1-0.8 evidenced. **READ:** `crystallization-dialogue.md`; `run-discipline.md` §1 (row 1.12's lint).
Two files open — this phase ties P5 for the peak (§0.6).

The five rows agents drop here (1.2-1.5, 1.7) get dropped because they feel answered by the rest of the conversation.
They are not. **Row 1.7 reframes the rubric** — "make this proposal excellent" is usually "I need this person to say
yes." **Row 1.5 is only useful past the first answer**, always the inverse of the goal. Where the user says "just
decide", 1.8 still binds: nothing tells a delegated ASSUME from a question never asked, which is why 1.2-1.7 say
*asked*.

### P1A — Anchor, verify, then freeze · rows 1A.1-1A.8
**ENTER:** rows 1.1-1.12 evidenced. **READ:** `benchmark-anchoring.md`, which owns the sweep, the reject list, the
Provenance Gate behind 1A.5 and the four-part 1A.3 protocol; `engine-map.md` for 1A.7.

The control is not optional: without a low anchor, calibration is one-sided and cannot catch an inflating evaluator.
**The order of this phase is the mechanism:** re-read, property-checked, separation-checked and challenged at 1A.3,
disposed at 1A.4, frozen only then at 1A.8. **1A.3 guards three levels.** A locator plus a verbatim span costs a
fabricator a document that does not exist — that catches an *invented* exemplar. The property verdict and the
challenge catch one that is real, re-quotes perfectly, and is *weak*. **The separation verdict catches the level above
both:** an excellent document with a narrow property named off it passes every earlier check honestly — the reject
list beats two real candidates, the property is really there, and `none-better-found` is *true*, because a trivial
property has no stronger exemplar anywhere. What it cannot do is fail to appear in the control. So the checker opens
the control at the same property: `non-separating` means the property cannot tell a 3 from a 1; `non-comparable` means
the control was chosen absurd rather than ordinary, inflating every gap under it. 1A.2's dimension clause closes the
third level. **Two states the report may never merge:** `non-separating` is *a pair that exists and did not
discriminate* — a fact about the property, struck at 1A.4 and the descriptor reverted; the 1A.4 fallback and
`unanchored` are *no pair in the corpus at all* — a fact about the corpus, and the only one of the two that makes a
dimension unreachable rather than re-anchorable. `unreachable` at 1A.3 degrades the run the same way: an honest
weakening that must read as one. 1A.7 is the same gate for engine diversity.

### P2 — Tournament · rows 2.1-2.7
**ENTER:** rows 1A.1-1A.8 evidenced. **READ:** `evaluator-roster.md` §4, §6.

An angle is a different *bet about what makes this excellent*, not a different tone; two angles that could produce the
same artifact with different word choices are one angle. **Order is the trap:** candidates are generated, *then*
judges calibrate against the pair, *then* judging opens — blind judging is candidate selection, the one moment an
inflated score is unrecoverable. **The pair is used twice and the order must not swap:** at 2.3 unlabelled and graded
by the orchestrator, because a self-declared `calibration:` is a string the scorer typed about itself; only then
labelled, with the orchestrator's breakdown, on every scoring spawn (N6):

| what the orchestrator computes | action, written onto that scorer's scorecard |
|---|---|
| exemplar ≈ 3 ∧ control ≤ 2 | `calibrated` — proceed |
| control = 3 (inflates: every later 3 is meaningless) · control ≥ exemplar (cannot tell them apart) · exemplar < 3 (severe, or the anchor is unreachable as written) | `re-prompted` once, naming the control as an explicit score-1-2 reference; a second inflation writes `replaced` and the scorer is replaced. **The anchor is frozen and is not re-worded here** — N4 |

**An uncalibrated scorer cannot produce a ceiling ACCEPT** — a guard that leaves an artifact: one scorecard per scorer
under `scorecards/`, and ID9 both counts the files **and recomputes each verdict from the two scores against the table
above**, so a truthful pair under a false verdict is arithmetic a non-participant catches. Rows 2.2 and 2.4 are
otherwise negatives: N6's persisted prompt and 2.4's seed are what a warm, reused judge cannot produce. Judging is
pointwise, so its bias mitigation is shuffling order *across* judges; the *pairwise* one is 4.1.

### P3 — Converge · rows 3.1-3.10
**ENTER:** rows 2.1-2.7 evidenced. **READ:** `evaluator-loop.md`; `refutation-panel.md` from the first all-dims-2 cycle.

Every dimension is scored 0-3 with cited evidence, stamped with the rubric version it was made under (3.2) — a
trajectory crossing an amendment boundary untagged is silently incomparable. Row 3.9 stops the loop's state being
implicit: the longest phase is the likeliest to drift to a halt, and an unwritten verdict decides the exit in
retrospect. **The rubric is the single termination oracle**: the panel sits inside it as ratification, never as a
second verdict, and an attack no dimension can express routes to §6 (3.10), not to a new gate. Row 3.4 carries the
panel's independence conditions itself — the whole reason §7 keeps a mechanism the debate literature contradicts. Rows
3.1 and 3.7 are the reset that earns its cost [EV-12].

### P3R — Reception · rows 3R.1-3R.3 · **the one phase with a return edge**
**ENTER:** row 3.9 carries a verdict. **READ:** `evaluator-roster.md` §5. **EXIT:** to **P3** when 3R.3 fires.

Personas meet the artifact cold: no rubric, no loop history, no knowledge that it was optimized — a persona told "this
is our best work" evaluates the claim. **The verbatim stop-span is what makes a persona a reader rather than
reader-shaped prose:** a worker asked to imagine a recipient can produce three fluent paragraphs without opening the
artifact, but not a sentence that is *in* it. **A rubric-perfect artifact its recipient bounces off is a rubric
failure, so the score moves — and a moved score is a cycle, not a note.** That is 3R.3: the cap does not grow, the
counter advances inside it, and only a spent cap turns the finding into a residual (§3 `reception-demoted`).

### P4 — Exit gate · rows 4.1-4.2
**ENTER:** row 3.6 names the artifact **and 3R.3 did not fire**. **READ:** `evaluator-loop.md` §8, which owns the
`PAIRWISE_VERDICT` schema row 4.1 hands to each of the four workers.

A loss to the runner-up means convergence destroyed what the tournament found. **Both orders, consistent-only:**
swap-consistency has been measured as low as 23.8% [EV-16b], so a single-pass pairwise verdict is partly a verdict
about position. Agreement → verdict; disagreement → `inconsistent`, which the header carries. **The exemplar pairing
is per property, the runner-up pairing is not**: the artifact was built deliberately *not* to resemble the exemplar,
so an overall preference is mostly a preference about genre, while the anchored properties are the comparable part and
the part the rubric came from — and a lost property hands 4.2 a brief instead of a mood.

### P5 — Deliver · rows 5.1-5.7
**ENTER:** rows 4.1-4.2 evidenced. **READ:** `identities.md`; `run-discipline.md` §6 for row 5.3 — two files, tying P1.

Emit the report, run the audit, append the ledger, hand over. **Row 5.7 is the terminal external check**: an
orchestrator recomputing its own arithmetic is the compliance gap's own configuration [EV-14]. The auditor works on
AUD's protocol, and every identity has a bucket for every state the card legalises — `not-run` and `carried` included
— so an imbalance is never the audit's own artefact.

## 5. The Fulfillment Report — opens with a state header, so an unverified run cannot read as verified

```
mode:        full | single-agent(declared)                rubric: R1 | R2
anchoring:   sourced | mixed(n/n) | invented-fallback | unverified | unanchored
re-quote:    n exact-match / n mismatch / n unreachable | not-run(<reason>)
property:    n present / n absent / n not-assessed        reject-lists: n / n | unchallenged(n)
separation:  n separating / n non-separating / n non-comparable   shared-property(n) | one-per-dimension
challenge:   none-better | out-anchored | re-anchored     engines: cross-engine(<list>) | monoculture(declared)
evaluators:  n calibrated / n re-prompted / n replaced | not-run(<reason>)
reception:   clean | re-entered(n) | demoted | residual(n, cap spent)
exit gate:   vs-exemplar n properties: n won / n lost / n inconsistent · vs-runner-up won | lost(<property>) | inconsistent | not-run(<reason>)
identity:    pass | imbalance(n) | not-run(<reason>)      delta: UNMEASURED
gated artifact: <path>       exit: <§3 reason>       spend: <n> / <envelope>
```

Then all twelve sections, each present or `N/A` with a one-line reason. **Contract** — every element classified per
5.2, prohibitions on their own axis. **Anchoring** — exemplars and control with locators, spans, named properties, the
dimension each anchors, each reject list, 1A.3's verdicts per locator and property, the challenge return, the fallback
flag if it fired. **Calibration** — per scorer, both blind-pair scores and the orchestrator's verdict, as ID9 counted
and recomputed them. **Tournament** — angles, engine distribution or declared monoculture with the 1A.7 result, blind
scores, winner, runner-up, salvage grafted / rejected / deferred / carried. **Trajectory** — per-cycle weighted scores
per dimension tagged R1/R2, each cycle's 3.9 verdict, and which artifact shipped and why it, not the last.
**Gauntlet** — attacks raised / killed / survived-then-fixed / open / `unproven-because-new`, each of the last with
what would falsify it. **Reception** — per persona, the verbatim stop-span, every finding's disposal, and 3R.3's
decision: which finding re-opened P3, or why none did. **Amendment** — trigger, (a)-(d), R1→R2, re-scored delta, plus
any phase-block imperative the card did not carry (§0 item 1); omit when both are empty. **Exit gate** — the
exemplar's verdict per named property and the runner-up's whole, both orders, `inconsistent` where it applies, the
property that briefed the bonus cycle, advisory verdicts. **Exit** — reason, residual gap, spend. **Unexplored-Space
Ledger** — as accrued at 3.8, each row tagged with its cycle: the honest one-shot claim is not "nothing was left on
the table" but "here is what was left, and why." **Identity audit** — the auditor's return, verbatim, with the files
it opened; then **the Run Card** as delivered at 5.6, ending in the terminal line.

```
wish <slug> closed · card <n> rows: n ticked + n not-run · identities 10/10 balance
· anchors 5 = 5 exact-match · property 4 present + 1 not-assessed · separation 4 = 4 separating
· reject-lists 4 / 4 + 0 unchallenged · challenge none-better · one-per-dimension
· salvage 9 = 6 grafted + 2 rejected + 1 deferred + 0 carried · attacks 7 = 4 killed + 2 fixed + 0 open + 1 unproven-because-new
· scorers 3 = 3 calibrated + 0 re-prompted + 0 replaced · ext 3 = 3 recorded + 0 not-run
· reception 2 = 1 re-entered + 1 re-scored + 0 residual · exit-gate 4 properties = 4 won · exit ACCEPT
```

## 6. Rubric amendment — once, user-ratified

A frozen rubric that cannot express a real quality failure converges the loop to a ceiling on the wrong axis.
Amendment is legal when all four hold, row 3.10 evidencing each separately: (a) a surviving attack or reception
finding exists; (b) no dimension can express it, and re-scoring under one was tried first; (c) the user ratifies; (d)
retained artifacts are re-scored on the amended rubric so the trajectory stays comparable. Result: **R2**; a second
request is §3's business. Calibration failures never route here (N4).

## 7. What each mechanism buys, what was removed, and what defeats this

**Kept — and what a run loses without it.** `evidence.md` owns every figure; the tags below point, never redefine.

| Mechanism | Delete it and a run loses | Evidence |
|---|---|---|
| Contract → frozen rubric (1.9-1.12, 1A.8) | any oracle at all; every later mechanism maximizes whatever the generator decided the ask meant | decomposition into explicit checkable items beats holistic judgment — **training-time** evidence only, on instruction-following benchmarks [EV-24] |
| Sourced anchor + control, **re-quoted, property-checked, separation-checked and challenged by a non-participant** (1A.1-1A.4) | the ceiling, and the only steps that can catch an invented exemplar, a weak one, or a trivial property named off a strong one; `sourced` becomes a word | — (design argument; the re-read is mechanical, the property and separation verdicts are not — A5) |
| **Blind-pair calibration (2.3), counted and recomputed by ID9** | the meaning of "3"; an inflating judge makes every later ceiling ACCEPT vacuous | reference-guided grading cut **math**-grading judge failure 70% → 15%, the largest single effect in the file — and it is borrowed across settings: no one has measured it for rubric grading of prose [EV-16a] |
| Angle tournament, blind, shuffled (2.1-2.7) | one first idea, iterated, graded by a judge that can see whose it is | author labels swing **preference** votes up to 50pp and **pointwise** ratings up to 12pp [EV-19] — P2's judging is pointwise, so 12pp is the figure that applies here and 50pp is the ceiling of a setting this skill does not use; best-of-n is supported only in its **majority-vote** form, which rows 2.7 and 3.6 deliberately do not use [EV-23] |
| Salvage wiring (2.6 → 3.3) | the tournament's losers entirely; the run bought a lottery ticket, not a search | — (structural; measured only by E3's deletion control) |
| External-only revision (N1, A5) | the artifact gets worse, not better, after each self-review | the self-correction result, quoted once at A5 [EV-20]; the same-model converse is asserted, not measured — A5 |
| Refutation panel (3.4-3.5) | the attack surface nobody on the rubric is looking at | contradicted as *debate*; kept as a non-debate on row 3.4's conditions — see below |
| **Reception with verbatim spans (3R.1), and its return edge (3R.3)** | the difference between a reader and three paragraphs of reader-shaped prose — and, without 3R.3, the consequence: a bounce that only moves a number in the report | — (grep-checkable, zero extra spawns; 3R.3 spends a cycle already inside §3's cap) |
| **Both-order exit gate (4.1), the exemplar pairing per property** | half the pairwise verdict; a single pass is partly a verdict about position — and an overall exemplar preference is a preference about genre, which briefs nothing | the swap-consistency floor, quoted once at P4 [EV-16b] |
| **Identity audit by a non-participant (5.7)** | the closing check; the orchestrator grading its own arithmetic is the configuration behind the compliance gap | the compliance gap, quoted once at §0 item 3 [EV-14] |
| **Spawn preflight (0.8) and engine preflight (1A.7)** | the distinction between a capability and a claim about one; every `ext` row silently becomes a self-report | — (structural; the failure it prevents was observed in this skill's own run) |

**Cut, and what covers the failure now.** What would bring each back: `evidence.md` §3.

| Removed | Why | What covers the failure now |
|---|---|---|
| One-Shot Gate | asked an agent whether a redo it will not perform would be better — a counterfactual with no available evidence, and the "yes" condition was pre-narrowed | row 4.1, which compares against two artifacts that exist, in both orders |
| Dual-lineage carry | the most expensive escalation in the old skill, specified in one sentence with no merge criterion, no schema and no evaluator | rows 3.6 and 4.1, at the four P4 agents the §3 formula prices |
| Cross-engine as a *mechanism* | on a single-host run it resolved to a sentence in the report | angle diversity is the load-bearing half (row 2.1); engine diversity is an amplifier gated by the 1A.7 preflight |
| The near-ceiling pre-mortem, the failure-modes table (24 rows), the per-host model-name table, and the run-level `Done when` | the pre-mortem duplicated the panel's Omission and Durability angles at the same trigger; every failure-mode mitigation was a pointer to a section above it; model names age faster than anything else here; the `Done when` restated seven P5 card rows in different words | rows 3.4-3.5; the phase blocks, which state each failure's mechanism at its point of use; role names in `engine-map.md`; the card, which is the exit condition |
| Standalone rows 2.4 (inflation re-prompt) and 3.3 (score cites an observation); row 4.3 (bonus-cycle cap), folded into 4.2 this cycle | each was one clause with no artifact of its own; folded into rows whose artifact already exists | the behaviours survive as clauses of 2.3, 3.2 and 4.2; the row count fell by three across two cycles and the behaviour count did not |
| The `spawns/` clauses on rows 2.2 and 2.4 | they covered two of the seven spawn kinds and left the rest to §0 prose — an orphan D2 found twice | **N6**, which now carries it for every spawn, so three sites became one and the coverage widened |

**Contradicted classes, kept deliberately.** Multi-agent debate does not reliably beat chain-of-thought at matched
compute; conformity rises per round [EV-21, EV-22]. The P3 panel is kept because it is not a debate — **row 3.4
carries the conditions**, so they are executable and countable. If it ever becomes a discussion, cut it. Row 2.7
refuses consensus voting at P2 for the same reason.

**How this gets defeated from the inside.** Each leaves the report perfect; each is paired with its residue, weak ones named.

| The defeat | The residue that catches it |
|---|---|
| **Cherry-picking a weak exemplar.** Real, re-quotable, and mediocre. | Partial. 1A.3 returns `property-present/absent` with the span clause; 1A.1 requires a reject list of ≥2 beaten candidates with locators, and **ID3(e) now counts the lists and opens each reject locator** — the header's `reject-lists: n / n` stopped being a number the orchestrator typed; 1A.3's challenge returns a stronger document or `none-better-found` with where it looked; a find makes the run `out-anchored`, ACCEPT-unreachable. **What this does not buy:** the challenger is the same class of system, a lazy `none-better-found` is cheap, and a sweep can list two straw rejects — ID3(e) reads that they exist and open, never *why each lost*. A raised cost, not a detection. |
| **Naming a trivial property off a strong document.** Strictly worse than the row above: the challenger is diligent and *correct* — a narrow property has no stronger exemplar anywhere — and the run is still anchored on nothing. | New this cycle, and the residue is real but asserted. A trivial property is one the control has too, so 1A.3 opens the control at the same property and returns `separating | non-separating | non-comparable`; `non-separating` is struck by 1A.4 and ID3(c) fires if it is not. **What this does not buy:** a property that is narrow *and* genuinely absent from the control still passes — 1A.2's dimension clause forces it to be the property that dimension measures, and that mapping is judged by the orchestrator with no auditor. And the verdict itself is A5's asserted half. |
| **Anchoring five dimensions on one property.** | Closed as a silent state, not as a possibility. 1A.2 binds one property to one dimension unless the header prints `shared-property(n)`, and ID3(c) counts descriptors against named properties. A run may still declare it and ship; it may not do it quietly. |
| **A maximally weak control** — absurd rather than ordinary, which inflates every exemplar-control gap and passes an inflating judge at 2.3's `control ≤ 2`. | Partial, and new. `non-comparable` at 1A.3 is the control's first external verdict; 1A.4 strikes on it. It rests on one judgment from the same class of system, and 2.3's threshold is unchanged: an ordinary-but-mediocre control still passes an inflating judge. |
| **A false `not-run:` reason** — dropping 2.6, 3.4 or 3.8 under a plausible string and exiting clean. | The legend closes the vocabulary to six reasons and ID1 rejects any other string. Two are self-certifying (`no spawn` cross-checked by ID10 against `mode:`; `no external worker` by ID8 against `ext/`). The other four are checked for form, not truth: `not applicable(document)` on 5.3 is legal and unverified. Narrower than before, not closed. |
| **A mis-declared `mode:`** — printing `full` while spawn-dependent rows sit `not-run`. | ID10, both directions, against §3's fourteen-row list. It cannot detect a run that spawned nothing and ticked the rows anyway — the `ext` forgery row below. |
| **`evaluators: calibrated` typed by the orchestrator that both applied the guard and declared ACCEPT.** | ID9 counts scorers from `scorecards/` **and recomputes each verdict from the two scores against §P2's table**, so a truthful pair under a false verdict — the cheaper forgery — is now caught. A wholly fabricated scorecard is not. |
| **A `spawns/` prompt file written without ever spawning.** N6 requires the file before the spawn; nothing observes the spawn. | **None.** Same class as the `ext` forgery and priced the same way: a written prompt with no worker behind it passes every check, and no identity counts `spawns/` at all. It is named here because until this cycle it was the one residue the document neither caught nor priced. |
| A `silent` contract element written up as `ratified`. The classifier is the agent that wrote the contract. | Weak, and known to be. ID2 sums a partition and so balances whenever everything is classified. The real check is A2 — and A2 has no auditor, so this is a rule, not a residue. |
| A re-quote checker that pastes back the span it was handed instead of re-opening the locator (1A.3). | The checker returns **what it read**; the report carries both strings side by side, and a paste-back is byte-identical with no surrounding context. Evadable for one invented sentence of context — this catches laziness, not forgery. |
| Selective re-quote: dropping the one locator that would not verify. | 1A.3 requires one line per locator and ID3(a) compares that count against `anchors.md`'s. A short `requote.md` is an imbalance, not a clean `0 mismatch`. |
| An `ext` cell filled by the orchestrator itself, at 1A.3, 4.1 or 5.7. | The card legend's two-part record, counted by ID8 against three cells. This converts impersonation from an omission into a deliberate forgery — a real raising of the cost, and **not** detection: an orchestrator that writes both halves of the file passes. The harness has no defence against that and should not claim one. |
| An attack reclassified `unproven-because-new` to preserve an ACCEPT. The escape hatch is deliberate — it protects bold work — and it is abusable. | ID5 carries it as its own bucket, and **the §5 terminal line now has a field for it**, beside the other zero-valued buckets it already printed. |
| Salvage marked `deferred` on every item — technically a disposition, substantively a discard. | ID4 splits raised into grafted + rejected + deferred + carried; an all-`deferred` list shows as zero grafted against a non-zero raised, on one line. |
| Row 3.8's ledger written once at P5 instead of accrued per cycle. | Weak: 5.4 compares two counts the same agent wrote, and the per-cycle tag is the only friction. A prohibition with a cheap residue, named here rather than called unfakeable. |
| An evidence file that exists but evidences nothing. | None. ID1 checks that a path resolves, not that its contents match the row. This is the largest hole left, and E2 measures it rather than closing it. |

The harness still cannot tell a well-made artifact from a well-made *record* of one. What it does: a dropped step
leaves an empty cell, an unresolving path, or a `not-run:` reason outside the six, **provided 5.7 ran**. It cannot
check that the file behind a tick says what the row claims, tell a forged `ext` or `spawns/` record from a real one,
or prove an unbettered exemplar was the best there was.

## 8. Reference files

Twelve, one level deep, each with its own `Owns:` and `Read when:` header, not restated here. Nine load at the phase
whose `READ:` names them (`run-discipline.md` at two — why P1 ties P5); `doc-deliverables.md` rides row 2.2's spawn;
`evidence.md` and `evaluations.md` on question only.
