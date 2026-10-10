# evaluator-loop.md — the scoring machinery

**Owns:** generator-evaluator separation, the 0-3 scale, the rubric's shape, the three output schemas
(`EVALUATION`, `SCORECARD`, `PAIRWISE_VERDICT`), feedback aggregation, and loop control.
**Read when:** P3, for the convergence loop; P4, for §8's `PAIRWISE_VERDICT`, which row 4.1 hands to each
of its four workers.

Contents: L1 separation · L2 the 0-3 scale · L3 the rubric's shape · L4 `EVALUATION` · L5 `SCORECARD` ·
L6 aggregation and the one brief · L7 loop control · L8 `PAIRWISE_VERDICT` · anti-patterns.

Nanika raises exactly one thing about this machinery — the ACCEPT bar — and adds blind-pair calibration
(`SKILL.md` card rows 2.3 and 3.2 and the §P2 table) and panel ratification (`refutation-panel.md`). Everything
else below is the ordinary loop.

---

## L1 — Separation

**The producer never supplies its own independent acceptance verdict.** The generator produces the deliverable; independent
evaluators score it against the contract using the frozen rubric. A generator asked to grade its work
grades the *intent* it held while producing, not the artifact it produced. `SKILL.md` N1 owns the
prohibition and the degraded-mode consequence; this rule owns the shape.

```
        the contract               (what "done" means — frozen at P1)
             │
        the frozen rubric          (how it is scored — frozen at 1A.8)
        /          \
   used by       scored by
      │               │
  Evaluators  ◄───  the artifact
  (parallel,        produced by
   calibrated)      the Generator
```

**Evaluators are read-only.** They never modify the artifact; they return structured feedback the
generator acts on.

## L2 — The 0-3 scale, and where nanika's bar differs

| Score | Level | Meaning | Ordinary decision | Wish decision |
|-------|-------|---------|-------------------|---------------|
| 3 | Exemplary | matches or exceeds the sourced score-3 anchor | ACCEPT | **required on every dimension** for candidate ACCEPT |
| 2 | Sufficient | meets the acceptance criteria | ACCEPT | REVISE — and stages in the refutation panel |
| 1 | Partial | gaps exist | REVISE | REVISE |
| 0 | Not considered | serious issue, or a disappointment criterion tripped | BLOCK | BLOCK |

Ordinary loops accept at `all dims ≥ 2`. Wish accepts at `all dims = 3`, on evaluators ID9 counts as
calibrated, ratified by the panel — that single change is what makes this a ceiling loop rather than a bar
loop. **Score 0 is not merely "bad":** each disappointment criterion is mapped to a dimension as a score-0
trigger, so a regression on something the user said would make them regret the wish cannot be averaged
away by strong scores elsewhere.

## L3 — The rubric's shape

3-5 dimensions, weights summing to 1.0. Each dimension carries a **name** and one line on what it
measures; a **weight**; a **score-3 descriptor** that after 1A.2 names its exemplar, its property and
*the dimension that property anchors*; a **score-1 descriptor** drawn from the control, so the evaluator
has both ends; the **evaluator archetype** (`evaluator-roster.md`); and any **score-0 triggers**.

Weight the dimensions where the model is *weak*. Over-weighting a dimension the model already handles
buys nothing — the score rises and the artifact does not. Rubric wording is a steering input as well as a
measurement: criterion phrasing shifts what the generator produces even with no explicit feedback.

## L4 — `EVALUATION`, the per-cycle scoring return

```yaml
EVALUATION:
  evaluator: "<archetype + dimension>"
  scorer_id: "<stable id — names this scorer's file under scorecards/; unchanged when re-spawned per cycle>"
  rubric_version: R1 | R2              # required — an untagged score is not comparable across an amendment
  evaluator_prompt_id: "<stable id>"   # required — half of the comparability guard in L7
  evaluator_model: "<role name>"       # required — the other half; a role, never a product name
  cycle: N
  dimensions:
    - dimension: "<name>"
      score: 0-3
      evidence_span: "<a verbatim span from the artifact, a file:line, or a command and its output>"
      gap_to_3: "<what specifically is missing; empty only at 3>"
      recommendation: "<the single highest-value change>"
  weighted_score: 0.00-3.00
  verdict: ACCEPT | REVISE | BLOCK
```

