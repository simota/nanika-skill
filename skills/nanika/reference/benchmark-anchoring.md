# benchmark-anchoring.md — sourcing the ceiling

**Owns:** the P1A sweep — what an anchor is, the locator and verbatim-span protocol, the named property,
the control, the reject list; **the four verdicts of row 1A.3** (re-quote, property, separation,
challenge) and the exact schemas the 1A.3 checker returns; row 1A.4's disposition; and the **Provenance
Gate** behind row 1A.5.
**Read when:** **P1A**, in full — the one `READ:` line that names this file. §3 is additionally attached
to row 1A.3's spawn as that worker's brief, which is what N6's "exact output schema" field resolves to for
that spawn.

Contents: §1 what an anchor is and what each row must carry (B1-B7) · §2 the anchor record on disk ·
**§3 the 1A.3 checker: four verdicts, four schemas (B8-B11)** · §4 disposition at 1A.4 (B12) ·
§5 the Provenance Gate (B13).

A ceiling defined only by the system that must reach it can be satisfied by mediocrity. This phase finds what
excellent looks like for this class of artifact, writes the score-3 descriptors from what it found, and hands
the whole thing to a worker that did not run the sweep.

---

## §1 — What an anchor is, and what each row must carry

**B1 — An exemplar calibrates the bar; it is not a reproduction target.** Its locator in `anchors.md` shows that a
score-3 artifact exists. Do not copy it: row 4.1 asks whether ours *wins* on each property, not whether it
resembles the exemplar.

**B2 — Every row carries a locator someone else can open**: a `file:line` the run can read, or a URL. Not a title,
a description or "the well-known X". Reject locators are held to the same standard, because ID3(e) opens them.

**B3 — Every row carries the verbatim span at that locator**, copied, not recalled: long enough to contain the
property and no longer. A tidied, elided, translated or reflowed span is a mismatch at B8.

**B4 — Every row names its property and the dimension that property anchors.** "It's beautiful" anchors nothing;
"every state change is acknowledged within 100ms and never with a spinner" anchors a dimension. One property
anchors at most one dimension unless the header declares `shared-property(n)`.

**B5 — The control is ordinary, not absurd: the same class of artifact doing the same job**, competently and
unremarkably. An absurd control inflates every exemplar-control gap and still passes 2.3's threshold, which is
what `non-comparable` (B10) catches. Its locator and span follow B2 and B3.

**B6 — Every named property carries a reject list**: each rejected candidate with its own locator and one line on
why it lost *on that property*. Row 1A.1 owns the minimum count and `unchallenged`.

**B7 — Record each locator's trust tier** (`evidence.md` rules, T1-T4) beside it. A T1 source is checked against
the artifact rather than its self-description; a T4 source is a lead, never an anchor on its own.

## §2 — The anchor record on disk

`anchors.md` holds one row per locator, and that row count is what ID3(a) compares `requote.md` against.
Keep the reject lists in their own block below the locator table so the locator count stays a row count.

```
## Locators
| # | role | locator | verbatim span | named property | dimension anchored | control # | tier |
|---|------|---------|---------------|----------------|--------------------|-----------|------|
| 1 | exemplar | <file:line or URL> | "<span>" | <property> | <dimension> | 2 | T1 |
| 2 | control  | <file:line or URL> | "<span>" | —          | —           | —   | T3 |

## Reject lists
### property: <named property>
| candidate locator | why it lost on this property |
|---|---|
```

A control row ordinarily names no property of its own — the property it is opened at is the exemplar's, and
B10 is where that happens — which is why ID3(b) reads an unnamed control as `not-assessed`. Where a sweep
does name one for a control, it is filled in and assessed like any other.

## §3 — The 1A.3 checker: four verdicts, four schemas

Row 1A.3 is an `ext` cell. The worker did not run the sweep, receives this section and `anchors.md`, and
writes `requote.md`. It returns four kinds of record, in this order, and A5 states plainly which of them
are mechanical and which are judgments.

**B8 — Verdict one, the re-quote: open every locator yourself and report what you read.** One line per
locator, in a `## Locators` block that comes first in `requote.md` so its line count is the number ID3(a)
compares against `anchors.md`. The verdict is `exact-match | mismatch | unreachable`, and **the line
carries what the checker read**, not the span it was handed — the two strings sit side by side in the
report, which is what makes a paste-back visible. A locator the checker cannot open is `unreachable`; it is
never `mismatch`, and it is never quietly dropped, because ID3(a) counts the lines.

```
<locator> | requote: exact-match | read: "<what was actually at that locator>" | property: <B9's verdict> | clause: "<B9's clause>"
```

**B9 — Verdict two, the property: name the clause of the span that carries it.** `property-present |
property-absent | not-assessed`, on the same line as B8's verdict so the file stays one line per locator.
A control locator is `not-assessed` unless the sweep named a property for it; an exemplar is `not-assessed`
only when its locator came back `unreachable`. **This verdict is a judgment**, so it is never returned as a
bare word: the line quotes the clause of what it read that carries the property, and a verdict with no
clause is not a verdict. `property-present` on a span whose quoted clause does not contain the property is
the finding, not the pass.

