# engine-map.md — the host seam

**Owns:** the mapping from the frontmatter's `metadata.requires-capability: spawn-independent-worker` to the host's
actual tool; the two preflight commands — **§2a** for card row 0.8, **§2b** for card row 1A.7; the role
names every spawn is authored in; and how roles are spread across engines.
**This is the only file in the skill where a host-specific name may appear.** A host tool, binary, flag or
model string anywhere else is a portability defect, and the claim "porting nanika is an edit to one file" is
false the moment one leaks.
**Read when:** **P0**, for §2a — and **P1A**, for §2b. Those are the two `READ:` lines that name this file
and the two loads `SKILL.md` §8 counts. §3 and §4 are consulted while writing a spawn at P2, P3, P3R and
P4; that is the same file already open, not a third load.

Contents: §0 capability → tool · §1 why engine diversity is worth its cost · **§2a spawn preflight
(row 0.8)** · **§2b engine reachability preflight (row 1A.7)** · §3 role names · §4 distributing the roles
· §5 when one engine is all there is.

---

## §0 — Capability → tool

**M1 — One capability name, one mapping, one file.** The skill's frontmatter declares what it needs by
capability (`spawn-independent-worker`), never by tool; `allowed-tools` is a host pre-approval hint, not a declaration. The table below is the only place that capability
becomes a name a host recognises. To port nanika to a host that is not listed: add one row here, add one row
to §2a and one to §2b, and make sure the host lets those rows run — pre-approved or approvable — without
widening what a worker may do. Change nothing else. A host that is *not* in these tables is not improvised at 0.8 — the run either gets a row first, or
0.8 records the failure and `SKILL.md` §3's degraded-mode block binds.

| Host | `spawn-independent-worker` resolves to | Collecting the return |
|------|----------------------------------------|-----------------------|
| **Claude Code** | the `Agent` tool with a named `subagent_type` — never `fork`, which inherits the whole conversation and is not a separate context. Interactive sessions may run every subagent in the background; under `claude -p` a spawn is foreground unless backgrounded | the return, or for a background worker the completion notification in a later turn — read the worker's file only after it arrives. A background worker's permission prompts surface in the main session; to avoid them, pre-approve the path with an `Edit(//<abs>/.nanika/**)` allow rule (path rules written as `Write(...)` are not consulted) |
| **Codex CLI** | the `spawn_agent` **tool** — a model tool call, not a shell command. Default multi-agent: `{message}`, returns an agent id; it starts a fresh context unless `fork_context: true`, which nanika never sets. `multi_agent_v2`: `{message, task_name, fork_turns: "none"}` — `message` and `task_name` are required, `task_name` takes only `[a-z0-9_]`, and `fork_turns` defaults to `all`, which copies the parent conversation and is not a separate context; returns the task name. v2 rejects unknown fields and the default tools ignore them, so use the schema the session's tool actually exposes | the `wait_agent` tool. Default: `{targets: [<id>], timeout_ms}`, then `close_agent({target: <id>})` — completed agents count toward the default limit of six until closed. `multi_agent_v2`: `{timeout_ms}` only, defaulting to 30 s and at most the configured maximum; it returns no content, so have the worker write its result to a file |
| **agy** | `agy -p "<prompt>"`, headless — a separate CLI process rather than an in-session worker, so 0.8 on agy tests a CLI launch. **Not author-verified:** flags and paths here come from third-party documentation | stdout has been reported unreliable; have the prompt write its result to an absolute path and read the file |

**Never grant a worker blanket permission.** Workers read untrusted material — web pages, candidates,
exemplars — so a worker spawned with permission checks disabled (`--dangerously-skip-permissions`, `--yolo`,
`--dangerously-bypass-approvals-and-sandbox`) is a prompt-injection path to the host's shell. Pre-approve only
writes under `<abs>/.nanika/`, or run the whole session in a disposable container and say so in `gate.md`.

Here the worker capability means a *separate context*, not demonstrated independent judgment or a separate turn. A second reply in the same context
is the configuration N1 forbids, whatever the host calls it.

## §1 — Why engine diversity is worth its cost

Three prompts to one model produce three framings of one set of priors. Independence at the **priors**
level is what makes a tournament worth its cost: the same model asked for a different angle brings the same
blind spots, the same aesthetic defaults, the same idea of what "good" looks like.

Engine diversity is an amplifier, not the mechanism — card row 2.1's angle diversity is the load-bearing
half, and §2b's preflight is what keeps the amplifier from being a sentence in the report. If only one
engine is reachable the run still proceeds; §5 says on what terms.

## §2a — Spawn preflight, for card row 0.8

