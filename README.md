# nanika

```
run report ─────────────────────────────────────────────── —

  anchoring   · · · · · · · · · · · · · · · · · · · · · ·  —
  evaluators  · · · · · · · · · · · · · · · · · · · · · ·  —
  reception   · · · · · · · · · · · · · · · · · · · · · ·  —
  identity    · · · · · · · · · · · · · · · · · · · · · ·  —
  delta       · · · · · · · · · · · · · · · · · · ·  UNMEASURED
  exit        · · · · · · · · · · · · · · · · · · · · · ·  —

  No run has produced this report. The four evaluations that would
  fill the delta ship with `status: NEVER RUN`.
```

**This is the first thing to weigh, and it is not a disclaimer — it is the state of the thing.**

---

> ### A mechanism that leaves no artifact *did not happen*.

`nanika` is a self-contained agent skill: a scarcity-gated, one-shot quality harness for any deliverable — code, document, design, or plan. It does not know how to write your thing. It attempts additional search and scrutiny; no measured nanika quality gain is established.

*Named for the thing in the story that grants any wish, absolutely, and then counts what it cost.*

---

## Why it exists

**Agents say they ran the gate. Then they don't.**

Records make the process inspectable, but their existence does not establish their truth. Every ticked row cites a file, and the run closes on arithmetic that has to resolve: rows ticked against artifacts present, salvage raised against salvage disposed, personas returned against personas valid.

**An imbalance calls for investigation; balanced records do not certify artifact quality or genuine execution.**

`ten accounting identities · worked examples · not a semantic or authenticity proof`

## What changes

"Do your best" gives you one attempt, graded by whoever wrote it, against a bar they invented.

| instead of | what happens |
|---|---|
| one attempt, iterated | **A tournament.** Independent candidates on genuinely different bets, judged blind, with the losers' best ideas carried into the winner under a disposition that must balance. |
| a bar the system invented | **A sourced benchmark.** Every top descriptor cites a real artifact, a named property, a verbatim span at a locator. A worker who did not choose it re-quotes the span, checks the control does *not* share the property, and is asked to beat it. It tests the selected comparison, not a global ceiling. |
| everyone scores well | **Blind-pair calibration.** Each scorer grades an unlabelled, shuffled known-good and known-ordinary pair before it sees your work. The key is held elsewhere; no scorer reports a verdict about itself. It screens gross grading failures; passing one pair does not prove a reliable grader. |
| grading its own homework | **A closing audit by a worker that did not run it**, recomputing every identity from the files on disk. |
| "nothing was left on the table" | **A list of what was left.** Angles not run, salvage rejected, trade-offs taken, escalations the budget did not buy. |

## The price

It counts what it cost. Computed per run, never quoted from a brochure:

```
agents = 1 preflight + S sweep × (1 + re-anchors) + (1 + re-anchors) checkers + E extra engines
       + C angles + J judges (≥ 3) + 1 outline build (outline only)
       + (N+1) × (1 revision + D evaluators + K skeptics)
       + P personas × reception passes + 4 pairwise × P4 passes + D re-score + 1 audit
       + replacements, void re-runs, wrapped-domain work and retries
```

For example, scope M (N = 3 cycles), S = 3, no extra engines, C = 4, J = 3, D = 4, K = 3 and P = 3 gives **64 agents** with the bonus cycle, its second reception pass and the advisory P4 — more if 3R.3 re-enters — before replacements, void re-runs, wrapped work and retries; yours is computed at row 0.6, and no point estimate authorizes an overrun. Approval is required before launching. Recompute after the rubric settles; ask again only outside the approved ceiling or when scope/data/retention permissions change. Invocation alone is not spend consent.

Before any of that, a gate counts how often you have spent one of these, shows how the last ones turned out, and tells you when what you are asking for is ordinary work that does not need it.

## Install

```bash
make link      # symlink into every installed host's skills dir
make unlink    # remove those symlinks
make status    # what is installed, per host
make check     # verify the skill is self-contained
make test      # assert that make check still catches things
```

