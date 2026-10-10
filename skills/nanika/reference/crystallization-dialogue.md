# crystallization-dialogue.md — how to ask

**Owns:** question craft, answer processing, the Assumption Ledger, checkpoint presentation, and
engagement calibration. **How to ask — never what to ask.** Every question P1 must land is a card row
(1.1-1.7), and the card owns them. Rule numbers D1, D11 and D14 were retired; the gaps are intentional.
**Read when:** **P1**, in full, at its `READ:` line.

The deliverable of a wish is only as good as the elicitation that produced it. A one-shot artifact built on
a misheard intent is the most expensive failure available here — every downstream mechanism will faithfully
maximize the wrong thing.

This protocol governs the **orchestrator's own conversation with the user**. It is not a spawn-prompt
directive: spawned workers produce material, and the orchestrator alone runs the dialogue. P1 spawns
nothing.

---

## 1. Question craft (D2-D5)

| # | Rule | Discipline |
|---|------|-----------|
| D2 | **Recognition over recall, on distinct options** | Present candidate answers to react to ("Is it A, B, or something else?") instead of blank open questions ("What are your requirements?"). Users correct a concrete guess far more reliably than they generate from nothing. Options must be genuinely distinct — different trade-offs, not paraphrases — each with a one-line trade-off, with a recommendation marked and its reason stated. Two to four for a discrete pick; a fifth means the framing is wrong. Free text for open steering. |
| D3 | **Concrete anchor** | Ground abstract questions in a scenario: "walk me through the last time X happened" beats "what do you need from X". When the user speaks abstractly, ask for one concrete instance before persisting the abstraction. |
| D4 | **Polarity discipline** | No leading questions where the row needs the user's *unprimed* reaction — rows 1.5 and 1.7 above all, where a leading question returns your own framing wearing the user's voice. Leading is *correct* when confirming a paraphrase ("so the job is X — right?"), which is D6's move, not this one. |
| D5 | **Tacit-knowledge probes** | The load-bearing knowledge is usually tacit, and no card row can ask for it directly. Elicit it with: **critical incident** ("when did something like this last fail, or land really well?"), **contrast** ("why this and not that?"), **boundary** ("when would this answer be wrong?"), **history** ("what was true when this was decided that isn't now?"). |

Row 1.5 is the row these four rules exist for. Its first answer is almost always the inverse of the goal
("it doesn't work") and carries no information; the useful answers are the second and third, and they
arrive only under D3 and D5.

## 2. Answer processing (D6-D8)

| # | Rule | Discipline |
|---|------|-----------|
| D6 | **Paraphrase-back before persist** | Before writing any user decision into `contract.md`, reflect it back in one or two lines in *different words* than the user used — echoing verbatim tests nothing. Persist on the confirmed paraphrase. A2 governs what may persist: a minimal permitted quote, or an explicitly user-approved redaction/summary. Mark the form; an unapproved paraphrase is not elicitation evidence. |
| D7 | **One follow-up, then park** | A low-information answer ("sounds fine", "whatever works") gets exactly ONE concretizing follow-up in D2 or D3 form. A point that circles two rounds with no new information gets named as circling, and the user is offered the same two ways out. Either way, do not badger: lock the leading option, or record it as an `ASSUME-n` row (D9) and move on. |
| D8 | **Contradiction surfacing** | When a new answer conflicts with an earlier persisted decision, surface it immediately ("this changes the non-goal you gave earlier from X to Y — intentional?"). Never silently overwrite; never silently keep the old one. The resolution is itself a persisted decision: it replaces the old value in `contract.md` in D6's form, noting the superseded value. |

## 3. Assumption Ledger (D9)

Every gap the user did **not** explicitly decide — an unasked question, a D7 vague answer, a default chosen
to keep moving, a delegated decision — gets a row carried in the draft contract. Row 1.8 is what makes the
Ledger mandatory; this rule is its schema and lifecycle.

| # | Rule | Discipline |
|---|------|-----------|
| D9 | **Every gap is a row; its evidence form follows A2** | `Utterance` holds a permitted quote, an approved summary/redaction explicitly labelled, or `withheld` when retention was declined. Empty means unasked, never privacy-withheld. Classify approved summaries as ratified, not verbatim elicitation. |

```
| ID | Assumption | Default chosen | Utterance (A2-approved form, withheld, or empty) | Why | Status |
|----|-----------|----------------|--------------------------------|-----|--------|
| ASSUME-1 | "flagship" means the investor audience, not the public site | investor framing | "" | audience question never asked | open |
| ASSUME-2 | success is measured at the partner meeting, not at publication | partner meeting | "honestly, whatever they react to" | D7 follow-up returned no more | open |
```

- **Checkpoint:** a turn that presents the draft (D10, D12) for confirmation. There are at least three:
  after rows 1.1-1.7 are asked; the **final contract checkpoint** at row 1.8, before 1.9 writes
  `contract.md`; and the **rubric checkpoint** after row 1.10, which presents the dimensions and weights.
- **Lifecycle:** `open` → `confirmed` (ratified at a checkpoint) or `open` → `parked` (moved to
  `contract.md`'s `## Open Questions` section at the final contract checkpoint). An `open` row never
  silently disappears.
- **Checkpoint duty:** every checkpoint shows the count of open rows and lists the *new* ones since the
  last checkpoint.
- **Final-checkpoint duty:** walk every `open` row; each becomes `confirmed` or `parked`. At the rubric
  checkpoint each dimension is ratified or recorded as an `ASSUME-n`. 1A.5's Provenance Gate
  (`benchmark-anchoring.md` §5) reads `confirmed` as `ratified` and `parked` as `parked`; a contract
  element or dimension with no quote and no row is `silent`, and a row still `open` at 1A.5 is
  unclassified and fails the gate.

## 4. Checkpoint presentation (D10, D12)

| # | Rule | Discipline |
|---|------|-----------|
| D10 | **Envelope + delta-only** | A checkpoint fits about fifteen lines. On iteration, present the **delta**, never re-dump the artifact — the full state lives in the draft the user can open. An unreadable checkpoint produces a rubber-stamp confirm, which is worse than no checkpoint, because it looks like consent. |
| D12 | **Orientation line** | Every checkpoint opens with one line of state: current phase · decisions locked (count) · open assumptions (count). The user steering a long dialogue must never have to ask "where are we?". |

## 5. Engagement calibration (D13, D15)

| # | Rule | Discipline |
|---|------|-----------|
| D13 | **Depth follows signal** | Rich, detailed answers → deepen: more D5 probes, finer options. Terse answers trending shorter → compress: batch questions to A6's limit, propose defaults, lean on the Ledger. Matching the user's bandwidth is part of the contract, not a courtesy. |
| D15 | **Delegate mode** | When the user says "just decide", switch to propose-and-confirm: make the call, record it as `ASSUME-n (delegated)` with an empty `Utterance`, continue. Checkpoints still fire — they present the delegated decisions for ratification instead of asking the original questions. Delegation compresses the dialogue; it never deletes the checkpoints, and it never converts an unasked row into an answered one. |

Row 1.8 is the reason D15 cannot be a shortcut: nothing on the card distinguishes a delegated `ASSUME-n`
from a question never asked except the row itself, which is why rows 1.2-1.7 say *asked*.