**M2 — The preflight is a command that ran, not a description of one.** Run the row for this host verbatim
at row 0.8, after row 0.7's approval. Append the literal command and its exit
status to `.nanika/runs/<slug>/gate.md`; that file is row 0.8's `ev:`. **Exit 0 sets `mode: full`; any
non-zero exit sets `mode: single-agent(declared)`**, and from there `SKILL.md` §3's degraded-mode block —
not this file and not your judgment — says what the run costs. Never infer the result from the fact that a
spawn tool is listed above: a listed tool the host will not run — disabled, denied or unapprovable — fails
here, which is exactly what the row exists to detect.

Every row spawns one throwaway worker whose whole job is to write one known string to one known path, so the check has a file on disk. That file alone is not authenticated execution: the orchestrator could write it.
Use native process/dispatch receipts when supplied by the platform; otherwise report the narrower record-present claim (A5).

**Claude Code**

```
rm -f <abs>/.nanika/runs/<slug>/preflight.txt                       # shell, first
```
then (it may run in the background; its permission prompt then appears in the main session):
```
Agent(
  subagent_type: "general-purpose",
  description: "spawn preflight",
  prompt: "Write the single line PREFLIGHT-OK to <abs>/.nanika/runs/<slug>/preflight.txt using the Write tool.
           Then reply with exactly PREFLIGHT-OK and nothing else. Do nothing else at all."
)
```
then, only after the worker's return or completion notification has arrived, turn it into an exit status:
```
tr -d '\r' < <abs>/.nanika/runs/<slug>/preflight.txt | grep -qxE '[[:space:]]*PREFLIGHT-OK[[:space:]]*'; echo "0.8 spawn preflight exit=$?" >> <abs>/.nanika/runs/<slug>/gate.md
```

**Codex CLI**

```
rm -f <abs>/.nanika/runs/<slug>/preflight.txt                       # shell
# default multi-agent tools:
spawn_agent({message: "Write the single line PREFLIGHT-OK to <abs>/.nanika/runs/<slug>/preflight.txt, then return exactly PREFLIGHT-OK."})
                                                                    # tool call → <id>
wait_agent({targets: ["<id>"], timeout_ms: 300000})                 # tool call
close_agent({target: "<id>"})                                       # tool call; frees the slot
# multi_agent_v2 tools, instead of the three calls above:
spawn_agent({message: "<the same message>", task_name: "nanika_preflight", fork_turns: "none"})   # → task name
wait_agent({timeout_ms: 300000})                                    # repeat while timed_out is true
tr -d '\r' < <abs>/.nanika/runs/<slug>/preflight.txt | grep -qxE '[[:space:]]*PREFLIGHT-OK[[:space:]]*'; echo "0.8 spawn preflight exit=$?" >> <abs>/.nanika/runs/<slug>/gate.md
```

Which pair to call is read off the `spawn_agent` schema the session exposes, not chosen: a `task_name`
parameter means `multi_agent_v2`. The default pair on v2 fails on the missing `task_name`; the v2 pair on the
default tools spawns a stray worker and then `wait_agent({...})` fails for want of `targets`. Either is a
mis-called preflight to close out and re-run, not a spawn failure. A v2 session configured without
`wait_agent` waits by re-checking the file instead. A worker that inherits a read-only sandbox cannot write the file; that is a real failure of this run's
ability to spawn a worker that writes, and it is recorded as one.

**agy**

```
rm -f <abs>/.nanika/runs/<slug>/preflight.txt
agy -p "Write the single line PREFLIGHT-OK to <abs>/.nanika/runs/<slug>/preflight.txt. Reply with exactly PREFLIGHT-OK." </dev/null >/dev/null 2>&1
tr -d '\r' < <abs>/.nanika/runs/<slug>/preflight.txt | grep -qxE '[[:space:]]*PREFLIGHT-OK[[:space:]]*'; echo "0.8 spawn preflight exit=$?" >> <abs>/.nanika/runs/<slug>/gate.md
```

The write needs permission for that path. Grant it narrowly in agy's own settings; never with the
skip-permissions flag (§0).

The `grep` is doing the work in all three rows: a worker that ran and wrote nothing, a worker that was
never dispatched, and a host that refused the tool are indistinguishable from the orchestrator's side and
all three land as a non-zero exit. It tolerates a CR and surrounding whitespace, nothing else. Every row
deletes `preflight.txt` first, because a stale file passes a preflight nothing performed.

## §2b — Engine reachability preflight, for card row 1A.7