**`evidence_span` is load-bearing for a card clause.** Row 3.2's "citing an observation rather than an
impression" lands here and nowhere else — this key is the artifact that clause produces. **Void-and-re-run:** an `evidence_span` that cannot be found
in the artifact or reproduced from the named command voids that dimension's score, and the evaluator is
re-run. "Should be fine" and "looks strong" are forbidden vocabulary.

**No `calibration:` field exists in this schema, deliberately.** A self-declared calibration state is a
string the scorer typed about itself. Calibration is the orchestrator's computation, written onto the
scorecard below and counted *and recomputed* by ID9.

## L5 — `SCORECARD`, one file per `scorer_id` under `scorecards/`

```yaml
SCORECARD:
  scorer_id: "<stable id — the same id this scorer's EVALUATION returns carry as scorer_id>"
  role: judge | evaluator              # a P2 judge (row 2.3) or a P3 evaluator (row 3.2)
  passes:                              # one entry per blind-pair pass; a second exists only after a re-prompt
    - pass: 1
      labelled_control: false          # true on a pass-2 re-prompt, which names the control per §P2
      blind_pair:                      # written by the SCORER, before it sees any candidate
        - item: A                      # unlabelled and shuffled per scorer; the orchestrator holds the key
          score: 0-3
          evidence: "<quoted span from that item>"
        - item: B
          score: 0-3
          evidence: "<quoted span from that item>"
      orchestrator_verdict: calibrated | re-prompted | replaced   # written by the ORCHESTRATOR only
      verdict_basis: "<which row of SKILL.md §P2's table was applied>"
  final_verdict: calibrated | re-prompted | replaced              # the last pass's verdict; ID9 buckets on it
```

The two halves have different authors and the file records which. A pass-2 re-prompt names the control,
so that pass is not blind and `labelled_control: true` says so; a pass-2 `calibrated` is weaker evidence
than a pass-1 one, and the report's Calibration section shows which it was. ID9 counts these files, buckets each on
`final_verdict`, and **recomputes every pass's `orchestrator_verdict` from its two scores against §P2's
table**; a verdict that disagrees with the recomputation is an imbalance. A `replaced` scorer leaves its own scorecard and its replacement leaves
another, so a replacement raises the count by one.

## L6 — Aggregation, and the one brief

```
collect all EVALUATION
   │
   ├─ any dimension = 0            → BLOCK — escalate with the trigger named
   ├─ any dimension ≤ 1            → REVISE
   ├─ all dimensions ≥ 2, any < 3  → REVISE + stage in the refutation panel
   └─ all dimensions = 3           → candidate ACCEPT → panel ratifies or demotes
```

The ladder's leaves are loop states, not run exits. The run's exit comes from `SKILL.md` §3's table, which
carries `reception-demoted`, `single-agent-best-effort` and the rest; nothing here overrides it.

On REVISE, compile **one** brief — not N briefs:

```yaml
REVISION_BRIEF:
  cycle: N → N+1
  address:
    - "[dim: <name>, score 2] <gap_to_3> — <recommendation>"
    - "[surviving attack] <the refutation that was not killed>"
    - "[reception] <persona friction that entered as dimension evidence>"
  salvage:                             # every item from row 2.6, one of four dispositions, none silent
    - "<item> — grafted <where>"
    - "<item> — rejected <why>"
    - "<item> — deferred <why>"
    - "<item> — carried"               # ID4's fourth bucket; legal only per its gate
  trajectory: "cycle N-1: 2.4 → cycle N: 2.7 (Δ 0.3)"
```

