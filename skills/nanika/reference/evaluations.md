# evaluations.md

**Owns:** the four evaluations that would measure this skill, written to be runnable by someone who did
not write it. **Read when:** never during a run. Read by whoever runs an evaluation, or by a reader
checking what `DELTA: UNMEASURED` in `SKILL.md` is a claim about.

**Every evaluation in this file is `status: NEVER RUN`.** None has produced a number. Nothing in
`SKILL.md` is justified by a result from this file, and if it ever is, the header line
`delta: UNMEASURED` is the token that must change — no other line in the skill claims a measured effect.

Contents: E1 skill delta · E2 instruction-compliance vs verbal-compliance · E3 deletion control ·
E4 weakest-tier survival · §5 what each result would change.

Row and load figures below are **pointers, not copies**: the card's row count and `SKILL.md` §0.6's peak
own themselves, and this file names the section rather than restating the arithmetic. Cycle 3 restated
§0.6's whole computation here, which is the class A4 forbids.

---

## E1 — Skill delta

**status: NEVER RUN.** No arm of this has been executed. The design below is complete enough to run and
is pre-registered here so that a later run cannot choose its analysis after seeing the scores.

**Question.** Does an agent handed this skill produce a better deliverable than the same agent handed the
same brief without it — and if it does, is the gain in the machinery or in the prose?

**Arms**, three, all on the same brief and the same model tier:
- **W** with-skill: `SKILL.md` plus `reference/`, run to completion.
- **N** no-skill: the brief alone, plus "produce the best version of this you can."
- **M** skill-minus-run-directory: `SKILL.md` with the Run Card, the identities and every `ev:` path
  requirement removed, the prose kept. Isolates the harness from the writing. M is the arm that decides
  whether this document is a machine or an essay, and it is the arm most likely to embarrass it.

**Briefs**, three, fixed before any arm runs, one per deliverable class, each with a real recipient and a
pre-written acceptance list: (1) a technical decision memo, (2) a small library plus its README, (3) a
one-page plan with a named approver.

**Unit of analysis.** One (brief × arm × repetition) deliverable, scored on a 0-3 weighted rubric written
**before any arm runs** by someone who will not judge, using the same five-dimension shape this skill
produces at row 1.10.

**n, stated as numbers rather than as field names:**
- 3 briefs × 3 arms × **6 repetitions** = **54 deliverables**.
- Paired analysis: the primary contrast is W − N within brief and repetition → **18 paired observations**.
- **3 judges** per pairing, drawn from different model families where the host offers them; each pairing
  judged in **both orders** → 6 verdicts per pairing, and only order-consistent verdicts count, per the
  same rule row 4.1 uses [EV-16b].
- Judges never learn the arm. Deliverables are stripped of any card, header or run-directory artefact
  before judging — a W deliverable that arrives carrying its Fulfillment Report is unblindable and is
  re-rendered without it, or the pairing is void.

**Pre-registered effect size and power.**
- **Minimum effect of interest: +0.40** on the 0-3 weighted rubric score (W over N). Below that, the
  skill costs more agents than it earns quality, at the envelope §3 prices.
- Assumed within-brief SD of the weighted score: **0.55 points**. This is an assumption, not a
  measurement — no such SD has been observed for this rubric on this task class. +0.40 against 0.55 is
  **d = 0.73**.
- A paired t-test on **n = 18** pairs at α = 0.05, two-sided, has **80% power at d = 0.71**. So the design
  is powered for the effect it pre-registers, *conditional on the assumed SD*. **If the observed SD
  exceeds 0.70, the study is underpowered and its null is uninformative** — that condition is registered
  here so that it cannot be discovered afterwards and reported as a finding.
- Secondary contrast W − M shares the same n and the same MDE and is explicitly **exploratory**: 18 pairs
  cannot separate a 0.2-point machinery effect from noise, and a null there means "not measured", never
  "the machinery does nothing".

**How a null reads.** Three outcomes are pre-committed:
1. CI for W − N excludes +0.40 → the skill does not buy its cost. `DELTA:` becomes
   `MEASURED: no effect above +0.40 (n=18, CI …)` and §7's kept table is re-opened against E3.
2. CI includes +0.40 and includes 0 → **inconclusive, underpowered**, reported as such. `DELTA:` stays
   `UNMEASURED` with the attempt recorded. This is the most likely outcome at n = 18 and saying so now is
   the point of writing the power statement before the run.
3. CI excludes 0 and its lower bound is above +0.40 → a measured delta, reported with the n, the judge
   count, the SD actually observed, and the briefs.

**Length control.** A W deliverable will usually be longer. Judges score against the rubric, which
carries no length dimension, and **a win attributable to length alone scores as no delta**: any pairing
whose winner is >1.5× the loser's token count is re-judged with both truncated to the shorter length, and
the truncated verdict is the one that counts.

**What would invalidate the run.** Any of: a judge that saw an arm label; a rubric edited after an arm
ran; briefs chosen after piloting; fewer than 6 order-consistent verdicts on a pairing; the W arm run by
the same context that wrote the brief.

---

## E2 — Instruction Compliance Rate vs Verbal Compliance Rate

**status: NEVER RUN.**

**Question.** When a run reports a row as done, is the work behind it there? This is the measurement of
the hole `SKILL.md` §7 admits with residue "None": ID1 checks that a path resolves, not that the file
behind it evidences its row.

