# identities.md

**Owns:** the card address inventory, the ten run identities, and the protocol row 5.7 hands to the auditor.
**Read when:** at P5, by the orchestrator preparing the 5.7 spawn — and by the auditor itself, which reads
this file and the run directory and nothing else.

Contents: §0 address inventory · §1 the ten identities · §2 the audit protocol · §3 worked examples, one per
legal run state · §4 what an imbalance means, and what it never licenses.

## §0 — Card address inventory

**C1.** Count addresses, not execution capacity: P0 8 · P1 12 · P1A 8 · P2 7 · P3 10 · P3R 3 · P4 2 · P5 7,
for 57 card rows, plus A1–A6 and N1–N8. A row may contain several independently failing requirements.
Do not add these addresses to reference-rule counts or compare their sum to keyword-inclusion benchmarks.

---

## §1 — The ten identities

Design rule, and the reason this file exists: **an identity may not have fewer buckets than the row it
audits has legal outcomes.** An identity that fires on a correct run teaches the auditor to explain
imbalances away, which costs more than the identity buys. Every bucket set below is a partition of the
states the card legalises — `not-run` and `carried` included.

**ID1 — the card.** `57 = ticked + not-run`, **and** every ticked row's `ev:` value resolves to an
existing file inside the run directory, **and** every `not-run:` reason is one of the six strings the card
legend closes on (`no spawn` · `no external worker` · `not applicable(<class|scope|no amendment|first wish|single cycle>)` ·
`precondition unmet(<row>)` · `user declined(<path>)` · `capability absent(<name>)`). A seventh string is
an imbalance even when the arithmetic sums. Source: all 57 rows, 5.6.

**ID2 — the contract.** `elements = elicited + ratified + parked`, with `silent = 0`. Weak by
construction: it detects an unclassified element, not a mis-classified one. Source: 1.8, 1A.5.

**ID3 — the anchor.** Five parts, each over `anchors.md` and `requote.md`. **Every part carries the same
`not-run` disposition:** row 1A.3 `not-run` → `requote.md` is absent, all totals in (a), (b) and (d)
are 0, the clause being described is *not evaluated in that state*, and the header reads
`re-quote: not-run(<reason>)` with `anchoring: unverified`. That branch is written into each part rather
than inferred from part (a), because an exemption an auditor has to infer is an exemption an auditor
argues about.
- **(a) lines.** `requote.md`'s `## Locators` block lines `= exact-match + mismatch + unreachable`, **and** that total equals
  the locator count in `anchors.md`.
- **(b) property and separation.** Property verdicts `= property-present + property-absent +
  not-assessed`, one per line in `requote.md`, so the total equals the locator count. A control locator is
  `not-assessed` unless 1A.1 named a property for it; an exemplar that is `not-assessed` is legal only
  when its locator came back `unreachable`. **And, per NAMED PROPERTY rather than per locator:**
  `named properties = separating + non-separating + non-comparable`, one verdict each, from the checker
  opening the control at that property. A named property with no separation verdict is an imbalance —
  that is 1A.3's control clause not having run.
- **(c) descriptors.** score-3 descriptors `= anchored + unreachable-and-flagged + invented-and-flagged`,
  where a descriptor counts as `anchored` only if its locator is `exact-match` **and** `property-present`
  **and** its property is `separating`. A `mismatch`, `property-absent`, `non-separating` or
  `non-comparable` row that is still `anchored` is an imbalance — that is 1A.4 not having run. Two further
  clauses live here. **`sourced`:** the header may read `anchoring: sourced` only when `anchored` equals
  the descriptor count, the other two buckets are 0, and (d) leaves no `out-anchored` exemplar. `SKILL.md` §3's ACCEPT row defines that word and this part computes
  it, together with the header's other anchoring states, which are exhaustive and exclusive: `unverified`
  when 1A.3 carries `not-run`; `invented-fallback` when 1A.4 records that the no-exemplar fallback fired;
  otherwise `sourced` when anchored = descriptors with no `out-anchored` exemplar, `unanchored` when
  anchored = 0, and `mixed(a/d)` in every other case — including all descriptors anchored but an exemplar
  left `out-anchored`. **One property per dimension:** each score-3 descriptor names exactly one dimension and one
  property; if a property appears on more than one descriptor, the header must read `shared-property(n)`
  with n = the number of descriptors sharing, and silence is an imbalance.
- **(d) challenge.** Exactly one challenge return per exemplar, each `none-better-found` or a
  stronger-candidate locator; every stronger-candidate is followed in the header by `re-anchored` or
  `out-anchored`, never by silence.
