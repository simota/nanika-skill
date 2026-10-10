# evaluator-roster.md — archetypes, judges, personas, generators

**Owns:** how to pick who scores what, how to brief a judge, how to build a reception persona, and how to
brief a generator.
**Read when:** at **P1**, for §1-§3, because row 1.11 selects one archetype per dimension from §2's menu
while the draft rubric is written; at **P2**, for §4 (the blind judge panel) and §6 (generators); at **P3R**,
for §5 (reception personas).

Contents: §1 selection (RS1-RS2) · §2 archetypes · §3 default mapping by class · §4 the blind judge panel
(RS3-RS4) · §5 reception personas (RS5-RS6) · §6 generators (RS7-RS8).

Every entry below is a **role**, not a named tool, an installed agent, or a sibling skill. Each is realized
as a spawned worker whose prompt carries the archetype's mandate, its task and N6's role-appropriate context; scoring gets the versioned rubric, cold reads do not. That is what makes this harness portable: the
roster describes an evaluator well enough to instantiate it anywhere a worker can be spawned.

---

## §1 — Selection (RS1-RS2)

| # | Rule | Discipline |
|---|------|-----------|
| RS1 | **Match the archetype to the dimension** | Row 1.11 requires one evaluator archetype per rubric dimension; this rule owns the choice. Pick the archetype in §2 whose mandate most nearly *is* that dimension. A dimension no archetype matches gets a purpose-written evaluator: write its mandate in one sentence, give it a way to exercise what it scores, and name it in the report's Calibration section as a custom evaluator so the roster it came from is legible. |
| RS2 | **Tool-grounded** | Every evaluator gets at least one way to *exercise* the artifact rather than read about it — run it, walk it, operate it, view it rendered, check its claims against a source. An evaluator that can only read produces a review of the prose surface, which is the score a rubric-gaming artifact is built to win. |

Two constraints that bind selection are not rules of this file: **independent-verdict exclusion** is N1, not a ban on production testing, and **calibration before scoring** is card rows 2.3 (judges) and 3.2 (evaluators) with `SKILL.md` §P2's table,
which the orchestrator applies and ID9 recomputes. Neither is restated here.

## §2 — Archetypes

| Archetype | Mandate | Exercises the artifact by | Typical dimension |
|-----------|---------|---------------------------|-------------------|
| **Correctness** | Does it do what the contract says, without regressions? | running the test suite, writing new cases for the contract's acceptance criteria, executing the artifact | Correctness · Functional completeness |
| **Craft** | Is the internal quality high — structure, naming, idiom, absence of duplication and dead paths? | reading the full artifact, not a diff; comparing against the exemplar's structure | Code quality · Craft |
| **Conformance** | Is every acceptance criterion actually met, one by one, with evidence? | walking the criterion list against the artifact and citing where each is satisfied | Spec conformance |
| **Security** | Can it be misused, leaked from, or broken by hostile input? | tracing every boundary — input, auth, secrets, external calls | Security |
| **Behavior** | Does it hold up when driven end-to-end by someone who does not know the implementation? | actually operating it: clicking through, running the flow, following the document's instructions | End-to-end behavior · Usability |
| **Usability** | Is the cognitive load right, the feedback legible, the accessible path real? | performing the primary task under the constraints of a real user | UX quality · Accessibility |
| **Rigor** | Is every externally-checkable claim grounded, and every argument internally consistent? | checking each claim against a source; looking for contradictions between sections | Grounding · Internal consistency |
| **Judgment** | Are the trade-offs sound, the alternatives fairly weighed, the reasoning load-bearing? | reconstructing the decision from the artifact and testing whether it survives | Trade-off soundness |
| **Craft (visual)** | Does it look and feel like the exemplar's class of work — hierarchy, rhythm, restraint, motion? | viewing it rendered, at real sizes, next to the exemplar | Visual craft |
| **Standards** | Does it satisfy the external standard it claims — a spec, a regulation, a style guide? | walking the standard's clauses and marking each met / unmet / N-A | Compliance |

## §3 — Default dimension mapping by deliverable class

Row 0.4 fixes the class; this table is the starting roster for it.

| Deliverable class | Dimensions to archetypes | Recipient roles to ask about at row 1.6 (personas only once named there) |
|-------------------|--------------------------|--------------------------|
| **Code / feature** | correctness to Correctness · code quality to Craft · behavior to Behavior · spec conformance to Conformance · security to Security when the surface warrants | the maintainer who inherits it · the on-call engineer woken by it · the end user |
| **Document** | reader-path (the W12 dimension in `doc-deliverables.md` §5) to Behavior · grounding to Rigor · standards to Standards | the decision-maker who must act on it · the skeptic in the room · a reader with zero context |
| **Plan / strategy** | trade-off soundness to Judgment · external fit to Judgment with a market-facing brief · internal consistency to Rigor | the person who must execute it · the person funding it · a competitor reading it |
| **Design / visual** | craft to Craft (visual) · usability to Usability · accessibility to Standards · motion to Craft (visual) | the first-time visitor · the returning user · the brand owner |

The mapping is a default, not a constraint. P1 selects evaluators matching the contract's *actual*
dimensions, which is often a mix across classes — a flagship document that ships with code needs both.

## §4 — The blind judge panel (P2)

Distinct from the convergence evaluators, and differently prompted: a judge ranks candidates against each
other once, an evaluator scores one artifact every cycle.