**Method.** Over **5 completed W runs** from E1, with `R` = the card's row count read off the delivered
card rather than hardcoded here (AUD step 5's rule, applied to an evaluation):
- **ICR** = ticked rows whose `ev:` path resolves to a file that exists ÷ R, computed by a script that
  reads the filesystem and never the transcript.
- **VCR** = rows the run's own report claims as done ÷ R.
- **Pass: |VCR − ICR| ≤ 0.10.** The reference figure this is aimed at is a measured gap of up to 100
  percentage points between stated and actual process compliance [EV-14].
- **Content sample:** in each run, **20 ticked cells** drawn at random (100 cells total) are handed to a
  worker that did not run the wish, with the row text and the file, and asked one question: does this
  file evidence this row — `yes | no | cannot tell`. Report the three counts. This is the only place the
  content question is asked at all, and it is a sample, not a gate.
- **Second sample, new this cycle, aimed at the residue §7 prices at "None":** in each run, every file in
  `spawns/` is checked against the run's own agent count and against `ext/` and `scorecards/`. A prompt
  file with no corresponding return anywhere in the run directory is *not* proof of a fake spawn, and the
  measurement is deliberately weak: report the count and the ratio, and treat a ratio far from 1 as a
  question for the next revision rather than as a detection. Nothing in the harness can settle it.

**Reading it.** ICR ≈ VCR with a low `yes` rate on the content sample is the bad case, and the
interesting one: the paths resolve and the files say nothing. That result would move E3's ordering.

---

## E3 — Deletion control

**status: NEVER RUN.** This is the evaluation that can only shrink this skill, which is why it is
written before any result exists to defend.

**Method.** One ablation per row of `SKILL.md` §7's kept-mechanisms table — **eleven rows, counted**. For
each, delete the mechanism (its card rows, its rules, its reference sections), run all three E1 briefs
under the reduced skill, and score with the same blind judges and the same frozen rubric.

**Decision rule, pre-registered:** a mechanism whose deletion costs less than **0.15** weighted points,
with a CI that includes 0, is **cut** at the next revision, not defended. The forced-cut ordering in the
cycle report is a guess at this ranking made without data; E3 replaces it.

**Ablations, in the order they will be run** (cheapest to delete first, so an early kill saves the rest):
spawn/engine preflight (0.8, 1A.7) · salvage wiring (2.6 → 3.3) · reception spans (3R.1) · refutation
panel (3.4-3.5) · identity audit (5.7) · both-order exit gate (4.1) · blind-pair calibration (2.3) ·
external-only revision (N1, A5) · angle tournament (2.1-2.7) · anchor with re-quote, property,
separation and challenge (1A.1-1A.4) · contract → frozen rubric (1.9-1.12, 1A.8).

**A sub-ablation inside the anchor row, added this cycle.** The anchor row is the one this revision spent
its clauses on, and ablating it whole answers "does anchoring help?", not "does anchor *strength* matter?"
— which is the question the property axis and the control axis were added to serve. So the anchor
ablation runs in four variants: full · minus the separation verdict (1A.3's control clause) · minus the
dimension mapping (1A.2's third clause) · minus the reject list (1A.1's third clause). Same cut rule.
**The result that would hurt most, named in advance:** the three reduced variants scoring inside 0.15 of
the full one. That would mean the two anchor clauses that pushed the peak load up — §0.6 owns both the
figure and the fraction — bought nothing measurable, and the honest response is to delete them rather than
re-argue them.

---

## E4 — Weakest-tier survival

**status: NEVER RUN.**

**Question.** Does the harness execute on the weakest model tier the host offers, or does it only read
well on the strongest? First-party guidance is to test on the weakest model you will run on [EV-3].

**Method.** All three E1 briefs, W arm only, on the weakest available tier. **3 runs.** Measure, per run:
rows ticked with resolving paths ÷ R; identities balancing ÷ 10; whether row 0.8's preflight was actually
executed; and where in the card the run first drifted — the phase at which a row was ticked without its
artifact.

**Pass:** ≥ 0.90 of rows carry resolving paths and ≥ 9 of 10 identities balance in all three runs.
**Expected failure mode, stated before the run:** the two phases `SKILL.md` §0.6 names as the peak-load
tie are where a weak tier should break first, and §0.6 states what fraction of the measured adherence
knee that peak is [EV-10]. If E4 fails at either, the fix is a smaller card, not a stronger claim — and
E3's four-variant anchor ablation is the ranking that decides which clauses go.

---

## §5 — What each result would change

| result | what changes in `SKILL.md` |
|---|---|
| E1 outcome 1 (no effect above +0.40) | `delta:` becomes a measured null; §7's kept table is re-opened against E3 and mechanisms are cut, not re-argued |
| E1 outcome 2 (inconclusive) | nothing changes except that the attempt is recorded; the header stays `UNMEASURED`. Registered as the most likely outcome |
| E1 outcome 3 (measured delta) | `delta:` carries n, judges, observed SD and the briefs — never a bare number |
| E1's M arm ≈ W arm | the run directory, the card and the identities are ceremony and should be cut; the prose is doing the work |
| E2 low `yes` rate on the content sample | ID1's limitation stops being a footnote: either a content check earns a row, or §7's claim narrows again |
| E2's `spawns/` ratio far from 1 | not a detection — a question. It would put a `spawns/` identity on the next revision's agenda against whatever it must displace |
| any E3 ablation inside 0.15 with a CI including 0 | that row leaves §7's kept table and its card rows are deleted |
| E3's anchor sub-ablations inside 0.15 | 1A.2's dimension clause and 1A.3's separation clause are deleted, and the peak drops by those two clauses — recompute it in §0.6 rather than quoting an earlier figure |
| E4 failure at a peak-load phase | the card is cut to fit the tier, using E3's ranking rather than the published guess |
