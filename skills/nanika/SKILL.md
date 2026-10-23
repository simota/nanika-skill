---
name: nanika
description: "Optional high-cost quality harness for code, documents, designs or plans when a materially wrong first delivery is costly to undo AND extra search or scrutiny beyond the domain process is justified. Not for ordinary reversible work or merely important/best/critical phrasing. Domain skills own the work; nanika may wrap them. Explicit invocation still requires spend consent."
allowed-tools: Read Write Edit Bash WebSearch WebFetch Agent
compatibility: "Needs a writable filesystem and a way to spawn an independent worker with its own context; reference/engine-map.md maps that to each host."
metadata:
  requires-capability: spawn-independent-worker
---
# Wish — the one-shot delivery harness

**Use it** when a materially wrong first delivery is costly to undo and extra search beyond the domain process
has a specific use: a performance target the domain path could not reach, a document that must land with one
named reader, a design that is expensive to rebuild. **Do not use it** for reversible work, for work the domain
skill finishes on its own, or because a request says "important" or "best". Row 0.5 recommends the cheaper path
in those cases, and nothing is spent without your approval at row 0.7.

**What it does on a hard problem that the domain skill alone does not:**
- **Fixes the outcome before generating** (row 1.2). Where the result is measurable, the metric, its baseline
  noise and the threshold a change must clear are written before any candidate exists. A change counts only
  when it clears that threshold, and the report prints the measured value against the target.
- **Searches wide, and re-opens the search at a plateau** (rows 2.1, 3.11). Competing bets are judged
  blind. When scores stall or one dimension sticks, the tournament re-opens with new bets drawn from
  named sources (unexplored space, two near-misses combined, the stuck dimension's gap, open attacks, an
  inverted assumption) instead of exiting or re-tuning the same idea.
- **Prices the bold path to you** (row 3.12). An option outside the run's contract or data boundary (new data,
  new training, a new dependency) is listed with its price and put to you. None is taken without your approval.
- **Leaves the outcome question reachable** (rows 5.5, 0.3). The ledger records how to check that the
  deliverable worked in use, and you can answer it at any later invocation in that project.

**DELTA: UNMEASURED.** No with-skill / without-skill A/B has been run on this document. Four evaluations that
would measure it ship unrun in `reference/evaluations.md`, each headed `status: NEVER RUN`. Nothing here shows
that a run's deliverable beats the domain skill's alone.

**REQUIRES:** a writable filesystem and the ability to spawn an independent worker with its own context. The
spawn tool's name, model names and every per-host command live in `reference/engine-map.md` and nowhere else;
`allowed-tools` is a pre-approval hint that neither restricts nor guarantees a tool. Row 0.8 tests the
capability by using it, and §3's degraded block says what a failure costs. Nothing depends on another skill.

## 0. How to execute this document

1. **The specification is the Run Card (§1), Always/Never (§2) and §3's decisions.** Each instruction sits on
   the row that executes it, and a file or section a row names is part of that row. §4 says only when a
   phase opens and what to load. An imperative found anywhere else is a specification defect: record it in the
   report's Amendment section and do not execute it.
2. **Write the card to `.nanika/runs/<slug>/card.md` before Phase 0** and keep it current (A1).
3. **Evidence is a path plus content that supports the row** [EV-14]. Each filled `ev:` points to a file in the
   run directory, and a file alone is not enough. All persistence is subject to A2; withheld evidence limits
   the claim and never licenses a tick.
4. **The gate is hard.** A phase begins only when every row of the previous phase carries evidence or a legal
   `not-run:`. If a row is empty, the only legal next action is to fill it.
5. **Execution capacity is unmeasured** [EV-10]. If a run drops rows, shorten the card. Do not add explanation.

## 1. The Run Card