- **(e) reject lists.** `named properties = lists-with-≥2-beaten-candidates + unchallenged`, counted from
  `anchors.md`, **and** every reject locator in every list resolves. The header's
  `reject-lists: n / n | unchallenged(n)` is read off this equation, so the field is computed rather than
  typed — the same defect ID9 closes for calibration. `SKILL.md` §7 prices what (e) does not check.

Source for all five: 1A.1-1A.4.

**ID4 — salvage.** `raised = grafted + rejected-with-reason + deferred-with-reason + carried`. `carried`
is legal only while the loop is open or when the exit is `budget-reached`; a closed run with `carried > 0`
under any other exit is an imbalance. Source: 2.6, 3.3.

**ID5 — the gauntlet.** `attacks raised = killed + fixed + open + unproven-because-new`, and the
`unproven-because-new` count appears in the `SKILL.md` §5 terminal line, which carries a field for it. Source:
3.4, 3.5.

**ID6 — reception.** `personas run = valid-span + void`, summed over every reception pass and counting a
re-run as its own persona run; each
void is followed by exactly one re-run, or — when that re-run is void too — by a named residual;
`personas run = 0` is legal exactly when 3R.1 carries `not-run`. Source: 3R.1, 3R.2, 3R.3.

**ID7 — the contract's two axes.** `acceptance criteria = verified + partial + missed + dropped`;
`prohibitions = held + violated + unverified`, counted separately and never merged. Source: 1.2, 1.4, 5.2.

**ID8 — the external cells.** `ext cells = 3 = record-present + not-run`, where
`record-present` is `ls ext/ | wc -l` — files, not labels, one per cell: 4.1's four returns go in
`ext/4.1.md`, and a re-anchor's second 1A.3 return is appended to `ext/1A.3.md`, never written over it. Catches an absent record; does not catch
a fabricated one, which `SKILL.md` §7 states rather than claims away. Source: 1A.3, 4.1, 5.7.

**ID9 — the scorers.** Two clauses. A scorer is every P2 judge and every P3 evaluator, identified by the
`scorer_id` on its scorecard, which every scoring return it makes repeats (`EVALUATION` for an evaluator,
an `EVALUATION` with `cycle: 0` for a judge (`evaluator-roster.md` RS4); `evaluator-loop.md` L4-L5); an evaluator re-spawned in a later
cycle under the same id is the same scorer. **Count:** `scorers = calibrated + re-prompted + replaced + no-pair`, one
scorecard per scorer under `scorecards/`, each holding every blind-pair pass and the orchestrator's verdict
on each. `no-pair` is a scorer none of whose dimensions has an `anchored` descriptor, so 2.3 gave it nothing
to calibrate on; its scores are advisory, and the run cannot read `anchoring: sourced` anyway. A scorer is
bucketed by its **final** verdict: a scorer re-prompted once and then calibrated is
`calibrated`; a final `re-prompted` means the second pass never ran, which is legal only for a scorer that
produced no score. A scorer that produced any score in `cycles/*` or in the P2 judging is an imbalance if
it has no scorecard or its final verdict is neither `calibrated` nor `no-pair`; a scorer with no score may end `re-prompted`
or `replaced`. A replaced scorer leaves its own scorecard
**and** its replacement's, so a replacement raises the total by one. `scorers = 0` is legal exactly when
2.3 and 3.2 carry `not-run`, and the header then reads `evaluators: not-run(<reason>)`; the producer's advisory scores then carry `scorer_id: producer(advisory)`
and are no scorer. **Recompute:**
`SKILL.md` §P2's table is deterministic over the pairs of each pass — one exemplar-and-control pair per
dimension the scorer scores — so the auditor recomputes each pass's verdict: every pair `exemplar = 3 ∧
control ≤ 2 → calibrated`, otherwise `re-prompted` on the first pass and `replaced` on the second. A written verdict that disagrees with the recomputation is an imbalance.
Counting alone catches a missing scorecard; it does not catch truthful scores under a false verdict, which
is the cheaper of the two forgeries. Source: 2.3, 3.2, and §P2's calibration table.

**ID10 — the mode.** A biconditional, checked in both directions:
`mode: single-agent(declared)` ⟺ **exactly** the fourteen rows in §3's degraded list carry
`not-run: no spawn` and no other row carries that reason; `mode: full` ⟺ **no** row carries it. Third
clause: `mode:` must equal what row 0.8's evidence file records as the preflight result. A mis-declared
mode was invisible to every other identity. Source: 0.8, §3's degraded list.

---

## §2 — The audit protocol

**AUD.** The 5.7 worker is spawned with this file and the path to the run directory, and nothing else.

1. It **reads the run directory, never the transcript**, and lists every file it opened in its return.
   A file it did not open cannot appear in its arithmetic.
2. It recomputes ID1-ID10 from those files and returns, per identity, `pass` or
   `IMBALANCE(<n>): <what does not sum, and which files disagree>`.
3. **It never adjusts a count to close an imbalance, and it never proposes a fix.** An imbalance is a
   phase that did not run, or ran and threw its output away. Naming it is the whole of the job.
4. Its raw return is retained in `ext/5.7.md`, linked from the report and summarized in the `identity:` header field.
   A summary that disagrees with the return is itself an imbalance.
   **When 5.7 is spawned (`mode: full`), its own row counts as done.** The audit cannot see the record it is
   about to become, so it counts row
   5.7 as ticked and `ext/5.7.md` as present. After it returns, only four writes are legal: tick 5.7, save
   `ext/5.7.md`, fill the report's `identity:` field and terminal line, and finish 5.6's link. Any other
   change to the run directory makes it a different run, which §4 says needs a new audit.
5. The terminal line uses `card <n> rows`, read from the card, never a hardcoded row count. A field whose source
   row carries `not-run` prints `<field> not-run(<reason>)`; in `single-agent(declared)` mode it prints
   `identities advisory <n>/10`; when P4 ran twice, `exit-gate` and the `exit gate:` header print the acted
   pass, then `· advisory <counts>`.

---

## §3 — Worked examples, one per legal run state

**A — `mode: full`, exit `ACCEPT`.** A four-dimension rubric. `anchors.md` holds six locators: four
exemplars, one per dimension, each with its own named property, plus two controls. Nine salvage items with
one deferred; one attack parked `unproven-because-new`; no extra engines; a non-code deliverable; no
amendment; seven scorers — three P2 judges and four P3 evaluators, one per dimension — one judge
re-prompted once and then calibrated. This is the canonical ACCEPT, and under the `sourced` definition it
has to be **fully** anchored to be one: a run with one flagged or invented descriptor prints
`mixed(<a>/<d>)` and cannot exit ACCEPT. `SKILL.md` §5's terminal line is this example.

```
ID1  57 = 55 ticked + 2 not-run   (1A.7 capability absent(extra engine) · 3.10 not applicable(no amendment));
     5.3 is ticked — `run-discipline.md` Q16 sweeps documents too
     55 resolving paths; 2 reasons both inside the closed six                         — pass
