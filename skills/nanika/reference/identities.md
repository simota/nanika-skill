# identities.md

**Owns:** the card address inventory, the ten run identities, the protocol row 5.7 hands to the auditor, and the
terminal line the auditor returns.
**Read when:** at P5, by the 5.7 auditor, which reads this file and the run directory and nothing else. The
orchestrator reads it only in `mode: single-agent(declared)`, where it computes the identities as advisory.

Contents: §0 address inventory · §1 the ten identities · §2 the audit protocol and the terminal line · §3 worked
examples · §4 what an imbalance means, and what it never licenses.

## §0 — Card address inventory

**C1.** Count addresses, not execution capacity: P0 8 · P1 12 · P1A 8 · P2 7 · P3 12 · P3R 3 · P4 2 · P5 7,
for 59 card rows, plus A1–A6 and N1–N8. A row may contain several independently failing requirements.

---

## §1 — The ten identities

Design rule: **an identity may not have fewer buckets than the row it audits has legal outcomes.** An identity
that fires on a correct run teaches the auditor to explain imbalances away. Every bucket set below is a partition
of the states the card legalises — `not-run` and `carried` included.

**ID1 — the card.** `59 = ticked + not-run`, **and** every ticked row's `ev:` value resolves to an existing file
inside the run directory, **and** every `not-run:` reason is one of the six strings the card legend closes on
(`no spawn` · `no external worker` · `not applicable(<class|scope|no amendment|no plateau|first wish|single cycle>)` ·
`precondition unmet(<row>)` · `user declined(<path>)` · `capability absent(<name>)`). A seventh string is an
imbalance even when the arithmetic sums. Source: all 59 rows, 5.6.

**ID2 — the contract.** `elements = elicited + ratified + parked`, with `silent = 0`. Weak by construction: it
detects an unclassified element, not a mis-classified one. Source: 1.8, 1A.5.

**ID3 — the anchor.** Five parts, over `anchors.md` and `requote.md`. **Every part carries the same `not-run`
disposition:** row 1A.3 `not-run` → `requote.md` is absent, all totals in (a), (b) and (d) are 0, the clause is
*not evaluated in that state*, and the header reads `re-quote: not-run(<reason>)` with `anchoring: unverified`.
- **(a) lines.** `requote.md`'s `## Locators` block lines `= exact-match + mismatch + unreachable`, **and** that
  total equals the locator count in `anchors.md`.
- **(b) property and separation.** Property verdicts `= property-present + property-absent + not-assessed`, one
  per `requote.md` line. A control locator is `not-assessed` unless 1A.1 named a property for it; an exemplar is
  `not-assessed` only when its locator came back `unreachable`. **And, per named property:** `named properties =
  separating + non-separating + non-comparable`; a named property with no separation verdict is an imbalance.
- **(c) descriptors.** score-3 descriptors `= anchored + unreachable-and-flagged + invented-and-flagged`, where
  `anchored` means `exact-match` **and** `property-present` **and** `separating`. A struck verdict still counted
  `anchored` is an imbalance (1A.4 did not run). The header's anchoring state is computed here and is exhaustive
  and exclusive: `unverified` when 1A.3 is `not-run`; `invented-fallback` when 1A.4 records the fallback fired;
  otherwise `sourced` when anchored = descriptors with no `out-anchored` exemplar, `unanchored` when anchored = 0,
  and `mixed(a/d)` in every other case. **One property per dimension:** if a property appears on more than one
  descriptor, the header must read `shared-property(n)`; silence is an imbalance.
- **(d) challenge.** Exactly one challenge return per exemplar, `none-better-found` or a stronger-candidate
  locator; every stronger-candidate is followed in the header by `re-anchored` or `out-anchored`.
- **(e) reject lists.** `named properties = lists-with-≥2-beaten-candidates + unchallenged`, counted from
  `anchors.md`, **and** every reject locator resolves. The header's `reject-lists:` field is read off this.

Source for all five: 1A.1-1A.4.

