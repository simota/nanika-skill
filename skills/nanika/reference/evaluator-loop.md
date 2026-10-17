# evaluator-loop.md — the scoring machinery

**Owns:** generator-evaluator separation, the 0-3 scale, the rubric's shape, the three output schemas
(`EVALUATION`, `SCORECARD`, `PAIRWISE_VERDICT`), the revision brief, and loop control.
**Read when:** P2, for L4-L5 (the judge return and row 2.3's SCORECARD); P3, for the convergence loop; P4, for
L8's `PAIRWISE_VERDICT`, which row 4.1 hands to each of its four workers.

Contents: L1 separation · L2 the 0-3 scale · L3 the rubric's shape · L4 `EVALUATION` · L5 `SCORECARD` ·
L6 aggregation and the one brief · L7 loop control · L8 `PAIRWISE_VERDICT`.

---

## L1 — Separation

The generator produces the deliverable; independent evaluators score it against the contract using the frozen
rubric. A generator asked to grade its work grades the *intent* it held, not the artifact it produced. N1 owns
the prohibition. **Evaluators are read-only**: they never modify the artifact, and each gets at least one way to
exercise it (`evaluator-roster.md` RS2). A passing loop does not replace exercising the deliverable.

## L2 — The 0-3 scale, and where nanika's bar differs

| Score | Level | Meaning | Ordinary decision | Wish decision |
|-------|-------|---------|-------------------|---------------|
| 3 | Exemplary | matches or exceeds the sourced score-3 anchor | ACCEPT | **required on every dimension** for candidate ACCEPT |
| 2 | Sufficient | meets the acceptance criteria | ACCEPT | REVISE — and stages in the refutation panel |
| 1 | Partial | gaps exist | REVISE | REVISE |
| 0 | Not considered | serious issue, or a disappointment criterion tripped | BLOCK | BLOCK |

Ordinary loops accept at `all dims ≥ 2`; a wish accepts at `all dims = 3`, on calibrated evaluators, ratified by
the panel. Each disappointment criterion is a dimension's score-0 trigger, so it cannot be averaged away.

## L3 — The rubric's shape

3-5 dimensions, weights summing to 1.0. Each carries a **name** and one line on what it measures; a **weight**; a
**score-3 descriptor** that after 1A.2 names its exemplar, its property and the dimension that property anchors; a
**score-1 descriptor** drawn from the control; the **evaluator archetype**; and any **score-0 triggers**. Weight
the dimensions where the model is weak: over-weighting one it already handles raises the score, not the artifact.

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

**Void-and-re-run.** An `evidence_span` that cannot be found in the artifact or reproduced from the named command
voids that dimension's score, and the evaluator is re-run once; a second void leaves the dimension unscored for
that cycle, named in the cycle file. An unscored dimension blocks ACCEPT and carries its prior score into Δ and
row 3.6. "Should be fine" and "looks strong" are not evidence. There is no `calibration:` field: calibration is
the orchestrator's verdict on the scorecard (L5), recomputed by ID9.

## L5 — `SCORECARD`, one file per `scorer_id` under `scorecards/`

```yaml
SCORECARD:
  scorer_id: "<the same id this scorer's EVALUATION returns carry>"
  role: judge | evaluator              # a P2 judge (row 2.3) or a P3 evaluator (row 3.2)
  passes:                              # one entry per blind-pair pass; a second exists only after a re-prompt
    - pass: 1
      labelled_control: false          # true on a pass-2 re-prompt, which names the control (row 2.3)
      prompt: "spawns/<scorer>-pass<k>.md"
      pairs:                           # written by the SCORER, before it sees any candidate
        - dimension: "<name>"          # one pair per anchored dimension it scores; others are listed `no-pair`
          items:
            - item: A                  # that dimension's exemplar and its control, unlabelled and shuffled per scorer
              score: 0-3
              evidence: "<quoted span from that item>"
            - item: B
              score: 0-3
              evidence: "<quoted span from that item>"
      orchestrator_verdict: calibrated | re-prompted | replaced   # written by the ORCHESTRATOR only, by row 2.3's rule
  final_verdict: calibrated | re-prompted | replaced              # the last pass's verdict; ID9 buckets on it
```

A pass-2 `calibrated` is weaker evidence than a pass-1 one, because the control was named; the report's
Calibration section shows which it was. A `replaced` scorer keeps its scorecard and its replacement gets another.

## L6 — Aggregation, and the one brief

```
collect all EVALUATION
   │
   ├─ any dimension = 0            → BLOCK — escalate with the trigger named
   ├─ any dimension ≤ 1            → REVISE
   ├─ all dimensions ≥ 2, any < 3  → REVISE + stage in the refutation panel
   └─ all dimensions = 3           → candidate ACCEPT → panel ratifies or demotes
```

These are loop states, not run exits; the exit comes from `SKILL.md` §3's table. On REVISE, compile **one**
brief, `cycles/<n>-brief.md`, deduplicated across evaluators and ordered by the gap to 3:

```
# brief cycle N → N+1 · angle: <the generator's angle, unchanged> · rubric R1|R2 (attached: rubric-frozen.md)
## address
- [dim: <name>, score 2] <gap_to_3> — <recommendation>
- [surviving attack <id>] <claim> — <evidence>
- [reception] <persona friction that entered as dimension evidence>
- [outcome] <metric> at <value>; best <value>; threshold <h>
## exclusions
- <every ID5 `open` attack, so the reviser does not rediscover it>
## salvage   (built by row 3.3's grep; rows verbatim from salvage.md, never summarized or re-numbered)
| S<n> | from <blind id> | idea | locator | open |
```

Keep the brief inside what one pass can act on — a design choice, not a measured effect: a thirty-item brief invites thirty half-fixes. A 4.2 bonus brief opens
with the lost property, the exemplar's span and the loss's `evidence_span`, then carries the items above.

## L7 — Loop control and the comparability guard

| Parameter | Wish value |
|-----------|-----------|
| Cycle cap | the card header's, read off `SKILL.md` §3 at row 0.4; + ≤1 bonus at 4.2. 3.11's re-opens do not advance it |
| Plateau | row 3.9's three triggers. A plateau runs 3.11 while re-opens remain; only after that is `diminishing-returns` legal |
| ACCEPT | `SKILL.md` §3's ACCEPT row owns every condition |
| Degraded mode | the same cap and triggers, on the producer's advisory scores; where full mode would exit `ACCEPT`, `cap-reached` or `diminishing-returns`, 3.9 writes `single-agent-best-effort` |
| Several exits at once | 3.9 writes the first in `SKILL.md` §3's precedence; an `ACCEPT` there is provisional |
| Best-of retention | keep every cycle's and every re-open's artifact; row 3.6 delivers the best, not the last |

A new dimension added by an amendment gets an evaluator that passes 2.3's blind pair, or is `no-pair`, before
it scores. **Comparability guard.** A score is comparable across cycles only when the rubric text, the evaluator
prompt and the evaluator model are unchanged, which is why L4 requires all three. When any changes, re-score the
retained artifacts before comparing a trend across the boundary.

## L8 — `PAIRWISE_VERDICT`, the P4 exit-gate return

Row 4.1 spawns four workers: two pairings (this artifact vs the P1A exemplars, each worker receiving every one;
this artifact vs the retained runner-up) × two orders. The exemplar pairing returns one verdict **per named 1A.1
property**; the runner-up pairing one verdict overall. Each worker returns exactly this:

```yaml
PAIRWISE_VERDICT:
  pairing: vs-exemplar | vs-runner-up
  order: X-first | Y-first             # which item the worker was shown first; set by the orchestrator
  verdicts:                            # vs-runner-up: exactly one entry, property omitted
    - property: "<a named 1A.1 property>"   # vs-exemplar: one entry per named property, in anchors.md order
      winner: X | Y | tie
      evidence_span: "<a verbatim span from the winning item that exhibits that property; for tie, one from each>"
```

**Aggregation is mechanical.** Map both returns back to the labelled items and compare entry by entry, matched on
`property`: the same winner in both orders → `won` or `lost`; `tie` in both orders → `tied`; anything else →
`inconsistent`, a state, not a loss. A missing property is a missing return. The header counts all four
(`SKILL.md` §5). A `lost` entry's `property` and `evidence_span` are row 4.2's brief. The exemplar is judged per
property because the artifact was built not to resemble it: an overall preference between them is mostly a
preference about genre.
