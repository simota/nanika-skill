---
name: nanika
description: "Optional high-cost quality harness for code, documents, designs or plans when a materially wrong first delivery is costly to undo AND extra search or scrutiny beyond the domain process is justified. Not for ordinary reversible work or merely important/best/critical phrasing. Domain skills own the work; nanika may wrap them. Explicit invocation still requires spend consent."
allowed-tools: Read Write Edit Bash WebSearch WebFetch Agent
compatibility: "Needs a writable filesystem and a way to spawn an independent worker with its own context; reference/engine-map.md maps that to each host."
metadata:
  requires-capability: spawn-independent-worker
---
# Wish — the one-shot delivery harness

**REQUIRES:** a filesystem you may write to, and the ability to spawn an independent worker with its own context. The
frontmatter declares that capability by name, not by host tool: **the spawn tool's name, the model names and every
per-host command live in `reference/engine-map.md` and nowhere else** — porting nanika is one file's edit. The one
exception is `allowed-tools`, a host pre-approval hint for the invoking turn that neither restricts nor guarantees a tool. Row 0.8 tests the capability by using it; §3's degraded block says what a
failure costs. Nothing depends on another skill.

**DELTA: UNMEASURED.** No with-skill / without-skill A/B has been run on this document. Four evaluations that would
measure it — including a deletion control that can only shrink this skill — ship written and unrun in
`reference/evaluations.md`, each headed `status: NEVER RUN`, E1 carrying its arms, its n, its judge count and its
pre-registered effect size. Until they run, an untested harness and a tested one look the same.

## 0. How to execute this document

This is not an essay about quality. It is a harness, and you are the machine in it.

1. **The specification is the Run Card (§1), Always/Never (§2) and §3's decisions.** Rows and rules are addresses, not atomic instructions. Tables explicitly delegated by a row are part of its requirements.
   `identities.md` §0 owns the address inventory. Phase commentary adds no rules; an unowned imperative is a
   specification defect, recorded in the report's Amendment section and not executed.
2. **Write the card to `.nanika/runs/<slug>/card.md` before Phase 0.** A1 owns gate updates and visible summaries.
3. **Evidence needs a path and supporting content.** Every filled cell points to `file:line` in the run directory;
   the content must support that row. No artifact means the step cannot be credited as performed; an artifact alone is insufficient.
   The process/report gap [EV-14] motivates records, not a claim that records solve it. Preserve, as applicable:
   `card.md`, `gate.md`, `contract.md`, `rubric-draft.md`, `anchors.md`, `requote.md`, `engines.md`, `rubric-frozen.md`,
   `decisions.md`, `candidates/`, `cycles/`, `personas/`, `gate4.md`, `unexplored.md`, `report.md`, `scorecards/`, `ext/`,
   and `spawns/`.
   All persistence is subject to A2; unavailable or redacted evidence limits the claim, never licenses a fake tick.
4. **Three cells are `ext`** — 1A.3, 4.1 and 5.7. The card legend defines the state, ID8 counts it from `ext/`, and
   **A5** says what it buys and what it does not.
5. **The gate is hard.** A phase begins only when every card row of the previous phase carries evidence or a legal
   `not-run: <reason>`. If a row is empty, the only legal next action is to fill it.
6. **Execution capacity is unmeasured.** Row clauses, numbered reference rules and IFScale keyword instructions
   [EV-10] are different units; no ratio between them is a safe instruction budget. E4 tests the weakest tier's
   execution. On failure, reduce the card or duplicated instructions rather than append more explanations.

## 1. The Run Card