**ID4 — salvage.** Over `salvage.md`, excluding `nothing salvageable` rows: `raised = grafted + rejected +
deferred + carried`, where `carried` is a row still `open`. `carried` is legal only while the loop is open or
when the exit is `budget-reached`. Every `cycles/<n>.md` that a later cycle follows carries row 3.3's
`salvage open=… brief=…` line with the two numbers equal, and so does the last cycle's whenever it wrote
`cycles/<n>-brief.md`. A last cycle that ended without a brief owes none: L6 compiles one only on REVISE, and
`BLOCK` or `budget-reached` can stop a cycle before row 3.3. Source: 2.6, 3.3, 5.1.

**ID5 — the gauntlet.** `attacks raised = killed + fixed + open + unproven-because-new`, and the
`unproven-because-new` count appears on the terminal line. Source: 3.4, 3.5.

**ID6 — reception.** `personas run = valid-span + void`, summed over every reception pass and counting a re-run as
its own persona run; each void is followed by exactly one re-run or, when that is void too or `budget-reached`
stopped it before launch, a named residual;
`personas run = 0` is legal exactly when 3R.1 carries `not-run`. Source: 3R.1-3R.3.

**ID7 — the contract's two axes.** `acceptance criteria = verified + partial + missed + dropped`;
`prohibitions = held + violated + unverified`, counted separately. `report.md`'s `outcome:` header field follows
the form of `contract.md`'s `OUTCOME:` line, which row 1.2 always writes: a measurable `OUTCOME: {…}` → a value
measured at 5.2, never `none`; `OUTCOME: none(<why>)` → `none(<why>)`. Source: 1.2, 1.4, 5.2.

**ID8 — the external cells.** `ext cells = 3 = record-present + not-run`, where `record-present` is
`ls ext/ | grep -cxE '(1A\.3|4\.1|5\.7)\.md'` — the three cell files by name, so support files in `ext/` do not
count. 4.1's four returns go in `ext/4.1.md`; a re-anchor's second 1A.3 return is appended to `ext/1A.3.md`.
Catches an absent record, not a fabricated one. Source: 1A.3, 4.1, 5.7.

**ID9 — the scorers.** A scorer is every P2 judge and every P3 evaluator, identified by the `scorer_id` its
scorecard and every scoring return carry (`evaluator-loop.md` L4-L5; a judge's returns are `EVALUATION`s with
`cycle: 0`). **Count:** `scorers = calibrated + re-prompted + replaced + no-pair`, one scorecard per scorer under
`scorecards/`, bucketed by `final_verdict`. `no-pair` is a scorer none of whose dimensions has an `anchored`
descriptor; its scores are advisory. A scorer that produced any score is an imbalance unless its final verdict is
`calibrated` or `no-pair`. `scorers = 0` is legal exactly when 2.3 and 3.2 carry `not-run`; the producer's
advisory scores then carry `scorer_id: producer(advisory)` and are no scorer. **Recompute:** row 2.3's rule is
deterministic over each pass's pairs: every pair `exemplar = 3 ∧ control ≤ 2 → calibrated`, otherwise
`re-prompted` on the first pass and `replaced` on the second. A written verdict that disagrees is an imbalance.
**Re-prompt fidelity:** every pass-2 prompt file named on a scorecard contains, whole, the rubric its pass's
`rubric_version` names (L5): for R1 the text before `## R2` (`sed '/^## R2$/,$d' rubric-frozen.md`, since a §6
amendment appends R2 after earlier prompts were built), for R2 all of `rubric-frozen.md`. That text piped through
`grep -v '^$' | grep -cvxFf <prompt>` prints `0` (no frozen line missing from the prompt).
Source: 2.3, 3.2.

**ID10 — the mode.** `mode: single-agent(declared)` ⟺ **exactly** the fourteen rows in `SKILL.md` §3's degraded
list carry `not-run: no spawn`; `mode: full` ⟺ **no** row carries it; and `mode:` equals the result row 0.8's
evidence records. Source: 0.8, §3's degraded list.

---

## §2 — The audit protocol and the terminal line