A host you do not have is skipped and named — nothing creates a skills directory for a tool that is not on the machine. Narrowing is explicit:

```bash
make link AGENT=codex            # this host only
make link AGENT="claude agy"     # this subset
make link PROJECT=/path/to/repo  # that project's .claude/skills
make link SKILLS_DIR=/some/path  # one literal path
```

Codex is linked into `~/.agents/skills`, the location current Codex reads; an older link under `$CODEX_HOME/skills` still loads but is deprecated there. agy's skills directory is not confirmed by first-party documentation — override it with `AGY_SKILLS_DIR=` if yours differs.

`link` never removes anything. It refuses a path that already exists and is not its own symlink, and tells you which — a directory you made by hand is never cleared to make room.

It needs a filesystem it may write to and the ability to spawn an independent worker. Without a writable filesystem it cannot run at all; without a spawnable worker it degrades to `single-agent(declared)`, fourteen rows go `not-run`, and the top exit becomes unreachable — stated, not hidden.

## Usage

```
/nanika "the investor update that decides whether we raise"
/nanika "the migration guide our whole user base will read once"
/nanika "the API surface we cannot change after launch"
```

## Is it worth it

**Not demonstrated. The evaluation that would settle it is written and unrun.**

`E3` is a deletion control: strip a mechanism, see whether quality drops. Until it runs, every argument here is a mechanism that sounds plausible, and plausible mechanisms are cheap.

**Price is not evidence.** Expensive implies expensive.

The ways this can be faked from the inside are named in the skill itself, each paired with the trace that would catch it. Two of those traces read *none*. That section exists so the claim can be checked instead of trusted.

If the full harness is more than your task needs, four parts change the **work** rather than the **record**, and they cost far fewer agents — two of them none:

- ask what outcome would make you regret the request — then push past the first answer
- ask what changes if it lands
- generate competing bets instead of one attempt, and keep the losers
- never let whoever wrote something be the one who grades it

## What is inside

```
Makefile
README.md
docs/index.html                       the page at the project site
tools/check.sh                        the fixture battery behind `make test`
skills/nanika/
  SKILL.md                            57-row card and 14 rule addresses; referenced tables also bind
  MANIFEST.md                         reference ownership, not an execution-capacity estimate
  reference/
    identities.md                     the ten that must balance, with worked examples
    evaluations.md                    E1-E4, all NEVER RUN, including the deletion control
    evidence.md                       every figure, with its source and the scope it was measured in
    evaluator-loop.md                 the 0-3 scale and the three output schemas
    evaluator-roster.md               evaluator archetypes and reception personas
    benchmark-anchoring.md            sourcing the ceiling, and the Provenance Gate
    crystallization-dialogue.md       how to ask — never what to ask; the card owns that
    refutation-panel.md               the gauntlet, single-round and non-interacting
    run-discipline.md                 contract lint, decision ledger, completion integrity
    doc-deliverables.md               when the deliverable is a document
    engine-map.md                     the only file allowed to name a host
    nanika-ledger.md                  the scarcity record, and what it is not evidence of
```

## The ledger

`nanika` keeps an A2-approved private, untracked `.nanika/ledger.md` in the project you spend it on: one entry per wish, with how it exited and — backfilled at the *next* one — whether it actually satisfied you.

Raw quotes, prompts and losing candidates are not automatically safe to retain or commit. A2 controls their disclosure and retention.

It informs; it never refuses. A gate that refuses is a gate people route around.

It is **not evidence of quality**. Every field is copied from a report the run wrote about itself. `outcome`, which you fill in later, is the only one that came from outside the run.

## Design notes

**A ceiling you did not invent.** A system that defines excellence and then grades itself against that definition will find it has achieved excellence. So every top descriptor cites an artifact that exists, and a worker who did not choose the anchor re-quotes its span, verifies the control does not share the property, and is asked to find something better.

**Honesty about the residual.** The most useful section of a report is the one listing what was *not* done. "Nothing was left on the table" is unfalsifiable. "Here is exactly what was left" is a claim you can check.