```
WISH RUN CARD — run: <slug> · scope: <S|M|L|XL> · class: <code|document|design|plan>
cycles: <N + ≤1 bonus> · generation: <outline|full-build>   (both read off §3 at row 0.4)
rubric: <R1|R2> · mode: <full | single-agent(declared)>
tick = supporting record claimed at a run-dir path (§0.3), not independently verified quality. blank = not done.
not-run:<reason> = skipped; the reason must be one of six: `no spawn` · `no external worker` ·
  `not applicable(<class|scope|no amendment|first wish|single cycle>)` · `precondition unmet(<row>)` · `user declined(<path>)` ·
  `capability absent(<name>)`. Any other string is an ID1 imbalance at 5.7.
ext = fillable only by a worker that was not in the context it checks, AND `ext/<row>.md`, one file per cell, appended and never overwritten, holds
each such worker's prompt and raw return. A saved record alone does not authenticate a worker or its independence.

P0 SCARCITY GATE  → gate.md
[ ] 0.1 run dir `.nanika/runs/<slug>/` exists and holds this card                                                                ev:
[ ] 0.2 ledger read; "this is wish #N", last date/intent/exit stated                                                           ev:
[ ] 0.3 previous nanika's `outcome` backfilled by asking, or `unknown` because they declined                                     ev:
[ ] 0.4 deliverable class and scope class chosen and written; the cycle cap AND the generation level read off §3's scope line
        for that class and written into the card header                                                                        ev:
[ ] 0.5 state the concrete cost of a materially wrong first delivery and why the cheaper domain path is insufficient.
        Recommend nanika only when that loss is high AND additional search or scrutiny has a specific expected use;
        otherwise recommend the cheaper path. Unknown stakes or marginal value → clarify, not launch.
        Urgency words, novelty alone and an explicit invocation are not severity evidence                                       ev:
[ ] 0.6 envelope computed from the §3 formula, not quoted from prose                                                           ev:
[ ] 0.7 user approved the stated spend ceiling (including only explicitly granted headroom) and the data/retention
        boundary under A2; record consent in the approved form and any override of the cheaper-path recommendation.
        `/nanika` alone is not informed authorization                                                                          ev:
[ ] 0.8 spawn preflight: a throwaway worker was actually spawned and its exit status recorded; `mode:` set from that result;
        on failure §3's degraded list binds                                                                                    ev:

P1 CRYSTALLIZE  (orchestrator only — no spawns)  → contract.md, rubric-draft.md
[ ] 1.1 goal: an outcome, 1-3 lines                                                                                            ev:
[ ] 1.2 acceptance criteria — asked, each with a named oracle                                                                  ev:
[ ] 1.3 non-goals — asked, stated                                                                                              ev:
[ ] 1.4 prohibited outcomes — asked, stated or explicitly `none`                                                               ev:
[ ] 1.5 disappointment criteria — asked, pushed past the first answer; >=2 recorded                                            ev:
[ ] 1.6 named recipients — role-specific enough to simulate                                                                    ev:
[ ] 1.7 probe run verbatim — "if this lands, what changes for you?" — and answer retained per A2                                        ev:
[ ] 1.8 every row 1.1-1.7 has user evidence in A2's approved form or an ASSUME-n with default, reason and status       ev:
[ ] 1.9 contract written to `contract.md`; `decisions.md` kept from here per `run-discipline.md` §2                                                                                      ev:
[ ] 1.10 draft rubric: 3-5 dims, weights sum to 1.0, each with a score-3 AND a score-1 descriptor; each disappointment
         criterion attached to a dim as a score-0 trigger                                                                      ev:
[ ] 1.11 one evaluator archetype assigned per dimension                                                                        ev:
[ ] 1.12 contract lint run (`run-discipline.md` §1, 8 conditions), each marked pass/fail                                       ev:

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
         property MORE strongly, OR `none-better-found` naming where it searched. No checker → `anchoring: unverified`         ev:
[ ] 1A.4 1A.3's verdicts acted on: every `mismatch`, `property-absent`, `non-separating` or `non-comparable` row struck and its
         descriptor reverted to invented-and-flagged; a stronger candidate found → re-anchor, at most once per exemplar (1A.1-1A.2 re-run on it, 1A.3 once on the new
         locators; a second stronger candidate for that exemplar → `out-anchored`) or declare `out-anchored`, which §3 makes ACCEPT-unreachable; no-exemplar fallback fired / did not fire — stated either way       ev:
[ ] 1A.5 Provenance Gate: every contract element elicited/ratified/parked; `silent` = 0                                        ev:
[ ] 1A.6 envelope recomputed from §3 with the settled dimensions; show the delta. Re-authorize only when the approved
         ceiling or scope/data/destination/retention boundary would be exceeded or changed; otherwise cite 0.7's approval       ev:
[ ] 1A.7 engine preflight: per extra engine the spawn command was actually run and its exit status recorded; unreachable
         engines struck before P2 plans around them                                                                            ev:
[ ] 1A.8 rubric copied byte-for-byte to `rubric-frozen.md`, tagged R1 — after 1A.4, never before                               ev:

P2 TOURNAMENT  → candidates/, spawns/, scorecards/
[ ] 2.1 3-5 angles chosen, each a one-line bet, each disagreeing with the others                                               ev:
[ ] 2.2 generators spawned in isolation — none sees another's output or the loop history; `doc-deliverables.md` attached to
        each generator spawn when 0.4's class is `document`                                                                    ev:
[ ] 2.3 BLIND PAIR: every judge scored, per dimension whose descriptor is `anchored` (others `no-pair`), that dimension's
        exemplar and its control (`anchors.md` pairs them) as two unlabelled, per-scorer-shuffled items on that dimension
        BEFORE seeing any candidate — a score AND quoted evidence for each, persisted to `scorecards/<scorer>.md`; the orchestrator holds
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
        impression; no generator scored; each evaluator passed 2.3's blind pair under the §P2 table before its first score,
        on its own scorecard                                                                                                   ev:
[ ] 3.3 ONE revision brief compiled, carrying every unconsumed salvage item until it is consumed, deferred with a reason, or
        carried into the next cycle                                                                                            ev:
[ ] 3.4 panel staged in at all-dims>=2: 2-4 skeptics, distinct angles; each briefed without the others' output, run for ONE
        round, and aggregated against the rubric rather than by vote           ev:
[ ] 3.5 at all-dims=3 the panel ratified or demoted; surviving attacks (ID5 `open`) carried forward as generator exclusions                         ev:
[ ] 3.6 every cycle's artifact retained; the one entering P4 is the best-scoring, not the last                                 ev:
[ ] 3.7 goal-alignment check written into the cycle file at the boundary: does this still serve the contract, semantically and
        not only by score                                                                                                      ev:
[ ] 3.8 unexplored-space rows appended to `unexplored.md` as they occurred, tagged with the cycle — never reconstructed later  ev:
[ ] 3.9 loop verdict per cycle: `continue`, or an exit from the §3 table with its action taken — provisional until §3's
        loop order fixes the run's exit; "Phase 3 exited" = this row carries an exit                                           ev:
[ ] 3.10 §6 amendment, if opened: (a)-(d) each evidenced separately, R2 tagged, retained artifacts re-scored. Else `not
         applicable(no amendment)`                                                                                             ev:

P3R RECEPTION  → personas/
[ ] 3R.1 one persona per named recipient (max 5), built from the contract, rubric and loop history withheld; each returns THE
         VERBATIM SENTENCE IT STOPPED AT, and the span is grepped against the artifact — absent → the return is void and
         re-run once; a second void is a named residual                                                                        ev:
[ ] 3R.2 every finding routed to a named dimension and re-scored, or routed to §6 amendment, or recorded as a residual with
         the reason no dimension fits — a no-dimension residual is legal ONLY once the cap is spent or §6 was declined or already used    ev:
[ ] 3R.3 RE-ENTRY, written either way: a 3R.2 finding that moved a score re-opens P3 while cycles remain under §3's cap —
         counter advances, new `cycles/<n>.md`, P4 waits, causing finding named. Else: no score moved → clean; cap spent → demoted: exit `reception-demoted` only on a rubric-perfect artifact, else 3.9's exit stands ev:

P4 EXIT GATE  → gate4.md
[ ] 4.1 ext — blind comparative vs the P1A exemplars and vs the retained runner-up, each pairing judged in BOTH ORDERS by workers
        who never touched the artifact, each returning `PAIRWISE_VERDICT`; only order-consistent verdicts count, an inconsistent
        pairing is `inconsistent` (a state, not a loss); no worker → `not-run`, printed. **The EXEMPLAR pairing is judged PER
        NAMED PROPERTY — one verdict per 1A.1 property, never one overall**; the runner-up pairing is judged whole, and a
        consistent loss there names its property                                                                               ev:
[ ] 4.2 verdict acted on — loss to the runner-up re-runs the P3 evaluators over the two and 3.6 is recomputed; a property lost
        to the exemplar spends the bonus cycle WITH THAT PROPERTY AS ITS WRITTEN BRIEF, or becomes a named residual; at most one
        bonus cycle total, and any second verdict is advisory, reported not acted                                              ev:

P5 DELIVER  → report.md
[ ] 5.1 Fulfillment Report emitted from a fresh read of `rubric-frozen.md`, opening with the §5 state header; every §5 section present or `N/A + one-line reason`      ev:
[ ] 5.2 each acceptance criterion classified verified/partial/missed/dropped; each prohibited outcome classified
        held/violated/unverified on its own axis, each passing `run-discipline.md` §5's test                                                                               ev:
[ ] 5.3 completion sweep run: the command, the hit count, the accounting for each hit                                          ev:
[ ] 5.4 unexplored-space ledger delivered as accrued; row count equals `unexplored.md`'s                                       ev:
[ ] 5.5 ledger entry appended with `outcome: pending`                                                                          ev:
[ ] 5.6 deliver a link to the full card, every row ticked or `not-run:`; the linked `card.md` is the card of record               ev:
[ ] 5.7 ext — IDENTITY AUDIT: a worker that did not run this wish recomputes the ten identities from the run directory
        (`identities.md`), naming every file it opened, and returns pass or the imbalance; retain its raw return in `ext/5.7.md`, linked
        from the report and summarized in the header. An imbalance is a phase that did not run: name it, then run it or record it `not-run` — never
        adjust a count to close one                                                                                            ev:
```