**AUD.** The 5.7 worker is spawned with this file and the path to the run directory, and nothing else.

1. It **reads the run directory, never the transcript**, and lists every file it opened.
2. It recomputes ID1-ID10 and returns, per identity, `pass` or `IMBALANCE(<n>): <what does not sum, and which
   files disagree>`.
3. **It never adjusts a count and never proposes a fix.** Naming the imbalance is the whole of the job.
4. **Its own row counts as done**: it counts 5.7 as ticked and `ext/5.7.md` as present. After it returns, only
   four writes are legal: tick 5.7, save `ext/5.7.md`, paste its return into the report's `identity:` field and
   terminal line, and finish 5.6's link. Any other change makes it a different run (§4).
5. It returns the terminal line, built from the files, `card <n>` read from the card. A field whose source row
   carries `not-run` prints `<field> not-run(<reason>)`; in `single-agent(declared)` mode the line reads
   `identities advisory <n>/10`; when P4 ran twice, `exit-gate` prints the acted pass, then `· advisory <counts>`:

```
wish <slug> closed · card 59 rows: 56 ticked + 3 not-run · identities 10/10 balance
· outcome <metric> <value> vs <target> | none · angles 4 + 0 re-open · bold 1 offered / 0 taken
· anchors 6 = 6 exact-match · property 4 present + 2 not-assessed · separation 4 = 4 separating
· reject-lists 4 / 4 + 0 unchallenged · challenge none-better-found · one-per-dimension
· salvage 9 = 6 grafted + 2 rejected + 1 deferred + 0 carried · attacks 7 = 4 killed + 2 fixed + 0 open + 1 unproven-because-new
· scorers 7 = 7 calibrated + 0 re-prompted + 0 replaced + 0 no-pair · ext 3 = 3 recorded + 0 not-run
· simulated cold-read 3 = 3 valid-span + 0 void · 0 re-entered + 0 residual
· exit-gate 4 properties = 4 won + 0 lost + 0 tied + 0 inconsistent · exit ACCEPT
```

---

## §3 — Worked examples

**A — `mode: full`, exit `ACCEPT`.** Four dimensions; six locators (four exemplars, two controls); nine salvage
items, one deferred; one attack `unproven-because-new`; no extra engines; no amendment; no plateau; seven scorers,
one judge re-prompted once and then calibrated. The terminal line in §2 is this example.

```
ID1  59 = 56 ticked + 3 not-run   (1A.7 capability absent(extra engine) · 3.10 not applicable(no amendment) ·
     3.11 not applicable(no plateau)); 3.12 ticked at the loop's exit; 56 paths resolve       — pass
ID2  12 = 7 elicited + 4 ratified + 1 parked · silent 0                               — pass
ID3  (a) requote.md 6 = 6 exact-match + 0 + 0 = anchors.md 6                          — pass
     (b) 6 = 4 present + 0 absent + 2 not-assessed (the controls); 4 properties = 4 separating — pass
     (c) 4 = 4 anchored + 0 + 0 → `sourced`; 4 properties over 4 dims → `one-per-dimension` — pass
     (d) 4 challenge returns = 4 none-better-found                                    — pass
     (e) 4 = 4 lists + 0 unchallenged; 8 reject locators resolve                       — pass
ID4  9 = 6 grafted + 2 rejected + 1 deferred + 0 carried; each cycle's open = brief    — pass
ID5  7 = 4 killed + 2 fixed + 0 open + 1 unproven-because-new                          — pass
ID6  3 personas = 3 valid-span + 0 void                                                — pass
ID7  5 criteria = 3 verified + 1 partial + 0 missed + 1 dropped; 2 prohibitions = 2 held;
     contract OUTCOME present, report `outcome:` carries a measured value               — pass
ID8  3 = 3 record-present (`ext/1A.3.md`, `ext/4.1.md`, `ext/5.7.md`) + 0 not-run      — pass
ID9  7 scorers = 7 calibrated (final); judge-3 pass 1 had a (3,3) pair → re-prompted ✓, pass 2 all (3, ≤2) →
     calibrated ✓; its pass-2 prompt holds rubric-frozen.md whole                      — pass
ID10 mode: full · 0 rows carry `no spawn` · 0.8 records exit 0                         — pass
```