ID2  12 = 7 elicited + 4 ratified + 1 parked · silent 0                               — pass
ID3  (a) requote.md 6 lines = 6 exact-match + 0 mismatch + 0 unreachable; anchors.md locators 6 = 6 — pass
     (b) 6 property verdicts = 4 present + 0 absent + 2 not-assessed (the two controls);
         4 named properties = 4 separating + 0 non-separating + 0 non-comparable       — pass
     (c) 4 score-3 descriptors = 4 anchored + 0 unreachable-and-flagged + 0 invented-and-flagged;
         `anchored` = descriptors → header `anchoring: sourced`; 4 distinct properties over
         4 dimensions → header `one-per-dimension`                                     — pass
     (d) 4 challenge returns = 4 none-better-found; header `challenge: none-better-found`    — pass
     (e) 4 named properties = 4 lists-with-≥2-beaten + 0 unchallenged; 8 reject locators, 8 resolve;
         header `reject-lists: 4 / 4`                                                  — pass
ID4  9 = 6 grafted + 2 rejected-with-reason + 1 deferred-with-reason + 0 carried       — pass
ID5  7 = 4 killed + 2 fixed + 0 open + 1 unproven-because-new; the 1 prints on the terminal line — pass
ID6  3 personas = 3 valid-span + 0 void; 3R.3 records no score moved, so P4 opened     — pass
ID7  5 criteria = 3 verified + 1 partial + 0 missed + 1 dropped
     2 prohibitions = 2 held + 0 violated + 0 unverified                               — pass
ID8  3 = 3 record-present + 0 not-run · `ls ext/` → 3 files                       — pass
ID9  count: 7 scorers = 7 calibrated + 0 re-prompted + 0 replaced (final verdicts) · `ls scorecards/` → 7
     recompute: judge-1, judge-2 four pairs each, every pair (3, ≤2)→calibrated ✓ ·
                judge-3 pass 1, four pairs, one of them (3,3)→re-prompted ✓, pass 2 four pairs (3, ≤2)→calibrated ✓ ·
                eval-1..4 one pair each, (3,2) (3,1) (3,2) (3,2)→calibrated ✓               — pass