**M3 — One command per extra engine, run at P1A, before P2 plans around it.** Same form as §2a and the
same discipline: the command and its exit status are appended to `.nanika/runs/<slug>/engines.md`, which is
row 1A.7's `ev:`, and `SKILL.md` §0.3 lists it. It is a separate file from `gate.md` on purpose, so a P1A
result never overwrites a P0 one. An engine whose command exits
non-zero is **struck from the plan at P1A**, not carried to P2 and discovered there. With every extra
engine struck, the run is a monoculture and the report header says so (`monoculture(declared)`).

"Extra engine" means an engine other than the one the orchestrator is running on. The orchestrator's own
engine is proven by §2a and is not re-tested here.

```
R=<abs>/.nanika/runs/<slug>
ok() { tr -d '\r' < "$1" | grep -qxE '[[:space:]]*ENGINE-OK[[:space:]]*'; }

# Codex CLI as an extra engine. Outside a git repository it needs --skip-git-repo-check; stdin is closed
# because a non-terminal stdin is read to EOF; -o keeps only the final message, not the logs.
rm -f "$R/engine-codex.txt"
codex exec --skip-git-repo-check -o "$R/engine-codex.txt" "Reply with exactly ENGINE-OK." </dev/null >/dev/null 2>"$R/engine-codex.err"
ok "$R/engine-codex.txt"; echo "1A.7 codex exit=$?" >> "$R/engines.md"

# agy as an extra engine (not author-verified; §0). Reply-only, so it needs no permission flag.
rm -f "$R/engine-agy.txt"
agy -p "Reply with exactly ENGINE-OK." </dev/null > "$R/engine-agy.txt" 2>"$R/engine-agy.err"
ok "$R/engine-agy.txt"; echo "1A.7 agy exit=$?" >> "$R/engines.md"

# Claude Code as an extra engine, from a non-Claude host. Reply-only; no permission flag.
rm -f "$R/engine-claude.txt"
claude -p "Reply with exactly ENGINE-OK." </dev/null > "$R/engine-claude.txt" 2>"$R/engine-claude.err"
ok "$R/engine-claude.txt"; echo "1A.7 claude exit=$?" >> "$R/engines.md"
```

From inside a sandboxed host, an outbound engine CLI may be denied network or home-directory writes. Record
that denial as what it is — `sandbox denied`, next to the exit status, citing the `.err` file that shows it — not as the engine being absent; the
engine is struck either way, and the report says which.

A run planning no extra engines writes row 1A.7 `not-run: capability absent(extra engine)` and runs no
command. That is a legal state, not a failure, and it is the state `monoculture(declared)` reports.

## §3 — Role names

**M4 — Author every spawn in a role name; never in a model name.** The three roles are `high-reasoning`,
`balanced` and `fast`. A spawn prompt, a card row and a report line name a role; binding a role to a model
is the host operator's act, done in this file or not at all.

**This file is the only place a model name may appear, and it deliberately carries none.** A host operator who wants the
binding written down adds it here, under this rule, and nowhere else.

Where the run spends the high tier: the steps whose output *is* the judgment — crystallization, the anchor
disposition at 1A.4, tournament adjudication, ceiling convergence scoring, and both P4 gate verdicts.
Everything else runs balanced. Reasoning-effort defaults differ per host and are worth setting
deliberately rather than inheriting; varying effort *within* one cached conversation can drop the prompt
cache, so vary it across spawns instead.

## §4 — Distributing the roles — guidance, not a numbered rule

**Tournament candidates (P2).** At most one candidate per **(engine, angle)** pair. With three engines and
four angles, prefer four candidates on distinct pairs over four candidates on one engine.

```
candidate 1: engine A × angle "Conventional, executed perfectly"
candidate 2: engine B × angle "The unconventional read"
candidate 3: engine C × angle "Recipient-optimized"
candidate 4: engine A × angle "Against the exemplar"      ← distinct pair, allowed
```

**Judges (P2) and skeptics (P3).** Spread them across engines where §2b left more than one standing. A
judge should not be the engine that produced a candidate it scores where the roster allows that
separation; where it cannot, note it. Monoculture in the skeptic panel is the quietest failure available
here — the panel agrees, the ratification passes, and the blind spot ships.

**Every spawn's contents are N6's**, including the prompt file under `spawns/`; this file says which engine
receives the spawn, never what the spawn contains.

## §5 — When one engine is all there is — guidance, not a numbered rule

Keep the mechanism and lower the claim. Angle diversity (row 2.1) is unaffected by having one engine;
blind judging (row 2.4) is unaffected, although provenance stripping does not guarantee removal of order or self-recognition effects. Different engines need not imply different models, priors or evidence; and the run says so: the header prints
`monoculture(declared)`, and N5 forbids presenting a same-model run as engine-diverse.

With no engine diversity, the sourced anchor is the only opinion in the run that did not come from this
model — which is why P1A's verification, not P2's spread, is where a single-engine run's honesty is
actually decided.
