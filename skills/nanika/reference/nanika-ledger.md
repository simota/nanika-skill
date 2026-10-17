# nanika-ledger.md — the scarcity record

**Owns:** where the usage history lives, its schema, the counting rule, and the outcome backfill.
**Read when:** **P0**, for rows 0.2-0.3. Row 5.5 appends one entry at P5 (a 1A.6 decline appends at the decline)
from LG2's schema.

A wish is scarce only if something counts it. Without a ledger, "once-in-a-lifetime" is a tone of voice.

---

## LG1 — Location

`.nanika/ledger.md`, in the repository or project directory the wish is being spent on. Create it on first use.
One YAML block per entry under a `## Entries` heading. It is distinct from `.nanika/runs/<slug>/`, which holds
one run. A2 governs retention and sharing: keep it private and untracked by default; commit only an approved
sanitized record.

## LG2 — Schema

One block per wish, appended at row 5.5 and copied verbatim to `.nanika/runs/<slug>/ledger-entry.md`, which is
5.5's `ev:` because ID1 resolves only paths inside the run directory. For a run declined at 1A.6, the entry is
written at the decline, with `mode` from row 0.8, `dims_at_ceiling`, `outcome_measured`, `comparative`, `engines`,
`verify_by` and `ask_after` as `n/a`, `budget` as the agents spent so far, and `outcome: unknown`, which LG4 never asks about.
Where a field's vocabulary is owned elsewhere, the field takes it verbatim.

```yaml
- wish: 3                      # sequence number; LG3 owns how it is derived
  date: 2026-08-21
  intent: "<A2-approved minimal intent; omit sensitive detail>"
  deliverable: <row 0.4's deliverable class>
  scope: <row 0.4's scope class>
  mode: <the report header's `mode:` field, verbatim>
  exit_reason: <SKILL.md §3's exit table, verbatim; `none(declined 1A.6)` for a run declined there>
  dims_at_ceiling: "4/5"       # dims at 3 on the gated artifact (row 3.6) / the frozen dimension count
  outcome_measured: <the report header's `outcome:` field, verbatim>
  comparative: <the report header's `exit gate:` field, verbatim>
  engines: <the report header's `engines:` field, verbatim>
  budget: <the report header's `spend:` field, verbatim>
  override: false              # true when row 0.7 journaled an override
  verify_by: "<what would show the deliverable worked in use: the OUTCOME command on the shipped artifact;
              for a design or plan, 'built, and <criterion> held'; for a document, '<recipient> did <decision>'>"
  ask_after: <a date, or an event such as "after the design is built">   # the user's choice at 5.5
  outcome: pending             # pending | satisfied | partial | regretted | unknown — LG4 owns this field
```

## LG3 — Counting rule

P0 **counts entries**; it does not parse prose. The next wish number is the highest readable `wish:` value + 1;
an unreadable block's number is not reused. A missing file, or one with no `## Entries` section, counts as zero:
a first wish. A block that is present but unreadable is not counted and is named to the user; repairing it is
the user's call.

## LG4 — Outcome backfill

`outcome` is written `pending` at row 5.5. Row 0.3 asks about **every** `pending` entry whose `ask_after` has
passed (an event counts as passed when the user says so), not only the last one, in these words:

> "Wish #N (<date>, '<intent>') said it would be shown to work by: <verify_by>. Did that happen, and did it avoid
> the disappointments you named — satisfied, partial, or regretted?"

One answer per entry, then the gate proceeds. **Reachable with a single wish:** the delivery message at 5.5 ends
with this question and says it can be answered now, or later by invoking nanika only to record an outcome, which
runs rows 0.2-0.3, spends nothing and closes. Where `verify_by` is a command, re-running it is the first thing to
offer before asking.

This is retrospective self-report, not a causal diagnosis or an objective quality score. A user who declines gets
`outcome: unknown`, never a guessed value and never one inferred from `exit_reason`. A run can exit `ACCEPT` and
still be regretted; that divergence is what this field measures.

## LG5 — What the ledger is not

It is not a permission system. A user who wants to spend wish #12 this month spends it; row 0.5 prices the cheaper
path, row 0.7 records the override. A gate that refuses gets routed around, and a routed-around gate counts nothing.

It is not evidence of quality. Every field but `outcome` is copied from a report the run wrote about itself.