ID10 mode: full · rows carrying `not-run: no spawn` = 0 · 0.8 records exit 0           — pass
```

**B — `mode: single-agent(declared)`, exit `single-agent-best-effort`.** Row 0.8's preflight returned
non-zero. Every ID3 part carries its own `not-run` branch, so none of the five is exempted by inference:
each `— pass` below is computed from that branch, not narrated.

```
ID1  57 = 42 ticked + 15 not-run   (the fourteen §3 rows with `no spawn`, plus 3.10
                                    `not applicable(no amendment)`); every reason inside the closed six — pass
ID2  12 = 8 elicited + 4 ratified + 0 parked · silent 0                                — pass
ID3  (a) 1A.3 not-run → requote.md absent, total 0, header `re-quote: not-run(no spawn)`,
         `anchoring: unverified`; the line-count clause is not evaluated in this state  — pass
     (b) not-run: no property and no separation verdicts exist; neither clause evaluated — pass
     (c) 4 descriptors = 0 anchored + 0 unreachable-and-flagged + 4 invented-and-flagged;
         `sourced` unavailable (header is `unverified`); the one-property-per-dimension clause
         still binds, and 1A.2 named 4 distinct properties → `one-per-dimension`        — pass
     (d) not-run: no challenge return exists, and the header carries neither `re-anchored`
         nor `out-anchored`. Computed from the branch, not narrated                     — pass
     (e) 1A.1 is **not** in the degraded list, so the reject lists exist and are evaluated:
         4 named properties = 3 lists-with-≥2-beaten + 1 unchallenged; header
         `reject-lists: 3 / 4 | unchallenged(1)`                                        — pass
ID4  9 = 5 grafted + 3 rejected + 1 deferred + 0 carried                                — pass
ID5  0 = 0 + 0 + 0 + 0            (3.4 / 3.5 not-run: no spawn)                         — pass
ID6  0 personas = 0 valid-span + 0 void   (3R.1, 3R.2, 3R.3 not-run: no spawn)          — pass
ID7  5 criteria = 2 verified + 2 partial + 1 missed + 0 dropped
     2 prohibitions = 1 held + 0 violated + 1 unverified                                — pass
ID8  3 = 0 record-present + 3 not-run                                              — pass
ID9  count 0 scorers; 2.3 and 3.2 not-run: no spawn; header `evaluators: not-run(no spawn)`;
     the recompute clause has no scorecard to read and is not evaluated                 — pass
ID10 single-agent(declared) ⟺ exactly those fourteen rows, no others; 0.8 records a non-zero exit — pass
     exit: single-agent-best-effort — ACCEPT is unreachable by §3, not by judgment
```

Row 5.7 is itself `not-run: no spawn` in this state, so these ten recomputations are the orchestrator's own
and are reported as **advisory**, which is part of what `single-agent-best-effort` means. An identity
recomputed by the run that produced it is the configuration N1 forbids; here it is the only one available,
and the header says so rather than the audit reading as external.

**C — `mode: full`, exit `budget-reached` mid-loop, one salvage item carried, and a `mixed` anchor.**
One exemplar is behind a paywall, so one descriptor cannot be anchored. Nothing here is mishandled and no identity fires — but the run may not
print `sourced`, and with a `mixed` anchor ACCEPT would be unreachable even if the loop had finished.

```
ID1  57 = 48 ticked + 9 not-run   (3.4, 3.5, 3R.1, 3R.2, 3R.3, 4.1, 4.2 `precondition unmet(3.9)`;
                                   1A.7 `capability absent(extra engine)`, 3.10 `not applicable(no amendment)`) — pass
     3.9 is ticked with its `budget-reached` verdict; the seven rows cite it because that verdict
     closed the loop before their own preconditions could be met