```
WISH RUN CARD — run: <slug> · scope: <S|M|L|XL> · class: <code|document|design|plan>
cycles: <N + ≤1 bonus> · generation: <outline|full-build>   (both read off §3 at row 0.4)
rubric: <R1|R2> · mode: <full | single-agent(declared)>
tick = supporting record claimed at a run-dir path (§0.3), not independently verified quality. blank = not done.
not-run:<reason> = skipped; the reason must be one of six: `no spawn` · `no external worker` ·
  `not applicable(<class|scope|no amendment|no plateau|first wish|single cycle>)` · `precondition unmet(<row>)` ·
  `user declined(<path>)` · `capability absent(<name>)`. Any other string is an ID1 imbalance at 5.7.
ext = filled only by a worker that was not in the context it checks; `ext/<row>.md` holds each such worker's
  prompt and raw return, appended, never overwritten. A saved record does not authenticate a worker.

P0 SCARCITY GATE  → gate.md
[ ] 0.1 run dir `.nanika/runs/<slug>/` exists and holds this card                                              ev:
[ ] 0.2 ledger read and counted (`nanika-ledger.md` LG1, LG3); "this is wish #N", last date/intent/exit stated  ev:
[ ] 0.3 every `outcome: pending` entry whose `ask_after` has passed is asked LG4's question, its `verify_by` read
        out; the answer is written, or `unknown` if declined. An invocation that only records an outcome runs
        0.2-0.3, spends nothing and closes                                                                     ev:
[ ] 0.4 deliverable class and scope class chosen and written; the cycle cap AND the generation level read off §3's
        scope line for that class and written into the card header                                            ev:
[ ] 0.5 state the concrete cost of a materially wrong first delivery and why the cheaper domain path is insufficient.
        Recommend nanika only when that loss is high AND additional search or scrutiny has a specific expected use;
        otherwise recommend the cheaper path. Unknown stakes or marginal value → clarify, not launch.
        Urgency words, novelty alone and an explicit invocation are not severity evidence                       ev:
[ ] 0.6 envelope computed from the §3 formula, not quoted from prose                                           ev:
[ ] 0.7 user approved the stated spend ceiling (including only explicitly granted headroom) and the data/retention
        boundary under A2; record consent in the approved form and any override of the cheaper-path recommendation.
        `/nanika` alone is not informed authorization                                                          ev:
[ ] 0.8 spawn preflight: `engine-map.md` §2a's row for this host run verbatim, after 0.7; the exit line it appends
        to gate.md sets `mode:`; non-zero → §3's degraded list binds                                           ev:

P1 CRYSTALLIZE  (orchestrator only — no spawns; ask per `crystallization-dialogue.md`)  → contract.md, rubric-draft.md
[ ] 1.1 goal: an outcome, 1-3 lines                                                                            ev:
[ ] 1.2 acceptance criteria — asked, each with a named oracle. Where the outcome is measurable, one criterion is
        `OUTCOME: {metric, command, baseline: <mean ± spread over k≥3 runs, measured now>, target,
        threshold: max(<gap the user calls a real change>, 2 × spread)}`. If none is measurable, write
        `OUTCOME: none(<why>)`, name the cheapest instrument that would measure it (a corpus, a benchmark, a
        field check) with its price, and ask the user now: taken → it becomes a criterion; declined → a
        `bold.md` row for 3.12                                                                                 ev:
[ ] 1.3 non-goals — asked, stated                                                                              ev:
[ ] 1.4 prohibited outcomes — asked, stated or explicitly `none`                                               ev:
[ ] 1.5 disappointment criteria — asked, pushed past the first answer; >=2 recorded                            ev:
[ ] 1.6 named recipients — role-specific enough to simulate                                                    ev:
[ ] 1.7 probe run verbatim — "if this lands, what changes for you?" — and answer retained per A2                ev:
[ ] 1.8 every row 1.1-1.7 has user evidence in A2's approved form or an ASSUME-n with default, reason and status ev:
[ ] 1.9 contract written to `contract.md`; `decisions.md` kept from here (`run-discipline.md` §2's schema)      ev:
[ ] 1.10 draft rubric: 3-5 dims, weights sum to 1.0, each with a score-3 AND a score-1 descriptor; each disappointment
         criterion attached to a dim as a score-0 trigger; for class `document`, `doc-deliverables.md` §5's W12
         dimension is one of them                                                                              ev:
[ ] 1.11 one evaluator archetype per dimension (`evaluator-roster.md` §2-§3)                                    ev:
[ ] 1.12 contract lint run (`run-discipline.md` §1, 8 conditions), each marked pass/fail                       ev:

P1A ANCHOR, VERIFY, THEN FREEZE  (schemas: `benchmark-anchoring.md`)  → anchors.md, requote.md, rubric-frozen.md
[ ] 1A.1 exemplar sweep → `anchors.md` in `benchmark-anchoring.md` §2's layout: >=1 exemplar and >=1 control,
         each with LOCATOR, VERBATIM SPAN, NAMED PROPERTY and, per property, a REJECT LIST of >=2 beaten
         candidates with locators; a one-candidate sweep writes `unchallenged`                                 ev:
[ ] 1A.2 every score-3 descriptor rewritten to cite an exemplar, its property AND the dimension it anchors; every
         score-1 to the control; one property per dimension unless the header declares `shared-property(n)`    ev:
[ ] 1A.3 ext — a worker that did not run the sweep gets `benchmark-anchoring.md` §3 and `anchors.md`, writes
         `requote.md` (re-quote and property per locator, separation per property, challenge per exemplar), and
         its raw return is appended to `ext/1A.3.md`. No checker → `anchoring: unverified`                     ev:
[ ] 1A.4 1A.3's verdicts disposed by B12's table; a stronger candidate → re-anchor at most once per exemplar, or
         `out-anchored`; the no-exemplar fallback stated as fired / not fired                                  ev:
[ ] 1A.5 Provenance Gate (B13): every contract element elicited/ratified/parked; `silent` = 0                  ev:
[ ] 1A.6 envelope recomputed from §3 with the settled dimensions; show the delta. Re-authorize only when the approved
         ceiling or scope/data/destination/retention boundary would be exceeded or changed; otherwise cite 0.7's approval ev:
[ ] 1A.7 engine preflight: `engine-map.md` §2b's command per extra engine, exit status in `engines.md`;
         unreachable engines struck before P2                                                                  ev:
[ ] 1A.8 rubric frozen after 1A.4, byte-for-byte and tagged R1: `{ echo '# R1'; cat rubric-draft.md; } > rubric-frozen.md` ev:

P2 TOURNAMENT  → angles.md, candidates/, spawns/, scorecards/, salvage.md
[ ] 2.1 3-5 angles → `angles.md` as `| A<n> | one-line bet | family |` (`evaluator-roster.md` §6), each disagreeing
        with the others                                                                                        ev:
[ ] 2.2 generators spawned in isolation (RS7-RS8) — none sees another's output or the loop history;
        `doc-deliverables.md` attached to each when the class is `document`                                    ev:
[ ] 2.3 BLIND PAIR, per judge, before it sees any candidate: per `anchored` dimension (others `no-pair`), that
        dimension's exemplar and control from `anchors.md` as two unlabelled items shuffled per judge, each scored
        with quoted evidence → `scorecards/<scorer>.md` (`evaluator-loop.md` L5). The orchestrator writes the
        verdict: every pair exemplar = 3 ∧ control ≤ 2 → `calibrated`; otherwise `re-prompted` once, the prompt's
        rubric text built by `{ printf '%s\n' "<which item is the control: an ordinary score-1-2 reference>"; cat
        rubric-frozen.md; } > spawns/<scorer>-pass2.md` before the pair and schema are appended, so the frozen
        text is never retyped (N4); a second failing pass → `replaced`. No `calibration:` field is accepted from a scorer                                    ev:
[ ] 2.4 judging blind: provenance stripped AND candidate order shuffled per judge, the shuffle recorded as a seed ev:
[ ] 2.5 every candidate persisted in full to `candidates/`, not just the winner                                ev:
[ ] 2.6 salvage → `salvage.md`, one row per idea from every judge's SALVAGE return:
        `| S<n> | from <blind id> | idea | locator (file:line in candidates/) | open |`; a losing entry with none
        gets one row ending `| none | nothing salvageable |`                                                    ev:
[ ] 2.7 winner and runner-up by mean weighted score — never by majority vote, which discards correct answers
        already in the pool [EV-22]                                                                            ev:

P3 CONVERGE  (repeat per cycle; one `cycles/<n>.md` per cycle)
[ ] 3.1 cycle open: `rubric-frozen.md` and `contract.md` re-read, and the frozen dimension names and weights quoted
        into the cycle file                                                                                    ev:
[ ] 3.2 evaluators scored independently (L4 `EVALUATION`), each after passing 2.3's blind pair on its own
        scorecard; no generator scored. With an OUTCOME, the orchestrator runs its command on the artifact and
        writes `outcome: <value>` into the cycle file; a revision is better only if it beats the best value so far
        by `threshold`                                                                                         ev:
[ ] 3.3 ONE brief → `cycles/<n>-brief.md` (L6). Its salvage block is built only by
        `grep '| open |' salvage.md >> cycles/<n>-brief.md`, so every row travels with its locator; then
        `echo "salvage open=$(grep -c '| open |' salvage.md) brief=$(grep -c '| open |' cycles/<n>-brief.md)" >> cycles/<n>.md`.
        Unequal → rebuild before spawning. After the revision each row's status in `salvage.md` becomes
        `grafted <where>` · `rejected <why>` · `deferred <why>`, or stays `open`                                ev:
[ ] 3.4 panel staged in at all-dims>=2 (`refutation-panel.md`): 2-4 skeptics, distinct angles; each briefed without
        the others' output, run for ONE round, and aggregated against the rubric rather than by vote           ev:
[ ] 3.5 at all-dims=3 the panel ratified or demoted; surviving attacks (ID5 `open`) carried forward as generator
        exclusions                                                                                             ev:
[ ] 3.6 every artifact retained, cycles and re-opens alike; the one entering P4 is the best (by OUTCOME value when
        1.2 fixed one, else by weighted score), not the last                                                   ev:
[ ] 3.7 goal-alignment check written into the cycle file: does this still serve the contract, semantically and not
        only by score                                                                                          ev:
[ ] 3.8 unexplored-space rows appended to `unexplored.md` as they occur, tagged with the cycle; a row outside the
        contract or A2 boundary is also tagged `outside` for 3.12                                              ev:
[ ] 3.9 loop verdict per cycle: `continue`; `plateau` when weighted Δ < 0.2, OR one dimension below 3 is unchanged
        for two cycles, OR the OUTCOME value has not cleared `threshold` for two cycles → run 3.11; or an exit
        from §3's table, provisional until §3's loop order fixes the run's exit                                ev:
[ ] 3.10 §6 amendment, if opened: (a)-(d) each evidenced separately, R2 tagged, retained artifacts re-scored. Else
         `not applicable(no amendment)`                                                                        ev:
[ ] 3.11 RE-OPEN at `plateau`, or once when 3.12 at the loop's exit has a taken `B<n>`, while fewer than 2
         re-opens have run and the envelope covers one. Append 3 new
         angles to `angles.md` as `| R<n> | one-line bet | source |`, each source one of `unexplored:<row>` ·
         `combine:<S#|candidate>+<S#|candidate>` · `gap:<dim>` (that dimension's latest `gap_to_3`) ·
         `attack:<open id>` · `invert:<the assumption every tried angle held fixed>` · `property:<4.1 property>` ·
         `bold:<B#>` (taken at 3.12). At least one is `invert:`; none restates a row already in `angles.md`.
         Spawn generators as at 2.2, each with its angle, its source's text and the open-attack exclusions (RS8),
         never the loop history (in degraded mode the producer writes them). The P3 evaluators score each; the
         best by 3.6's rule continues the loop; the others go to `candidates/` and their ideas to `salvage.md`.
         No plateau and no taken `B<n>` in the run → `not applicable(no plateau)`                              ev:
[ ] 3.12 BOLD PATHS, once, at the first `plateau` or at the loop's exit if none came: every option that could meet the
         goal but lies outside the contract or A2 boundary (new data, training, engine, dependency, scope) →
         `bold.md` as `| B<n> | path | outside what | needs | price (agents + the user's own units) | targets
         (criterion or OUTCOME) | what would show it failed |`, read from `unexplored.md`'s `outside` rows, 1.2's
         declined instrument and skeptics' Alternative attacks. Put to the user in one batch (A6): taken →
         re-authorized as at 1A.6 before any action, then a 3.11 source (at the loop's exit it opens 3.11 even
         without a plateau, and P3R waits for that re-open); declined or unanswered → `unexplored.md`
         `user declined(B<n>)`. `none` only with the sources read listed                                       ev:

P3R RECEPTION  → personas/
[ ] 3R.1 one persona per named recipient (max 5, `evaluator-roster.md` RS5-RS6), built without the contract, rubric
         or loop history; each returns THE VERBATIM SENTENCE IT STOPPED AT, grepped against the artifact — absent
         → void, re-run once; a second void is a named residual                                                ev:
[ ] 3R.2 every finding routed to a named dimension and re-scored by that dimension's evaluator, or routed to §6, or
         recorded as a residual with the reason no dimension fits — legal ONLY once the cap is spent or §6 was
         declined or already used                                                                              ev:
[ ] 3R.3 RE-ENTRY, written either way: a 3R.2 finding that moved a score re-opens P3 while cycles remain under §3's
         cap (counter advances, new `cycles/<n>.md`, P4 waits, causing finding named). No score moved → clean;
         cap spent → exit `reception-demoted` only on a rubric-perfect artifact, else 3.9's exit stands          ev:

P4 EXIT GATE  → gate4.md
[ ] 4.1 ext — blind comparison vs the P1A exemplars (one verdict PER NAMED 1A.1 PROPERTY) and vs the retained
        runner-up (one verdict whole), each in BOTH ORDERS by workers who never touched the artifact, each
        returning L8's `PAIRWISE_VERDICT` into `ext/4.1.md`; per entry, the same answer in both orders → `won`,
        `lost` or `tied`, else `inconsistent`; no worker → `not-run`, printed                                  ev:
[ ] 4.2 verdict acted on — a loss to the runner-up re-runs the P3 evaluators over the two and recomputes 3.6. A
        property lost to the exemplar spends the bonus cycle, briefed with that property, the exemplar's span
        and the loss's `evidence_span` (L6); if no direct revision follows from them, the bonus is a 3.11
        re-open whose every angle is `property:<it>` (outside 3.11's count of 2 and its `invert:` minimum).
        "No brief can be written" is not a disposal. At most one bonus cycle; any second verdict is advisory,
        reported not acted                                                                                     ev:

P5 DELIVER  → report.md
[ ] 5.1 Fulfillment Report from a fresh read of `rubric-frozen.md`, opening with §5's header; every §5 section
        present or `N/A + one-line reason`. First, under any exit but `budget-reached`, every `salvage.md` row
        still `open` becomes `deferred <no revision followed>` (ID4)                                           ev:
[ ] 5.2 each acceptance criterion verified/partial/missed/dropped and each prohibited outcome held/violated/
        unverified, on separate axes (`run-discipline.md` §5). With an OUTCOME, its command re-run on the gated
        artifact and printed against the target; any improvement the report claims cites that value or is
        labelled `rubric judgment`                                                                             ev:
[ ] 5.3 completion sweep (`run-discipline.md` Q18): the command, the hit count, the accounting for each hit    ev:
[ ] 5.4 unexplored-space ledger delivered as accrued; row count equals `unexplored.md`'s                       ev:
[ ] 5.5 ledger entry appended (`nanika-ledger.md` LG2) with `outcome: pending`, `verify_by:` (what would show the
        deliverable worked in use: the OUTCOME command, or for a design or plan, "built, and <criterion> held")
        and `ask_after:` the date or event the user picks; copied to `ledger-entry.md`; the delivery message
        ends with LG4's question                                                                               ev:
[ ] 5.6 deliver a link to the full card, every row ticked or `not-run:`; the linked `card.md` is the card of record ev:
[ ] 5.7 ext — IDENTITY AUDIT: a worker that did not run this wish gets `identities.md` and the run directory's path,
        nothing else; it recomputes ID1-ID10, names every file it opened and returns the terminal line, all
        kept in `ext/5.7.md` and pasted into the report. An imbalance is a phase that did not run: run it or
        record it `not-run` — never adjust a count                                                            ev:
```

## 2. Always / Never

**ALWAYS**

- **A1** Update the full `card.md` at each gate. Show the user a compact phase/delta/blocker/spend summary and its
  link; reprint the full card only on request or when needed to resolve a discrepancy.
- **A2** Before copying user data, record the approved boundary in `gate.md`: current execution only, approved worker
  destinations, or public; plus what may persist and for how long. Unapproved web queries, other workers/engines,
  persistence and commits are not authorized by invocation. Keep run records private and untracked by default.
  For elicitation, retain only permitted minimal quotes, or a user-approved redaction/summary labelled as such.
  Never call a summary verbatim or a hash proof of meaning/consent. This governs all prompts, candidates and ledgers;
  evidence withheld for privacy remains unverified, not silently complete.
- **A3** Write a phase's output to a file before opening the next phase. Prose about a step is not the step.
- **A4** State a figure once, in the file that owns it: `reference/evidence.md` owns every literature figure and its
  scope; card and rule address counts are `identities.md` §0's.
- **A5** Use a worker outside the producer's context for the three `ext` cells. A fresh context is not proof of
  independent judgment: intrinsic correction without external feedback has failed on reasoning tasks [EV-20],
  which does not establish a same-model fresh-context benefit, and self-recognition remains a risk [EV-17].
  Use native execution receipts when the platform supplies them; otherwise claim only that a spawn record exists.
- **A6** Ask one question, or one batch of at most four topics, per turn. `crystallization-dialogue.md` owns how.

**NEVER**

- **N1** The producer may run tests, inspect renders and debug using external feedback, but may not supply its own
  independent score, judge verdict, refutation or audit. Tool-grounded self-testing is not intrinsic self-correction,
  nor does it replace independent acceptance checking. §3 owns the declared single-agent fallback.
- **N2** Never open a phase whose `ENTER` line is unmet: earlier errors left in context raise later error rates,
  and model scale does not fix it [EV-12].
- **N3** Never tick a card row without a path (§0.3). An empty cell is a truthful card.
- **N4** Never reword a frozen rubric descriptor, in a brief, a re-prompt or a score, so the artifact can reach 3.
  §6 is the only legal path, it produces R2, and it may never be opened by whoever produced the output that
  failed. Re-anchoring at 1A.4 happens before the freeze and may only raise the bar.
- **N5** Never call same-model judgments model-independent, record completeness quality, a rubric score a measured
  outcome, an anchor ID3(c) does not compute as `sourced` sourced, an inconsistent pairing a verdict, a single-agent
  run full, a persona return an observed recipient reaction, or an unrun step N/A.
- **N6** Before each spawn, save its permitted prompt to `spawns/`; include its task, exact output schema and
  output-length envelope. Add only role-appropriate, A2-approved context: the versioned rubric for rubric scoring,
  no rubric/history for cold-read personas or generators, nothing that does not yet exist for preflight work.
  Blind calibration and blind comparisons get no answer/provenance labels. After calibration, rubric scorers may
  receive labelled anchor breakdowns as a borrowed grading aid [EV-16a], not as evidence that they are reliable.
- **N7** Flatten only a wrapped process's optional improvement loop. Preserve its safety, correctness, acceptance
  and permission gates; a failed domain gate disqualifies the candidate regardless of rubric score. Use one agreed
  revision budget within both processes' hard caps. Conflicting oracles require upstream repair or escalation,
  never removal of a non-negotiable gate merely to avoid two loops.
- **N8** Row 0.7 authorizes only the stated spend and data/retention boundary, not publication, destructive actions
  or code commits. Ordinary domain duties remain; autonomous mode does not skip required consent under 0.7, 1A.6 or §6.

## 3. Pre-resolved decisions

**Scope**, judged by how much one generator can produce well in one pass, read off at row 0.4 with both its values:
**S** one artifact, one sitting, one reader-path — N=3, outline · **M** one artifact with internal structure — N=3,
outline · **L** several coupled artifacts, or one whose parts must cohere — N=5, full-build · **XL** a set whose
composition is itself the design problem — N=5, full-build. Row 0.6 lowers N=5 to 3, and rewrites the header, when
its envelope cannot cover N=5. *Outline* = generators compete at outline level and a spawned generator builds the
winner before cycle 1, so 4.1's runner-up is the second-best retained artifact (3.6), or `not applicable(single
cycle)`; *full-build* = each ships a complete artifact. Plus at most one bonus cycle from P4 — total N+1.

**Envelope.** Computed at 0.6. Include wrapped-domain work and retries, not just nanika seats. Counts are not
monetary cost or quality evidence; name the cost units actually bounded and any unpriced exposure. No overrun is
authorized by a low point estimate.

```
agents = 1 (row 0.8) + 0 (P1 spawns nothing)
       + X × (1 + re-anchors) (row 1A.1; 0 when the orchestrator sweeps) + 1 + re-anchors (row 1A.3) + E (row 1A.7)
       + C (row 2.1) + J (judges, >= 3 per `evaluator-roster.md` RS3) + 1 (outline build; outline only)
       + (N+1) × (1 generator revision + D evaluators + K skeptics; rows 3.2-3.4)
       + R × (3 generators + 3 × D evaluator passes) (rows 3.11 and 4.2; R ≤ 3: two re-opens plus a bonus re-open)
       + (P + re-scored dims) × reception passes (≤ N+1; rows 3R.1-3R.2) + 4 × P4 passes (≤ 2; row 4.1) + D (row 4.2)
       + 1 (row 5.7) + J + D blind-pair passes (2.3, 3.2), one per re-prompt or replacement, one per void re-run,
       and wrapped-domain workers and retries
```

| Exit | Meaning |
|------|---------|
| `ACCEPT` | **Harness criteria satisfied, not maximal quality or measured benefit.** All dims = 3 on evaluators ID9 counts as calibrated, panel-ratified with 0 surviving attacks (ID5's `open`; `unproven-because-new` is reported, never blocking), every reception finding disposed **and 3R.3's re-entry taken wherever one moved a score**, every non-advisory 4.1 loss disposed by 4.2, an OUTCOME (if 1.2 fixed one) at or past its target, `mode: full`, and `anchoring: sourced` (ID3(c): every score-3 descriptor `exact-match` ∧ `property-present` ∧ `separating`, no flagged descriptor, no `out-anchored` exemplar) |
| `reception-demoted` | a simulated cold-read finding changed a score on a rubric-perfect artifact with the cap spent (3R.3), on any pass; not observed recipient rejection. Ships best-so-far with the persona's verbatim stop-span |
| `diminishing-returns` | weighted Δ < 0.2 between cycles (a chosen constant, not a measured one) **after** row 3.11's two re-opens are spent or the envelope cannot cover one; before that, the same Δ is `plateau`, not an exit. With surviving attacks open it reports as **plateau-with-open-attacks**, every attack listed |
| `cap-reached` | the cycle cap (+ ≤1 bonus) elapsed below the ceiling |
| `budget-reached` | the envelope ceiling hit → deliver best-so-far with the residual gap, and every carried salvage item listed as carried |
| `single-agent-best-effort` | `mode: single-agent(declared)`; the ceiling is unreachable by construction and the report says which checks were never available |
| `BLOCK` | any dim = 0, two identical failures in a row, or a second amendment request — stop and escalate to the user |

**Loop order and the exit.** P3R follows every exit from 3.9 except `BLOCK` and `budget-reached`; after those, every
pre-P5 row not yet evidenced reads `precondition unmet(<the row that recorded the exit>)` (earlier-pass evidence
stands; a degraded-list row keeps `no spawn`), and P5 runs. A BLOCKed run resumes only as a new wish. A 3R.3
re-entry, 4.2's bonus or a bold path taken at the exit's 3.12 reopens P3, and P3R follows that cycle again; ENTER lines, 3R.3 and P4 read the latest
pass. 3R.2-3R.3's cap is N; the +1 is 4.2's alone; 3.11's re-opens do not advance the cycle counter. The report's
`exit:` is fixed when P5 opens, as the first that applies of `BLOCK` > `budget-reached` > `single-agent-best-effort`
> `reception-demoted` > `ACCEPT` > `cap-reached` > `diminishing-returns`. `budget-reached` fires at whichever spawn
would cross the ceiling less the one agent reserved for 5.7; that spawn is not launched, and row 3.9 records the
exit (before P3, the spawn's own row does). A declined 0.7 closes the run with no exit and no ledger entry, P5
included; a declined 1A.6 does the same but appends a ledger entry, because agents were spent.

**Degraded mode**, binding when row 0.8's preflight fails. These fourteen rows are `not-run: no spawn` — 1A.3, 1A.7,
2.2, 2.3, 2.4, 3.2, 3.4, 3.5, 3R.1, 3R.2, 3R.3, 4.1, 4.2, 5.7 — and no other row may carry that reason (ID10 checks
the biconditional). N1 is then unsatisfiable: the only available scorer is the producer [EV-20]. Rows outside the
list run on the producer's scores, advisory and reported as such; `ACCEPT` is unreachable, and the only legal exits
are `single-agent-best-effort`, `budget-reached` or `BLOCK`. The header prints the mode.

## 4. Phases — when each opens and what to load

Reference files below are basenames in `reference/`. *Evidenced* is §0 item 4's.

- **P0** · ENTER: the request exists · READ: `nanika-ledger.md`; `engine-map.md` §2a.
- **P1** · ENTER: 0.1-0.8 evidenced · READ: `crystallization-dialogue.md`; `run-discipline.md` §1-§2;
  `evaluator-roster.md` §1-§3; for class `document`, `doc-deliverables.md` §5.
- **P1A** · ENTER: 1.1-1.12 evidenced · READ: `benchmark-anchoring.md`; `engine-map.md` §2b. The control and
  property checks test the selected comparison, not a global ceiling; `none-better-found` means none found in the
  reported search.
- **P2** · ENTER: 1A.1-1A.8 evidenced · READ: `evaluator-roster.md` §4, §6; `evaluator-loop.md` L4-L5. Order is
  fixed: candidates generated, *then* judges calibrate on the pair, *then* judging opens.
- **P3** · ENTER: 2.1-2.7 evidenced · READ: `evaluator-loop.md`; `refutation-panel.md` from the first
  all-dims>=2 cycle. The rubric controls optional iteration, subject to N7's domain gates.
- **P3R** · ENTER: 3.9's latest cycle carries an exit other than `BLOCK` or `budget-reached` · READ:
  `evaluator-roster.md` §5 · EXIT: to P3 when 3R.3 fires. Personas are simulated cold reads, not recipients.
- **P4** · ENTER: 3.6 names the artifact, 3R.3 did not re-open P3 (a demotion does not skip P4), and 3.9's latest
  exit is not `BLOCK` or `budget-reached` · READ: `evaluator-loop.md` L8. Swap-consistency has been measured as
  low as 23.8% [EV-16b], so a single-order pairwise verdict is partly a verdict about position.
- **P5** · ENTER: 4.1-4.2 evidenced · READ: `run-discipline.md` §5-§6. `identities.md` is the 5.7 auditor's
  brief; the orchestrator does not compute the identities in `mode: full`.

## 5. The Fulfillment Report — process state, not a quality certificate

```
mode:        full | single-agent(declared)                rubric: R1 | R2
outcome:     <metric> <value> vs target <t> (baseline <b> ± <s>, threshold <h>) | none(<why>)
search:      angles n (tournament n + re-open n) · re-opens n/2 · bold paths n offered / n taken | none(<sources read>)
anchoring:   sourced | mixed(n/n) | invented-fallback | unverified | unanchored
re-quote:    n exact-match / n mismatch / n unreachable | not-run(<reason>)
property:    n present / n absent / n not-assessed | not-run(<reason>)   reject-lists: n / n | unchallenged(n)
separation:  n separating / n non-separating / n non-comparable | not-run(<reason>)   shared-property(n) | one-per-dimension
challenge:   none-better-found | out-anchored | re-anchored | not-run(<reason>)   engines: cross-engine(<list>) | monoculture(declared)
evaluators:  n calibrated / n re-prompted / n replaced / n no-pair | not-run(<reason>)
reception:   simulated-cold-read: passes(n) · re-entered(n) · demoted(0|1) · residual(n, cap spent | §6 declined | §6 used | void twice) | not-run(<reason>)
exit gate:   vs-exemplar n properties: n won / n lost / n tied / n inconsistent · vs-runner-up won | lost(<property>) | tied | inconsistent | not-run(<reason>)
identity:    pass | imbalance(n) | not-run(<reason>)      delta: UNMEASURED
gated artifact: <path>       exit: <§3 reason>       spend: <n> / <envelope>
```

Then twelve sections, each present or `N/A` with a one-line reason. **Contract** — every element classified per
5.2, prohibitions on their own axis, `class: interpretation` decisions first. **Outcome** — the OUTCOME's
baseline, per-cycle values and delivered value, or why none exists and what instrument was declined.
**Anchoring** — exemplars and control with locators, spans, properties, dimensions, reject lists, 1A.3's verdicts,
the challenge return, the fallback flag. **Calibration** — per scorer, every blind-pair pass with its scores and the
orchestrator's verdict. **Tournament and search** — every `angles.md` row with its source, engine spread or declared
monoculture, blind scores, winner, runner-up, salvage grafted / rejected / deferred / carried, and every `bold.md`
row with its price and the user's answer. **Trajectory** — per-cycle weighted scores per dimension tagged R1/R2,
each 3.9 verdict, and which artifact shipped and why. **Gauntlet** — attacks raised / killed / fixed / open /
`unproven-because-new`, each of the last with its falsifier. **Reception** — per persona, the verbatim stop-span,
each finding's disposal, and 3R.3's decision. **Amendment** — trigger, (a)-(d), R1→R2, re-scored delta, and any
imperative the card did not carry (§0 item 1). **Exit gate** — per-property and runner-up verdicts, both orders,
the property that briefed the bonus cycle. **Exit** — reason, residual gap, spend; on `ACCEPT`, the line "the
rubric is satisfied; whether the deliverable worked in use is `verify_by`, unasked until LG4". **Unexplored-Space
Ledger** — as accrued at 3.8, each row tagged with its cycle. Then the identity audit's return and the Run Card
link, then the terminal line exactly as 5.7 returned it (`identities.md` §2, step 5).

## 6. Rubric amendment — once, user-ratified

Amendment is legal when all four hold, row 3.10 evidencing each separately: (a) a surviving attack or reception
finding exists; (b) no dimension can express it, and re-scoring under one was tried first; (c) the user ratifies;
(d) retained artifacts are re-scored on the amended rubric so the trajectory stays comparable. Result: **R2**,
appended to `rubric-frozen.md` under `## R2`; a second request is §3's `BLOCK`. Calibration failures never route here (N4).

## 7. Reference files

Twelve, one level deep, each with its own `Owns:` and `Read when:` header. Nine are named by §4's `READ:` lines;
`identities.md` is handed to the 5.7 auditor; `evidence.md` (figures, what each mechanism is meant to buy, and what
defeats it) and `evaluations.md` load on question only, never during a run. `doc-deliverables.md` is attached whole
to every generator and revision spawn when the class is `document`.

as-of 2026-10-17 · owner: this repository's maintainer · review trigger: any E1-E4 result, or a run that hits a
situation no card row covers.