## 2. Always / Never — the other half of the specification

**ALWAYS**

- **A1** Update the full `card.md` at each gate. Show the user a compact phase/delta/blocker/spend summary and its
  link; reprint the full card only on request or when needed to resolve a discrepancy. The audit artifact stays complete.
- **A2** Before copying user data, record the approved boundary in `gate.md`: current execution only, approved worker
  destinations, or public; plus what may persist and for how long. Unapproved web queries, other workers/engines,
  persistence and commits are not authorized by invocation. Keep run records private and untracked by default.
  For elicitation, retain only permitted minimal quotes, or a user-approved redaction/summary labelled as such.
  Never call a summary verbatim or a hash proof of meaning/consent. This governs all prompts, candidates and ledgers;
  evidence withheld for privacy remains unverified, not silently complete.
- **A3** Write a phase's output to a file before opening the next phase. Prose about a step is not the step.
- **A4** State a figure once, in the file that owns it. `reference/evidence.md` owns every literature figure with its
  scope; this file carries one `[EV-n]` use-site each and the bare tag elsewhere. **Scope, named:** this binds
  literature figures; card and rule address counts are owned by `identities.md` §0, recounted there.
- **A5** Use a worker outside the producer's context for the three `ext` cells. Fresh context, model, engine,
  prompt and evidence-source separation are different axes, not guarantees of independent judgment. Re-quoting and
  identity arithmetic can be mechanically checked; property, separation and pairwise judgments cannot be certified
  by worker count. Intrinsic correction without external feedback has failed on reasoning tasks [EV-20]; this does
  not establish a same-model fresh-context benefit. Self-recognition remains a risk [EV-17]. Use native execution
  receipts when the platform supplies them; otherwise claim only a spawn record is present, not authenticated execution.
- **A6** Ask one question, or one batch of at most four topics, per turn during P1. `crystallization-dialogue.md`
  owns how to ask; this rule owns the rate.

**NEVER**

- **N1** The producer may run tests, inspect renders and debug using external feedback, but may not supply its own
  independent score, judge verdict, refutation or audit. Tool-grounded self-testing is not intrinsic self-correction
  [EV-20], nor does it replace independent acceptance checking. §3 owns the declared single-agent fallback.
- **N2** Never open a phase whose `ENTER` line is unmet. A skipped early phase poisons every later one: your own
  earlier errors in context raise your later error rate, and model scale does not fix it [EV-12].
- **N3** Never tick a card row without a path (§0.3). An empty cell is a truthful card; a tick with no file is the
  failure this harness detects last and least.
- **N4** Never reword a frozen rubric descriptor so the artifact can reach 3 — a goalpost move, and the hardest
  self-deception to catch afterwards. §6 is the only legal path, it produces R2, and it may never be opened by whoever
  produced the output that failed. Re-anchoring at 1A.4 happens before the freeze and may only raise the bar, so it is
  not this.