**B — `mode: single-agent(declared)`, exit `single-agent-best-effort`.** Row 0.8 returned non-zero. Row 5.7 is
itself `not-run: no spawn`, so these recomputations are the orchestrator's own and are reported as **advisory**.

```
ID1  59 = 43 ticked + 16 not-run (the fourteen §3 rows `no spawn`, 3.10 `not applicable(no amendment)`,
     3.11 `not applicable(no plateau)`)                                                   — pass
ID3  (a), (b), (d) not-run: requote.md absent, header `re-quote: not-run(no spawn)`, `anchoring: unverified`;
     (c) 4 = 0 anchored + 0 + 4 invented-and-flagged; (e) 1A.1 is not in the degraded list, so
     4 = 3 lists + 1 unchallenged                                                          — pass
ID5  0 (3.4 / 3.5 not-run) · ID6 0 (3R.1-3R.3 not-run) · ID8 3 = 0 + 3 not-run          — pass
ID9  0 scorers; 2.3 and 3.2 not-run; header `evaluators: not-run(no spawn)`             — pass
ID10 exactly the fourteen rows carry `no spawn`; 0.8 records a non-zero exit            — pass
```

**C — `mode: full`, exit `budget-reached` mid-loop, one salvage item carried, a `mixed` anchor.** One exemplar is
behind a paywall. One plateau came at cycle 2 and ran a re-open; the budget ran out in cycle 3.

```
ID1  59 = 50 ticked + 9 not-run (3.4, 3.5, 3R.1-3R.3, 4.1, 4.2 `precondition unmet(3.9)`; 1A.7, 3.10) — pass
ID3  (a) 6 = 5 exact-match + 1 unreachable · (c) 4 = 3 anchored + 1 unreachable-and-flagged → `mixed(3/4)` — pass
ID4  9 = 5 grafted + 2 rejected + 1 deferred + 1 carried; legal under `budget-reached`  — pass
ID8  3 = 2 record-present (1A.3, 5.7) + 1 not-run                                       — pass
ID9  7 = 6 calibrated + 1 no-pair (the paywalled dimension's evaluator)                  — pass
```

**E — the imbalances that must fire.**

```
ID1   a row reads `not-run: judged unnecessary`       → IMBALANCE(1): reason outside the closed six
ID3a  requote.md 5 lines vs anchors.md 6 locators      → IMBALANCE(1): a locator was never re-quoted
ID3c  header `sourced` with 1 invented-and-flagged     → IMBALANCE(1): `sourced` requires anchored = descriptors
ID4   cycles/2.md reads `salvage open=4 brief=2`       → IMBALANCE(1): two salvage rows never reached the reviser
ID7   contract `OUTCOME: {…}`, report `outcome: none` → IMBALANCE(1): a measurable outcome was never measured
ID8   `ext/4.1.md` absent while 4.1 is ticked          → IMBALANCE(1)
ID9   exemplar 2 / control 3, verdict `calibrated`     → IMBALANCE(1): row 2.3's rule returns `re-prompted`
ID9   a pass-2 prompt missing a frozen descriptor line → IMBALANCE(1): the re-prompt retyped the rubric
ID10  mode: full, and 3R.1 carries `not-run: no spawn` → IMBALANCE(1): mode contradicts the card
```

**What still passes:** `ext/` files the orchestrator wrote itself, plausible scorecards, `spawns/` prompts for
workers never spawned, straw rejects whose locators open, and an unsearched `none-better-found`.
`evidence.md` §4 prices each.

---

## §4 — What an imbalance means

An imbalance is never repaired by editing a number. It means, in this order of likelihood: a phase did not run;
a phase ran and its output was not written to the run directory; or the card was edited without recomputing §0.
The auditor names which files disagree and stops. The orchestrator then runs the phase, or records the row
`not-run:` with a legal reason, and re-runs the audit. §2's four post-audit writes are the only exception.