Deduplicate across evaluators, order by the size of the gap to 3, and keep the brief inside what the
generator can act on in one pass. A brief with thirty items produces thirty half-fixes.

## L7 — Loop control and the comparability guard

| Parameter | Wish value |
|-----------|-----------|
| Cycle cap | read off the card header, which row 0.4 filled from `SKILL.md` §3's scope line; + ≤1 bonus at 4.2 |
| Diminishing returns | the constant in `SKILL.md` §3's exit table, which owns it |
| ACCEPT | `SKILL.md` §3's ACCEPT row owns every condition, including what makes an anchor `sourced` |
| Best-of retention | **keep every cycle's artifact** — improvement is not monotonic. Card row 3.6 delivers the best, not the last |

**Comparability guard.** A score is comparable across cycles only when the rubric text, the evaluator
prompt and the evaluator model are all unchanged — which is why L4 makes all three required keys. When any
changes, including after a rubric amendment, re-score the retained artifacts before comparing a trend
across the boundary.

## L8 — `PAIRWISE_VERDICT`, the P4 exit-gate return

Row 4.1 spawns four workers: two pairings (this artifact vs the P1A exemplar; this artifact vs the
retained runner-up) × two orders. **The two pairings are not judged at the same grain, and row 4.1 owns
which is which:** the exemplar pairing returns one verdict *per named 1A.1 property*, the runner-up pairing
one verdict overall. Each worker returns exactly this, and nothing else:

```yaml
PAIRWISE_VERDICT:
  pairing: vs-exemplar | vs-runner-up
  order: X-first | Y-first             # which item the worker was shown first; set by the orchestrator
  verdicts:                            # vs-runner-up: exactly one entry, property omitted.
    - property: "<a named 1A.1 property>"   # vs-exemplar: one entry per named property, in anchors.md order
      winner: X | Y | tie
      evidence_span: "<a verbatim span from the winning item that exhibits that property>"
```

**Aggregation is the orchestrator's, and it is mechanical.** Map both returns back to the labelled items
and compare **entry by entry, matched on `property`**. Agreement across the two orders → that entry's
verdict. Any disagreement → `inconsistent`, **a state, not a loss**, and the state the header prints. A
`tie` in either order is not agreement with a win in the other; that entry is `inconsistent` too. The
exemplar pairing therefore produces n verdicts for n named properties, not one, and a missing property is a
missing return, not a tie.

Three things this schema is doing on purpose. `order` is set by the orchestrator and echoed by the worker,
so an unrun order shows as a missing return rather than as a silent single-pass verdict. `property` plus
`evidence_span` on a loss is what makes row 4.2's disposal actionable: "we lost" is not a finding, "we lost
on X, here is the span" is — and row 4.2 briefs the bonus cycle on exactly that property. And the per-
property grain on the exemplar exists because the artifact was built deliberately not to resemble the
exemplar: an overall preference between them is largely a preference about genre, while the named
properties are the comparable part and the part the rubric was written from.

## Anti-patterns — guidance, not a numbered rule

*(The eight rules of this file are L1-L8 above; this section adds none, and `grep -c '^## L' ` returns 8.)*

**Do:** map each rubric dimension to exactly one evaluator · keep the roster at ≤ 5, beyond which
agreement rises and information does not · tune the *evaluator*, not the generator, because making an
evaluator appropriately skeptical is far more tractable than making a generator self-critical · keep scoring and blinded-pair payloads within N6's role-specific boundaries · put
the frozen dimension names and weights into each cycle file by quoting them, per card row 3.1.

**Don't:** treat the generator's tests or self-review as independent acceptance · run without a cycle
cap · accept a score with no `evidence_span` · let an evaluator edit the artifact · treat a passing loop
as a substitute for exercising the deliverable, because a tuned evaluator still misses subtle bugs,
layout defects and deeply nested behaviour.