- **N5** Never call same-model judgments model-independent, record completeness quality, an anchor ID3(c) does not
  compute as `sourced` sourced, an inconsistent pairing a verdict, a single-agent run full, a persona return an observed recipient reaction, or an unrun step N/A.
  Report the actual scope of the evidence rather than upgrading its label.
- **N6** Before each spawn, save its permitted prompt to `spawns/`; include its task, exact output schema and
  output-length envelope. Add only role-appropriate, A2-approved context: the versioned rubric for rubric scoring,
  no rubric/history for cold-read personas, and no nonexistent rubric for preflight or pre-freeze work.
  Blind calibration and blind comparisons get no answer/provenance labels. After calibration, rubric scorers may
  receive labelled anchor breakdowns as a borrowed grading aid [EV-16a], not as evidence that they are reliable.
- **N7** Flatten only a wrapped process's optional improvement loop. Preserve its safety, correctness, acceptance
  and permission gates; a failed domain gate disqualifies the candidate regardless of rubric score. Use one agreed
  revision budget within both processes' hard caps. Conflicting oracles require upstream repair or escalation,
  never removal of a non-negotiable gate merely to avoid two loops.
- **N8** Row 0.7 authorizes only the stated spend and data/retention boundary, not publication, destructive actions
  or code commits. Ordinary domain duties remain; autonomous mode does not skip required consent under 0.7, 1A.6 or §6.

## 3. Pre-resolved decisions — decided here so no phase improvises them

**Scope**, judged by how much one generator can produce well in one pass, read off at row 0.4 with both its values:
**S** one artifact, one sitting, one reader-path — N=3, outline · **M** one artifact with internal structure — N=3,
outline · **L** several coupled artifacts, or one whose parts must cohere — N=5, full-build · **XL** a set whose
composition is itself the design problem — N=5, full-build. Row 0.6 lowers N=5 to 3, and rewrites the header, when its envelope cannot cover N=5.
*Outline* = generators compete at outline level and a spawned generator builds the winner before cycle 1, so 4.1's
runner-up is the second-best retained cycle artifact (3.6), or `not applicable(single cycle)`; *full-build* = each ships a complete artifact. Plus at
most one bonus cycle from P4 — total N+1.

**Envelope.** Computed at 0.6. Include wrapped-domain work and retries, not just nanika seats. Counts are not
monetary cost or quality evidence; name the cost units actually bounded and any unpriced exposure. No overrun is authorized
by a low point estimate. Each term's range lives on the row that spends it:

```
agents = 1 (row 0.8) + 0 (P1 — the dialogue spawns nothing)
       + X × (1 + re-anchors) (row 1A.1: X sweep workers, 0 when the orchestrator sweeps) + 1 + re-anchors (row 1A.3 checker) + E (row 1A.7, one per extra engine)
       + C (row 2.1 angles) + J (judges, >= 3 per `evaluator-roster.md` RS3) + 1 (outline build; outline only)
       + (N+1) × (1 generator revision + D evaluators, row 1.10 + K skeptics, row 3.4)
       + P × reception passes (row 3R.1) + 4 × P4 passes (row 4.1: 2 pairings × 2 orders) + D (row 4.2) + 1 (row 5.7)
       + replaced scorers, one re-run per void return, and wrapped-domain workers and retries
```

