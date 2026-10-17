# refutation-panel.md — the gauntlet

**Owns:** how to brief a skeptic, the angle menu, the evidence-vs-novelty discipline, verdict aggregation, the
ratification duty, and the hard exclusions.
**Read when:** at **P3**, from the first cycle where all rubric dimensions reach 2 (row 3.4's trigger), and again
in any cycle a 3R.3 re-entry or 4.2's bonus opens, which must re-ratify at 3.5.

The panel's target claim is fixed and singular:

> **"This artifact satisfies the frozen criteria without a material overlooked defect."**

---

## G1 — How to brief a skeptic

A skeptic is briefed to **actively refute** that claim from one assigned angle, never to "evaluate": a worker asked
to evaluate hedges. The brief carries the claim verbatim, one angle from the table below, `rubric-frozen.md` with its
version tag, and N6's fields. Spread skeptics per `engine-map.md` §4 and tag each one's engine. A skeptic that scored
the artifact is excluded (its score is a prior); one that produced or revised it is excluded by N1. Row 3.4 carries
the panel's conditions; their consequence for the brief writer: never hand a skeptic another skeptic's return, never
re-run a skeptic against a reply, never let the panel converge on a shared verdict.

**Return schema.** Per attack: `ATTACK: {angle, claim_attacked, evidence: <span, file:line, or command + output>,
class: refuted-on-evidence | unproven-because-new, confidence: high | low, falsifier: <what would show it wrong>,
outside_boundary: true | false}`. `outside_boundary: true` marks an Alternative that needs something outside the
contract or A2 boundary; the orchestrator copies it into `bold.md` at row 3.12 and does not act on it.

| Angle | The attack |
|-------|-----------|
| **Alternative** | "A materially different approach would have been better, and here it is" |
| **Recipient** | "The named recipient will not respond the way this assumes" — argued, not simulated as in P3R |
| **Durability** | "This degrades, dates, or breaks under the conditions it will actually meet" |
| **Omission** | "The best version of this contains something absent here" |
| **Substance** | "This scores 3 because it performs excellence rather than achieving it" |
| **Feasibility** | "This cannot actually be delivered, used, or maintained as built" |

## G2 — Kill weak work, not bold work

- **Refuted-on-evidence** — a concrete fact defeats the claim. Before 3.5 it enters the next brief as a surviving
  attack; at 3.5 it demotes the candidate ACCEPT to REVISE.
- **Unproven-because-new** — the artifact does something unusual and no precedent shows it works. That is the
  signature of a bet, not grounds for demotion. It goes to ID5's own bucket with its falsifier, which the terminal
  line prints, so a demotion-avoiding reclassification shows its count.

## G3 — Staging

Attacking an artifact at score 1 returns the known gap at the price of a full panel. A cycle below row 3.4's
threshold spawns no skeptics, and their envelope term is not spent.

## G4 — The ratification duty

At a candidate ceiling the panel decides whether the run terminates (row 3.5). It sits **inside** the rubric oracle:
it cannot ratify what the rubric scored below 3, lower the ceiling, or invent a dimension. An attack no dimension
can express routes to `SKILL.md` §6 (row 3.10), not to a second verdict.

## G5 — Verdict aggregation

Dispose each attack on its own evidence, never by head-count. A `refuted-on-evidence` attack at `confidence: high`
whose evidence the orchestrator reproduces → `open` (→ `fixed` once a later cycle removes it). Evidence not
reproduced, or `confidence: low` → `killed`, reason recorded. `unproven-because-new` → that bucket, whatever its
confidence. Every attack appears in the report's Gauntlet section; row 3.5 carries the `open` ones as generator
exclusions so the loop does not rediscover the same dead end.

## G6 — Hard exclusions

- **A verdict flips on new evidence, never on pressure.** An objection from the generator, the user or a louder
  panelist is not a refutation; only a fact not already in the record is.
- **The panel authorizes nothing destructive or irreversible.** A refutation implying that something outside the
  wish's scope should be deleted, published or rewritten is a finding for the user (N8).
- **A low-confidence attack never demotes.** Avoid contrarian drift (objecting by default), disclaimer substitution
  ("the final call is yours" on an attack that already decided) and false neutrality (two sides where the evidence
  has one).
