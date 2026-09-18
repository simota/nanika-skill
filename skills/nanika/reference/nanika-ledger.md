# nanika-ledger.md — the scarcity record

**Owns:** where the usage history lives, its schema, the counting rule, and the outcome backfill.
**Read when:** **P0** — the only phase whose `READ:` line names this file. Row 5.5 appends one entry at P5 from §LG2's schema.

A wish is scarce only if something counts it. Without a ledger, "once-in-a-lifetime" is a tone of voice.

**What the gate then says out loud is the card's, not this file's.** Rows 0.2, 0.3, 0.5 and 0.6 each own
one line of that surfacing, and until this cycle a list here restated all four in different words — the
duplication this file was carrying, now deleted rather than reworded.

---

## LG1 — Location

`.nanika/ledger.md`, in the repository or project directory the wish is being spent on. Create it on first
use. It is a plain Markdown file with one YAML block per entry under a `## Entries` heading, and it is
distinct from `.nanika/runs/<slug>/`, which holds one run; the ledger holds all of them.

A2 governs retention and sharing. Keep the ledger private and untracked by default; commit only an approved
sanitized record. A local history still makes usage visible to its user; publication is not required.

## LG2 — Schema

One block per wish, appended at row 5.5. Where a field's vocabulary is owned elsewhere, the field takes
that vocabulary verbatim rather than a copy of it kept here — a ledger that carries a stale exit word
records a run that did not happen.

```yaml
- wish: 3                      # sequence number; LG3 owns how it is derived
  date: 2026-08-21
  intent: "<A2-approved minimal intent; omit sensitive detail>"
  deliverable: <row 0.4's deliverable class>
  scope: <row 0.4's scope class>
  mode: <the report header's `mode:` field, verbatim>
  exit_reason: <the verdict from SKILL.md §3's exit table, verbatim — that table owns the vocabulary>
  dims_at_ceiling: "4/5"       # dimensions that reached 3 / the frozen dimension count
  comparative: <row 4.1's per-pairing verdicts, `inconsistent` included>
  engines: <the report header's `engines:` field, verbatim>
  budget: <the report header's `spend:` field, verbatim>
  override: false              # true when row 0.7 journaled an override
  outcome: pending             # pending | satisfied | partial | regretted | unknown — LG4 owns this field
```

## LG3 — Counting rule

P0 **counts entries**; it does not parse prose. `wish: N` is the sequence number and the next entry is
`N+1`. A file with no `## Entries` section counts as zero, and so does a missing file — both are a first
wish, and neither is an error to report.

A block that is present but unreadable is not counted and is named to the user as unreadable. Repairing it
is the user's call, not the gate's.

## LG4 — Outcome backfill

`outcome` is written `pending` at row 5.5 and backfilled **lazily**, at the *next* nanika's P0, with one
question — asked in these words, which row 0.3 quotes:

> "Did wish #N-1 (<date>, '<intent>') satisfy its disappointment criteria?"

One line, one answer, then the gate proceeds. This is retrospective self-report, not a causal diagnosis of crystallization or an objective quality score.
Repeated regret may justify asking what changed, never inferring why on the user's behalf.

A user who declines to answer gets `outcome: unknown` — never a guessed one, and never a value inferred
from that run's `exit_reason`. A run can exit `ACCEPT` and still be regretted; that divergence is the only
thing this field measures.

## LG5 — What the ledger is not

It is not a permission system. A user who wants to spend wish #12 this month spends it; row 0.5 prices the
cheaper path, row 0.7 records the override, and the run proceeds. The ledger's job is to make the spend
*visible*, not to ration it — a gate that refuses becomes a gate people route around, and a routed-around
gate counts nothing.

It is also not evidence of quality. Nothing in an entry was verified by a non-participant; every field is
copied from a report the run wrote about itself. `outcome`, backfilled by the user at LG4, is the only
field in this file that came from outside the run.