**B10 — Verdict three, the separation: open the control at the exemplar's property.** *Per named property,
not per locator.* The checker opens the locator of **the control `anchors.md` pairs with that property's
exemplar** and returns one of three, naming the clause
it read in each case:

| verdict | what it means | what the checker names |
|---|---|---|
| `separating` | the property is absent from the control, or materially weaker there | the control clause it read, and why that clause is weaker |
| `non-separating` | the control has the property too, so **the property cannot distinguish a 3 from a 1** | the control clause that carries it |
| `non-comparable` | the control is **not the same class of artifact doing the same job**, so the comparison decides nothing | the clause or feature that puts it in a different class |

A trivial property named off an excellent document passes B8, B9 and B11 honestly; what it cannot do is be
absent from the control. Like B9 this is a judgment, so it names the clause, never a bare word.

```
SEPARATION:
  property: "<the named property, copied from anchors.md>"
  control_locator: "<the control's locator>"
  control_clause: "<the clause read in the control, verbatim>"
  verdict: separating | non-separating | non-comparable
```

One record per named property. A named property with no separation record is an imbalance at ID3(b), not
an omission the report can absorb.

**B11 — Verdict four, the challenge: find something better, or say where you looked.** Per exemplar,
either the locator and verbatim span of an artifact exhibiting that property *more strongly*, or
`none-better-found` **naming where it searched**. A bare `none-better-found` with no search record is
cheap, and the report shows it as what it is.

```
CHALLENGE:
  exemplar_locator: "<from anchors.md>"
  result: none-better-found | stronger-candidate
  searched: "<the sources, queries or corpora opened — required when result is none-better-found>"
  candidate_locator: "<required when result is stronger-candidate>"
  candidate_span: "<verbatim, required when result is stronger-candidate>"
```

With no checker available, no record in this section is written: 1A.3 carries `not-run` with its reason,
and the header states the weaker claim rather than the missing one.

## §4 — Disposition at row 1A.4

**B12 — Every verdict is acted on before the freeze, and the fallback is stated either way.** Row 1A.4
owns the requirement; this rule owns the table it applies.

| what 1A.3 returned | what happens to that descriptor |
|---|---|
| `exact-match` ∧ `property-present` ∧ `separating` | it may stand as a **score-3 descriptor**. Nothing else may |
| `mismatch` | struck; reverted to invented-and-flagged |
| `property-absent` | struck; reverted to invented-and-flagged |
| `non-separating` | struck; the property cannot separate a 3 from a 1, so it cannot carry a 3 |
| `non-comparable` | struck; the control decided nothing, so the gap under it is unmeasured |
| `unreachable` | reverted to unreachable-and-flagged; it no longer counts as anchored, so the header cannot read `sourced` — ID3(c) computes `mixed(a/d)`, or `unanchored` when nothing is left anchored |
| 1A.3 `not-run` | every descriptor stays as 1A.2 wrote it and counts `invented-and-flagged` for ID3(c); 1A.4 is ticked with that statement and the fallback line; header `anchoring: unverified` |
| `stronger-candidate` | re-anchor — rows 1A.1-1A.2 re-run on the stronger artifact and 1A.3 once on the new locators, whose lines replace the old ones in `requote.md` while both returns stay in `ext/1A.3.md`; a second `stronger-candidate` for the same exemplar is `out-anchored` — or declare `out-anchored`, which `SKILL.md` §3 makes ACCEPT-unreachable |

A struck descriptor is reverted, never reworded to survive (N4).

**The no-exemplar fallback.** For a genuinely novel class no exemplar exists. That is a legitimate outcome
and a weaker claim, and row 1A.4 requires the run to state which way it went. When it fires: say so at the
P1A checkpoint; fall back to invented anchors with a two-directional sanity check — that an artifact
meeting the descriptor could exist, *and* that a competent-but-ordinary artifact would not meet it, since
an anchor nothing reaches and an anchor everything reaches fail identically; construct the control by
deliberately degrading the invented anchor so calibration still has two points; and flag the fallback in
the report, where `invented-fallback` is its own header state.

## §5 — The Provenance Gate

**B13 — Before the rubric freezes, every load-bearing contract element is classified.** Each acceptance
criterion, each disappointment criterion, each rubric dimension, each named recipient, each scope boundary:

| class | meaning |
|-------|---------|
| `elicited` | traceable to a permitted explicit user quote in `contract.md`; approved summaries/redactions are `ratified` (A2) |
| `ratified` | started as an `ASSUME-n` row and was ratified at a checkpoint |
| `parked` | recorded in Open Questions, and shipping as a known gap |
| `silent` | none of the above — the dialogue never touched it |

Row 1A.5 owns the arithmetic this feeds, and ID2 recomputes it. A `silent` element routes back to one
targeted question — `crystallization-dialogue.md` owns how to ask it — or to an explicit `ASSUME-n` row, and
the gate re-runs. The stakes are specific to wish: a `silent` rubric dimension means the ceiling was set by
the system, for the system, on an axis the user never endorsed, and every mechanism after the freeze will
maximize it faithfully.

Its weakness: the classifier is the agent that wrote the contract (`evidence.md` §4).