| # | Rule | Discipline |
|---|------|-----------|
| RS3 | **Three judges minimum, and each sees a different order** | Three is the floor at which a single idiosyncratic judge stops deciding the tournament. Engine spread is `engine-map.md` §4's; a monoculture panel is declared, never implied (N5). Provenance stripping and the recorded shuffle seed are card row 2.4's; this rule owns only the count. |
| RS4 | **Every judge returns a salvage list** | For each candidate it did *not* rank first, the judge names the specific ideas worth grafting into the winner — an idea and where it is, not "the tone was good". This is what row 2.6 collects and row 3.3 carries until it is consumed, deferred or carried. A tournament that discards its losing candidates whole bought a lottery ticket, not a search. **Return:** one `EVALUATION` (`evaluator-loop.md` L4) per candidate with `cycle: 0` and `evaluator: "judge + <blind candidate id>"`, plus `SALVAGE: [{from: <blind id>, idea, location}]`; "ranked first" means the judge's highest weighted score. |

Aggregate by mean weighted score across judges. Break a tie on the count of first-place placements, then on the
count of salvage items other judges raised from that candidate. Row 2.7 owns the prohibition on deciding the winner by majority vote and names what
that discards.

## §5 — Reception personas (P3R)

| # | Rule | Discipline |
|---|------|-----------|
| RS5 | **Built from the named recipients, and told nothing about the run** | A persona is built from the contract's named recipients (row 1.6), never invented for convenience; where P1 could not name one, that gap surfaces here as a finding, not as a fabricated persona. Each prompt carries **who they are** (role, expertise, what they already believe, what they are busy with) and **how they encounter it** (the actual channel and moment — an inbox at the end of a day, a repo just inherited, a browser tab among nine others). **Explicitly withheld:** the rubric, the loop history, the contract, and the fact that the artifact was optimized at all. A persona told "this is our best work" evaluates the claim, not the artifact. Row 3R.1 sets how many personas run; with more than five named recipients, run the first five in `contract.md`'s recipient order and list the rest in the report's Reception section as `not run (cap)`. |
| RS6 | **The return is fixed, and the stop-span is the part that is checked** | Each persona returns, in this order: first impression in one line · what they do next · every point of friction · **the verbatim sentence it stopped at, or its last sentence read if it finished** · what they would say about it to the person who sent it · whether it changes what they were going to do. The stop-span is then **grepped against the artifact**; absent, row 3R.1's void rule applies; it is the only part of the return a machine can check. A matching sentence checks quotation fidelity only, not understanding, recipient realism or independent execution. These returns are simulated cold reads, not observed audience reactions; a real recipient observation, if any, is reported separately with its source and authorization. ID6 counts valid-span against void. Each friction point, and the stop-span, is a finding for 3R.2. |

Findings enter the loop as evidence on existing rubric dimensions. **Reception is never a parallel gate.**
Row 3R.2 owns the disposal and carries all three of it — re-scored on a named dimension, routed to `SKILL.md`
§6 amendment, or recorded as a residual with the reason no dimension fits, the last legal only once the cycle
cap is spent or §6 was declined or already used. **Row 3R.3 owns what follows a re-score:** a finding that moved a score sends the run back into
P3 while cycles remain. 3R.2's re-score is made by the calibrated P3 evaluator that owns that dimension,
under its own `scorer_id`, handed the finding and stop-span; its `EVALUATION` is appended to the latest
`cycles/<n>.md` tagged `reception-pass: <k>`. The orchestrator never re-scores (N1). Neither disposal nor re-entry is a rule of this file, and this file adds no fourth
disposition and no second exit.

## §6 — Generators

Everything above evaluates. This section is the thing evaluated: the worker that produces a candidate. The
harness supplies the machinery around generation, not the craft inside it — a generator is whatever process
would ordinarily make this deliverable, run under the constraints below.

| # | Rule | Discipline |
|---|------|-----------|
| RS7 | **One angle each, and the angle is stable across cycles** | A generator is given a *strategy*, not a style, and is briefed at the level row 0.4 wrote into the card header — this file does not decide that level, it only says how to brief at each. **At outline level:** the outline must be specific enough to judge — the structure, the load-bearing choices, and the actual opening — and not a description of an outline. **At full-build level:** a complete artifact, because at that scale the outline hides exactly the failures the tournament exists to find. In P3 the winning candidate's generator, or a fresh worker on the same angle, revises against the one aggregated brief; **keep the angle stable across cycles**, because a generator that changes strategy mid-loop restarts the score trajectory and makes the plateau exit meaningless. Isolation between generators is row 2.2's, and the prohibition on producer self-certification is N1's; tool-grounded checks remain allowed. |
| RS8 | **Spawn discipline is N6's, for every spawn kind on the roster** | Generators, judges, evaluators, skeptics, personas and checkers alike: the task, schema, envelope, permitted role-specific context and prompt persistence N6 requires. This file adds nothing to that list and states no part of it twice; what a generator prompt carries *beyond* N6 is its assigned angle, and what a P2 generator must **not** carry is the other angles, the other candidates, or the loop history; a P3 reviser carries the artifact, its angle and the one `REVISION_BRIEF` (row 3.3), plus `doc-deliverables.md` for a document — never the other angles or candidates. |

**What a generation angle is.** An angle is a different *bet about what makes this excellent*, not a
different tone. Row 2.1 requires the angles to disagree; these are the families that reliably do:

| Angle | The bet |
|-------|---------|
| **Conventional, executed perfectly** | The known-good shape is right and everything rides on execution. The baseline every other angle must beat |
| **The unconventional read** | The brief supports a materially different interpretation, and it is better |
| **Recipient-optimized** | Built backwards from one named recipient's actual moment of encounter |
| **Against the exemplar** | Deliberately does what the P1A exemplar does *not* — its omission is the opportunity |
| **Constraint-inverted** | The stated constraint is treated as the thing to design around rather than within |

Angles that all agree produce a tournament whose winner was never in doubt: the cost of a tournament with
the value of a single attempt.