| Exit | Meaning |
|------|---------|
| `ACCEPT` | **Harness criteria satisfied, not maximal quality or measured benefit.** All dims = 3 on evaluators ID9 counts as calibrated, panel-ratified with 0 surviving attacks (ID5's `open` bucket; `unproven-because-new` is reported, never blocking), no reception finding left undisposed **and 3R.3's re-entry taken wherever one moved a score**, every non-advisory 4.1 loss disposed by 4.2, `mode: full`, and `anchoring: sourced`. **`sourced`:** every score-3 descriptor is ID3(c)'s `anchored` (`exact-match` ∧ `property-present` ∧ `separating`), the two flagged buckets are 0, and no exemplar is `out-anchored`; ID3(c) computes it and every other anchoring state |
| `reception-demoted` | a simulated cold-read finding changed a score on a rubric-perfect artifact; this is not observed recipient rejection, with the cap spent (3R.3). Ships best-so-far with the persona's verbatim stop-span |
| `diminishing-returns` | weighted Δ < 0.2 between cycles — a chosen constant, not a measured one. With surviving attacks open this reports as **plateau-with-open-attacks**, every attack listed — never as a clean plateau |
| `cap-reached` | the cycle cap (+ ≤1 bonus) elapsed below the ceiling |
| `budget-reached` | the envelope ceiling hit → deliver best-so-far with the residual gap, and every carried salvage item listed as carried |
| `single-agent-best-effort` | `mode: single-agent(declared)`; the ceiling is unreachable by construction and the report says which checks were never available |
| `BLOCK` | any dim = 0, two identical failures in a row, or a second amendment request — stop and escalate to the user |

The ceiling is often unreachable; a clean `diminishing-returns` is honourable, and the report names what plateaued, and why.

**Loop order and the exit.** P3R follows every exit from 3.9 except `BLOCK` and `budget-reached`; after those, every pre-P5
row not yet evidenced reads `precondition unmet(<the row that recorded the exit>)` (earlier-pass evidence stands; a degraded-list row keeps `no
spawn`), and P5 runs. A BLOCKed run resumes only as a new wish. A 3R.3 re-entry or 4.2's bonus reopens P3, and P3R
follows that cycle again; ENTER lines, 3R.3 and P4 read the latest pass.
3R.2-3R.3's cap is N; the +1 is 4.2's alone. The report's `exit:` is fixed when P5 opens, as the first that applies of
`BLOCK` > `budget-reached` > `single-agent-best-effort` > `reception-demoted` > `ACCEPT` > `cap-reached` >
`diminishing-returns`. `budget-reached` fires at whichever spawn would cross the ceiling less the one agent reserved for
5.7; that spawn is not launched, and row 3.9 records the exit (before P3, the spawn's own row does). A declined 0.7 closes the run with no exit and no ledger entry,
P5 included; a declined 1A.6 does the same but appends a ledger entry, because agents were spent.

**Degraded mode**, binding when row 0.8's preflight fails. These fourteen rows are `not-run: no spawn` — 1A.3, 1A.7,
2.2, 2.3, 2.4, 3.2, 3.4, 3.5, 3R.1, 3R.2, 3R.3, 4.1, 4.2, 5.7 — and no other row may carry that reason (ID10 checks
the biconditional). N1 is then unsatisfiable: the only available scorer is the producer; [EV-20] does not measure this fallback or tool-grounded testing. Rows outside the list run on the producer's scores, advisory and reported as such; `ACCEPT` is unreachable, and the only legal exits are
`single-agent-best-effort`, `budget-reached` or `BLOCK`. The header prints the mode.

## 4. Phases — entry, what to read, the failure prevented. Reference files below are basenames; all live in `reference/`.

In an `ENTER:` line, *evidenced* is §0 item 5's: each row carries evidence or a legal `not-run:`.

### P0 — Scarcity Gate · rows 0.1-0.8
**ENTER:** the request exists. **READ:** `nanika-ledger.md`; `engine-map.md` §2a, holding row 0.8's literal command.

The ledger's entries are counted, not parsed from prose; a challenged invocation is priced, not refused, because a
gate that refuses gets routed around. **This gate changes nothing about the artifact — that is the whole of its
claim.** Row 0.8 is the load-bearing half: every `ext` cell, every judge and the whole envelope rest on being able to
spawn, and one throwaway worker makes that a detected capability rather than a declared one.

### P1 — Crystallize · rows 1.1-1.12
**ENTER:** rows 0.1-0.8 evidenced. **READ:** `crystallization-dialogue.md`; `run-discipline.md` §1-§2 (row 1.12's lint; the Decision Ledger);
`evaluator-roster.md` §1-§3 (row 1.11's archetypes); for a `document` class, `doc-deliverables.md` §5 (the W12
dimension row 1.10 writes).

The five rows agents drop here (1.2-1.5, 1.7) get dropped because they feel answered by the rest of the conversation.
They are not. **Row 1.7 reframes the rubric** — "make this proposal excellent" is usually "I need this person to say
yes." Row 1.5 is useful only past its first answer (`crystallization-dialogue.md` §1, the note under D2-D5).

### P1A — Anchor, verify, then freeze · rows 1A.1-1A.8
**ENTER:** rows 1.1-1.12 evidenced. **READ:** `benchmark-anchoring.md`, which owns the sweep, the reject list, the
Provenance Gate behind 1A.5 and the four-part 1A.3 protocol; `engine-map.md` for 1A.7.

The control and property check test the selected comparison, not a global quality ceiling. A resolving locator
can still be irrelevant, a same-genre control can still be weak, and a trivial property can separate a cherry-picked
pair. `none-better-found` means none found in the reported search, not globally best.

### P2 — Tournament · rows 2.1-2.7
**ENTER:** rows 1A.1-1A.8 evidenced. **READ:** `evaluator-roster.md` §4, §6.

An angle is a different *bet about what makes this excellent*, not a different tone; two angles that could produce the
same artifact with different word choices are one angle. **Order is the trap:** candidates are generated, *then*
judges calibrate against the pair, *then* judging opens — blind judging is candidate selection, the one moment an
inflated score is unrecoverable. **The pair is used twice and the order must not swap:** at 2.3 unlabelled and graded
by the orchestrator; only then
labelled for rubric scoring only, with N6 preserving blinded comparisons and cold reads:

| what the orchestrator computes | action, written onto that scorer's scorecard |
|---|---|
| on every dimension's pair: exemplar = 3 ∧ control ≤ 2 | `calibrated` — proceed |
| on any pair: control = 3 (inflates: every later 3 is meaningless) · control ≥ exemplar (cannot tell them apart) · exemplar < 3 (severe, or the anchor is unreachable as written) | `re-prompted` once, naming the control as an explicit score-1-2 reference; a second failing pass writes `replaced` and the scorer is replaced. **The anchor is frozen and is not re-worded here** — N4 |

Prompt files and shuffle seeds document intended isolation; they do not authenticate it. Judging is
pointwise, so its bias mitigation is shuffling order *across* judges; the *pairwise* one is 4.1.

### P3 — Converge · rows 3.1-3.10
**ENTER:** rows 2.1-2.7 evidenced. **READ:** `evaluator-loop.md`; `refutation-panel.md` from the first all-dims>=2 cycle.

Every dimension is scored 0-3 with cited evidence, stamped with the rubric version it was made under (3.2) — a
trajectory crossing an amendment boundary untagged is silently incomparable. Row 3.9 stops the loop's state being
implicit: the longest phase is the likeliest to drift to a halt, and an unwritten verdict decides the exit in
retrospect. **The rubric controls optional quality iteration, subject to N7's domain gates**: the panel sits inside it as ratification, never as a
second verdict, and an attack no dimension can express routes to §6 (3.10), not to a new gate. Rows
3.1 and 3.7 are the reset that earns its cost [EV-12].

### P3R — Reception · rows 3R.1-3R.3 · **the one phase with a return edge**
**ENTER:** row 3.9's latest cycle carries an exit other than `BLOCK` or `budget-reached`. **READ:** `evaluator-roster.md` §5. **EXIT:** to **P3** when 3R.3 fires.

P3R produces **simulated cold-read evidence**, not actual recipient acceptance, preference or audience coverage.
A matching stop-span demonstrates only that the quoted text exists. The finding still needs interpretation and
3R.2 disposal; a score change follows 3R.3 without enlarging the cap.

### P4 — Exit gate · rows 4.1-4.2
**ENTER:** row 3.6 names the artifact, **3R.3 did not fire** and 3.9's latest exit is not `BLOCK` or `budget-reached`. **READ:** `evaluator-loop.md` L8, which owns the
`PAIRWISE_VERDICT` schema row 4.1 hands to each of the four workers.

A loss to the runner-up may reflect a regression, noise or an intentional trade-off; the comparison alone cannot decide which. **Both orders, consistent-only:**
swap-consistency has been measured as low as 23.8% [EV-16b], so a single-pass pairwise verdict is partly a verdict
about position. Order agreement does not guarantee a correct preference. Agreement → verdict; disagreement → `inconsistent`, which the header carries. `evaluator-loop.md` L8 says why
the exemplar pairing is judged per property.

### P5 — Deliver · rows 5.1-5.7
**ENTER:** rows 4.1-4.2 evidenced. **READ:** `identities.md`; `run-discipline.md` §5-§6 for rows 5.2-5.3.

Row 5.7 checks the recorded accounting, not the
truth of every record or artifact quality [EV-14]. An imbalance can also expose a specification defect.

## 5. The Fulfillment Report — process state, not a quality certificate

```
mode:        full | single-agent(declared)                rubric: R1 | R2
anchoring:   sourced | mixed(n/n) | invented-fallback | unverified | unanchored
re-quote:    n exact-match / n mismatch / n unreachable | not-run(<reason>)
property:    n present / n absent / n not-assessed | not-run(<reason>)   reject-lists: n / n | unchallenged(n)
separation:  n separating / n non-separating / n non-comparable | not-run(<reason>)   shared-property(n) | one-per-dimension
challenge:   none-better-found | out-anchored | re-anchored | not-run(<reason>)   engines: cross-engine(<list>) | monoculture(declared)
evaluators:  n calibrated / n re-prompted / n replaced / n no-pair | not-run(<reason>)
reception:   simulated-cold-read: clean | re-entered(n) | demoted | residual(n, cap spent | §6 declined | §6 used | void twice) | not-run(<reason>)
exit gate:   vs-exemplar n properties: n won / n lost / n inconsistent · vs-runner-up won | lost(<property>) | inconsistent | not-run(<reason>)
identity:    pass | imbalance(n) | not-run(<reason>)      delta: UNMEASURED
gated artifact: <path>       exit: <§3 reason>       spend: <n> / <envelope>
```

Then all twelve sections, each present or `N/A` with a one-line reason. **Contract** — every element classified per
5.2, prohibitions on their own axis. **Anchoring** — exemplars and control with locators, spans, named properties, the
dimension each anchors, each reject list, 1A.3's verdicts per locator and property, the challenge return, the fallback
flag if it fired. **Calibration** — per scorer, every blind-pair pass with each pair's scores and the orchestrator's verdict, and the
final verdict, as ID9 counted and recomputed them. **Tournament** — angles, engine distribution or declared monoculture with the 1A.7 result, blind
scores, winner, runner-up, salvage grafted / rejected / deferred / carried. **Trajectory** — per-cycle weighted scores
per dimension tagged R1/R2, each cycle's 3.9 verdict, and which artifact shipped and why it, not the last.
**Gauntlet** — attacks raised / killed / survived-then-fixed / open / `unproven-because-new`, each of the last with
what would falsify it. **Reception** — simulated cold-read, per persona, the verbatim stop-span, every finding's disposal, and 3R.3's
decision: which finding re-opened P3, or why none did. **Amendment** — trigger, (a)-(d), R1→R2, re-scored delta, plus
any phase-block imperative the card did not carry (§0 item 1). **Exit gate** — the
exemplar's verdict per named property and the runner-up's whole, both orders, `inconsistent` where it applies, the
property that briefed the bonus cycle, advisory verdicts. **Exit** — reason, residual gap, spend. **Unexplored-Space
Ledger** — as accrued at 3.8, each row tagged with its cycle: the honest one-shot claim is not "nothing was left on
the table" but "here is what was left, and why." **Identity audit** — link to the auditor's raw return with the files it opened; then the **Run Card** link from 5.6.
Then the terminal line. Its counts are process accounting only; `ACCEPT` means harness criteria satisfied, not best
possible output. The line below is `identities.md` §3 example A, field for field:

```
wish <slug> closed · card 57 rows: 55 ticked + 2 not-run · identities 10/10 balance
· anchors 6 = 6 exact-match · property 4 present + 2 not-assessed · separation 4 = 4 separating
· reject-lists 4 / 4 + 0 unchallenged · challenge none-better-found · one-per-dimension
· salvage 9 = 6 grafted + 2 rejected + 1 deferred + 0 carried · attacks 7 = 4 killed + 2 fixed + 0 open + 1 unproven-because-new
· scorers 7 = 7 calibrated + 0 re-prompted + 0 replaced + 0 no-pair · ext 3 = 3 recorded + 0 not-run
· simulated cold-read 3 = 3 valid-span + 0 void · 0 re-entered + 0 residual · exit-gate 4 properties = 4 won · exit ACCEPT
```

## 6. Rubric amendment — once, user-ratified

A frozen rubric that cannot express a real quality failure converges the loop to a ceiling on the wrong axis.
Amendment is legal when all four hold, row 3.10 evidencing each separately: (a) a surviving attack or reception
finding exists; (b) no dimension can express it, and re-scoring under one was tried first; (c) the user ratifies; (d)
retained artifacts are re-scored on the amended rubric so the trajectory stays comparable. Result: **R2**; a second
request is §3's business. Calibration failures never route here (N4).

## 7. What each mechanism buys, what was removed, and what defeats this

**Retained hypotheses — not established quality gains.** `evidence.md` owns every figure; the tags below point, never redefine.

| Mechanism | Intended role, unmeasured in nanika | Evidence |
|---|---|---|
| Contract → frozen rubric (1.9-1.12, 1A.8) | keep the user's criteria stable; domain oracles can exist without this mechanism | decomposition into explicit checkable items beats holistic judgment — **training-time** evidence only, on instruction-following benchmarks [EV-24] |
| Sourced anchor + control, **re-quoted, property-checked, separation-checked and challenged by a non-participant** (1A.1-1A.4) | make the selected benchmark inspectable; strength, relevance and transfer remain judgments | — (design argument; the re-read is mechanical, the property and separation verdicts are not — A5) |
| **Blind-pair calibration (2.3), counted and recomputed by ID9** | screen some gross grading failures; passing one pair does not establish candidate-grading reliability | reference-guided grading cut **math**-grading judge failure 70% → 15%, the largest single effect in the file — and it is borrowed across settings: no one has measured it for rubric grading of prose [EV-16a] |
| Angle tournament, blind, shuffled (2.1-2.7) | one first idea, iterated, graded by a judge that can see whose it is | author labels swing **preference** votes up to 50pp and **pointwise** ratings up to 12pp [EV-19] — P2's judging is pointwise, so 12pp is the figure that applies here and 50pp is the ceiling of a setting this skill does not use; best-of-n is supported only in its **majority-vote** form, which rows 2.7 and 3.6 deliberately do not use [EV-23] |
| Salvage wiring (2.6 → 3.3) | retain potentially useful losing ideas; salvage quantity is not useful transfer | — (structural; measured only by E3's deletion control) |
| Independent acceptance checking (N1, A5) | avoid producer self-certification without forbidding tool-grounded self-testing | the self-correction result, quoted once at A5 [EV-20]; the same-model converse is asserted, not measured — A5 |
| Refutation panel (3.4-3.5) | the attack surface nobody on the rubric is looking at | contradicted as *debate*; kept as a non-debate on row 3.4's conditions — see below |
| **Reception with verbatim spans (3R.1), and its return edge (3R.3)** | obtain simulated cold-read friction tied to the artifact; neither audience coverage nor real reception | — (grep-checkable, zero extra spawns; 3R.3 spends a cycle already inside §3's cap) |
| **Both-order exit gate (4.1), the exemplar pairing per property** | half the pairwise verdict; a single pass is partly a verdict about position | the swap-consistency floor, quoted once at P4 [EV-16b] |
| **Identity audit by a non-participant (5.7)** | recompute recorded accounting; fabricated but consistent records can still pass | the compliance gap, cited once at §0 item 3 [EV-14] |
| **Spawn preflight (0.8) and engine preflight (1A.7)** | exercise an available dispatch path; saved sentinel files alone do not authenticate a spawn | — (structural; the failure it prevents was observed in this skill's own run) |

**Cut, and what covers the failure now.** What would bring each back: `evidence.md` §3.

| Removed | Why | What covers the failure now |
|---|---|---|
| One-Shot Gate | asked an agent whether a redo it will not perform would be better — a counterfactual with no available evidence, and the "yes" condition was pre-narrowed | row 4.1, which compares against two artifacts that exist, in both orders |
| Dual-lineage carry | the most expensive escalation in the old skill, specified in one sentence with no merge criterion, no schema and no evaluator | rows 3.6 and 4.1, at the four P4 agents the §3 formula prices |
| Cross-engine as a *mechanism* | on a single-host run it resolved to a sentence in the report | angle diversity is the load-bearing half (row 2.1); engine diversity is an amplifier gated by the 1A.7 preflight |
| The near-ceiling pre-mortem, the failure-modes table (24 rows), the per-host model-name table, and the run-level `Done when` | the pre-mortem duplicated the panel's Omission and Durability angles at the same trigger; every failure-mode mitigation was a pointer to a section above it; model names age faster than anything else here; the `Done when` restated seven P5 card rows in different words | rows 3.4-3.5; the phase blocks, which state each failure's mechanism at its point of use; role names in `engine-map.md`; the card, which is the exit condition |

**Contradicted classes, kept deliberately.** Multi-agent debate does not reliably beat chain-of-thought at matched
compute; conformity rises per round [EV-21, EV-22]. The P3 panel is kept because it is not a debate — **row 3.4
carries the conditions**, so they are executable and countable. If it ever becomes a discussion, cut it. Row 2.7
refuses consensus voting at P2 for the same reason.

**How this gets defeated from the inside.** Each leaves the report perfect; each is paired with its residue, weak ones named.

| The defeat | The residue that catches it |
|---|---|
| **Cherry-picking a weak exemplar.** Real, re-quotable, and mediocre. | Partial. 1A.3 returns `property-present/absent` with the span clause; 1A.1 requires a reject list of ≥2 beaten candidates with locators, and **ID3(e) counts the lists and opens each reject locator**, so the header's `reject-lists: n / n` is computed, not typed; 1A.3's challenge returns a stronger document or `none-better-found` with where it looked; a find forces a re-anchor or `out-anchored` (1A.4). **What this does not buy:** the challenger is the same class of system, a lazy `none-better-found` is cheap, and a sweep can list two straw rejects — ID3(e) reads that they exist and open, never *why each lost*. A raised cost, not a detection. |
| **Naming a trivial property off a strong document.** Strictly worse than the row above: the challenger is diligent and *correct* — a narrow property has no stronger exemplar anywhere — and the run is still anchored on nothing. | The residue is real but asserted. A trivial property is one the control has too, so 1A.3 opens the control at the same property and returns `separating | non-separating | non-comparable`; `non-separating` is struck by 1A.4 and ID3(c) fires if it is not. **What this does not buy:** a property that is narrow *and* genuinely absent from the control still passes — 1A.2's dimension clause forces it to be the property that dimension measures, and that mapping is judged by the orchestrator with no auditor. And the verdict itself is A5's asserted half. |
| **Anchoring five dimensions on one property.** | Closed as a silent state, not as a possibility. 1A.2 binds one property to one dimension unless the header prints `shared-property(n)`, and ID3(c) counts descriptors against named properties. A run may still declare it and ship; it may not do it quietly. |
| **A maximally weak control** — absurd rather than ordinary, which inflates every exemplar-control gap and passes an inflating judge at 2.3's `control ≤ 2`. | Partial. `non-comparable` at 1A.3 is the control's first external verdict; 1A.4 strikes on it. It rests on one judgment from the same class of system, and 2.3's threshold is unchanged: an ordinary-but-mediocre control still passes an inflating judge. |
| **A false `not-run:` reason** — dropping 2.6, 3.4 or 3.8 under a plausible string and exiting clean. | The legend closes the vocabulary to six reasons and ID1 rejects any other string. Two are self-certifying (`no spawn` cross-checked by ID10 against `mode:`; `no external worker` by ID8 against `ext/`). The other four are checked for form, not truth: `not applicable(document)` on 5.3 passes ID1 although `run-discipline.md` Q16 sweeps documents too. Narrower than before, not closed. |
| **A mis-declared `mode:`** — printing `full` while spawn-dependent rows sit `not-run`. | ID10, both directions, against §3's fourteen-row list. It cannot detect a run that spawned nothing and ticked the rows anyway — the `ext` forgery row below. |
| **`evaluators: calibrated` typed by the orchestrator that both applied the guard and declared ACCEPT.** | ID9 counts scorers from `scorecards/` **and recomputes each verdict from each pair's scores against §P2's table**, so a truthful pair under a false verdict — the cheaper forgery — is caught. A wholly fabricated scorecard is not. |
| **A `spawns/` prompt file written without ever spawning.** N6 requires the file before the spawn; nothing observes the spawn. | **None.** Same class as the `ext` forgery and priced the same way: a written prompt with no worker behind it passes every check, and no identity counts `spawns/` at all. It is named here so that it is priced, not merely uncaught. |
| A `silent` contract element written up as `ratified`. The classifier is the agent that wrote the contract. | Weak, and known to be. ID2 sums a partition and so balances whenever everything is classified. The real check is A2 — and A2 has no auditor, so this is a rule, not a residue. |
| A re-quote checker that pastes back the span it was handed instead of re-opening the locator (1A.3). | The checker returns **what it read**; the report carries both strings side by side, and a paste-back is byte-identical with no surrounding context. Evadable for one invented sentence of context — this catches laziness, not forgery. |
| Selective re-quote: dropping the one locator that would not verify. | 1A.3 requires one line per locator and ID3(a) compares that count against `anchors.md`'s. A short `requote.md` is an imbalance, not a clean `0 mismatch`. |
| An `ext` cell filled by the orchestrator itself, at 1A.3, 4.1 or 5.7. | The card legend's two-part record, counted by ID8 against three cells. This converts impersonation from an omission into a deliberate forgery — a real raising of the cost, and **not** detection: an orchestrator that writes both halves of the file passes. The harness has no defence against that and should not claim one. |
| An attack reclassified `unproven-because-new` to preserve an ACCEPT. The escape hatch is deliberate — it protects bold work — and it is abusable. | ID5 carries it as its own bucket, and **the §5 terminal line has a field for it**, beside the other buckets it prints. |
| Salvage marked `deferred` on every item — technically a disposition, substantively a discard. | ID4 splits raised into grafted + rejected + deferred + carried; an all-`deferred` list shows as zero grafted against a non-zero raised, on one line. |
| Row 3.8's ledger written once at P5 instead of accrued per cycle. | Weak: 5.4 compares two counts the same agent wrote, and the per-cycle tag is the only friction. A prohibition with a cheap residue, named here rather than called unfakeable. |
| An evidence file that exists but evidences nothing. | None. ID1 checks that a path resolves, not that its contents match the row. This is the largest hole left, and E2 measures it rather than closing it. |

The harness still cannot tell a well-made artifact from a well-made *record* of one. What it does: a dropped step
leaves an empty cell, an unresolving path, or a `not-run:` reason outside the six, **provided 5.7 ran**. It cannot
check that the file behind a tick says what the row claims, tell a forged `ext` or `spawns/` record from a real one,
or prove an unbettered exemplar was the best there was.

## 8. Reference files

Twelve, one level deep, each with its own `Owns:` and `Read when:` header, not restated here. Ten are named by a
phase's `READ:` line — `run-discipline.md`, `engine-map.md` and `evaluator-loop.md` at two phases, `evaluator-roster.md`
at three, and `doc-deliverables.md` only for a `document` class, whose generators also receive it whole at row 2.2.
`evidence.md` and `evaluations.md` load on question only.