ID3  (a) requote.md 6 = 5 exact-match + 0 mismatch + 1 unreachable = anchors.md 6       — pass
     (b) 6 = 3 property-present + 0 absent + 3 not-assessed (2 controls + 1 unreachable);
         4 named properties = 4 separating + 0 + 0 (the control is reachable, so the
         unreachable exemplar's property still gets its separation verdict)            — pass
     (c) 4 descriptors = 3 anchored + 1 unreachable-and-flagged + 0 invented-and-flagged
         → header `anchoring: mixed(3/4)`, **not** `sourced`; `one-per-dimension`        — pass
     (d) 4 challenge returns = 4 none-better-found                                       — pass
     (e) 4 = 4 lists-with-≥2-beaten + 0 unchallenged; 8 reject locators resolve          — pass
ID4  9 = 5 grafted + 2 rejected + 1 deferred + **1 carried**; exit is `budget-reached`, so
     carried > 0 is legal and the report lists the carried item                          — pass
ID6  0 personas (3R.1 not-run) = 0 valid-span + 0 void; 3R.3 not-run with it             — pass
ID8  3 = 2 record-present (1A.3, 5.7) + 1 not-run(precondition unmet(3.9))          — pass
ID9  count 7 = 6 calibrated + 0 re-prompted + 0 replaced + 1 no-pair: the judges calibrate on the
     three anchored dimensions' pairs, and the paywalled dimension's evaluator has no pair; header
     `evaluators: 6 calibrated / 0 re-prompted / 0 replaced / 1 no-pair`                      — pass
ID10 mode: full; no row carries `not-run: no spawn`                                      — pass
```

**D — `rubric: R2`, exit `reception-demoted`.** Two named recipients, N = 3, three reception passes. Pass 1,
after cycle 2: one finding re-scored and re-entered (cycle 3), one routed to §6, which opened at 3.10. Pass 2,
after cycle 3: clean; P4 lost one exemplar property, and 4.2 spent the bonus on it. Pass 3, after the bonus:
a finding moved a score on a rubric-perfect artifact with the cap spent → demoted. Only the identities that move are shown. The amendment added a fifth
dimension, and `anchors.md` held no separate exemplar for it — so the run shares one property across two
descriptors and must say so.

```
ID1  57 = 56 ticked + 1 not-run   (1A.7 `capability absent(extra engine)`)               — pass
ID3  (c) 5 descriptors = 5 anchored; two of them cite the same property → header
         `shared-property(2)`. Legal, printed, and it lowers no other verdict — but a reader
         can now see that five dimensions rest on four properties                        — pass
ID5  6 = 3 killed + 2 fixed + 0 open + 1 unproven-because-new                            — pass
ID6  6 personas = 6 valid-span + 0 void, summed over three passes of two; pass 3's finding is
     the one 3R.3 may convert instead of re-entering, because the cap was spent           — pass
ID7  6 criteria = 4 verified + 2 partial (re-scored under R2, both versions retained)    — pass
     exit: reception-demoted — never reports as ACCEPT, per §3
```

**E — the imbalances that must fire.** One run, eight defects, eight named failures.

```
ID1   a row reads `not-run: judged unnecessary`  → IMBALANCE(1): reason outside the closed six
ID3a  requote.md 5 lines vs anchors.md 6 locators → IMBALANCE(1): a locator was never re-quoted
ID3b  4 named properties, 3 separation verdicts   → IMBALANCE(1): 1A.3's control clause did not run
ID3c  a `non-separating` property still carries an `anchored` descriptor
                                                  → IMBALANCE(1): 1A.4 did not run
ID3c  header `anchoring: sourced` with 1 invented-and-flagged descriptor
                                                  → IMBALANCE(1): `sourced` requires anchored = descriptors
ID3e  4 named properties, 3 reject lists, and one list's second locator does not open
                                                  → IMBALANCE(2): one property unchallenged and unheaded;
                                                     one reject locator unresolvable
ID8   3 ext cells = 2 record-present + 0 not-run → IMBALANCE(1): `ext/4.1.md` absent while 4.1 is ticked
ID9   scorecard holds exemplar 2 / control 3, verdict `calibrated`
                                                  → IMBALANCE(1): §P2's table returns `re-prompted`
ID10  mode: full, and 3R.1 + 4.1 carry `not-run: no spawn`
                                                  → IMBALANCE(1): mode contradicts the card
```

Each is reported as a phase that did not run, named, and then run or recorded `not-run`. None is closable
by adjusting a count. **What still passes:** an orchestrator that writes all three `ext/` files itself,
plausible scorecards with internally consistent scores, `spawns/` prompts for workers it never
spawned, two straw rejects whose locators happen to open, and a challenge return of `none-better-found`
it never searched for. `SKILL.md` §7 prices each of these.

---

## §4 — What an imbalance means

An imbalance is not a reporting error and is never repaired by editing a number. It means one of three
things, in this order of likelihood: a phase did not run; a phase ran and its output was not written to
the run directory; or the card was edited without recomputing the address inventory in §0. The auditor names which
files disagree and stops. The orchestrator then runs the phase, or records the row `not-run:` with one of
the six legal reasons — and re-runs the audit, because a run directory that changed after an audit has an
audit of a different run. §2's four post-audit writes are the only exception.
