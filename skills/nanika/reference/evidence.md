# evidence.md

**Owns:** every literature figure this skill relies on — the claim, the effect size, **the scope it was
measured in**, the source, the retrieval date and the trust tier. **Read when:** never during a run. Read
when a figure is questioned, or before any figure is added to `SKILL.md`.

Contents: rules of this file · §1 figures cited inline in `SKILL.md` · §2 relied on, cited nowhere ·
§3 abandoned mechanisms, and what would bring each back.

Rules of this file. The first is `SKILL.md` A4 applied to the figures rather than restated: A4 owns the
wording, this file owns the register.
1. A figure is defined **here** and used at **most once** in `SKILL.md`, tagged `[EV-n]`; every other
   mention is the bare tag. The **use-site column below is the index**, and it is checkable by grep from
   either end — a wrong entry there is this file lying about the document it indexes. `make check`
   verifies that every `[EV-n]` tag in `SKILL.md` has a row here.
2. **A figure never travels without its scope.** "70% → 15%" is a math-grading result; used for prose
   grading it is a borrowing, and the borrowing is what must be written down, not the number alone. Where
   a source reports two figures for two settings, the use-site carries the one that applies **and** names
   the other, rather than quoting the larger and correcting it here — EV-19 is the row that shows how.
3. Trust tiers: **T1** first-party authoritative · **T2** first-party intent · **T3** third-party
   authoritative · **T4** community. All rows retrieved **2026-08-22**.
4. Numbering follows the external sweep's row numbers, so any row here can be traced back to the row of
   the sweep that produced it. EV-16 carries two distinct figures from one source and is split **16a** /
   **16b** so they stop sharing an identifier.

---

## §1 — Figures cited inline in `SKILL.md`

Each of these appears at exactly one use-site in the skill. The use-site is named so the pair can be
checked by grep from either end.

| tag | claim, with its effect size | **scope it was measured in** | source | tier | use-site |
|---|---|---|---|---|---|
| EV-10 | Top reasoning models hold near-perfect adherence into the low hundreds and then decay (threshold decay); best model (gemini-2.5-pro) 68.9% at 500 instructions, o3(high) 62.8%; primacy bias peaks at mid-range densities and fades at 300+ | IFScale: 20 models, 7 providers, **atomic keyword instructions**, 10→500. **Not** multi-clause procedural steps — the use-site states the unit mismatch and no longer computes an execution-capacity ratio | https://arxiv.org/html/2507.11538v1 | T3 | `SKILL.md` §0 item 6 |
| EV-12 | Failures on lengthened simple tasks are execution, not reasoning; an agent's own past errors in context raise its future error rate, and model scale does not fix it (thinking mitigates it) | Long-horizon execution benchmark; plan and knowledge given explicitly, so the failure is isolated to execution | https://arxiv.org/abs/2509.09677 | T3 | `SKILL.md` N2 (the P3 block carries the bare tag) |
| EV-14 | Instruction Compliance Rate 0% under default conditions while models verbally agreed (Claude Sonnet 4: 10/10 agreed, 10/10 bypassed) — a gap up to 100 percentage points; nine blinded human raters (Fleiss κ 0.130) correctly identified 0 of 15 compliant sessions. Instruction content explains 35.8% of compliance variance vs 8.9% for position (η²) | 6 frontier models, 2,031 sessions, 13 experiments; **stated-vs-actual process compliance**, not self-audit vs external audit — the P5 use of it is an analogy and is phrased as description | https://arxiv.org/pdf/2605.01771 | T3 | `SKILL.md` §0 item 3 (P5 block and §7 carry the bare tag) |
| EV-16a | Reference-guided grading cut judge failure from 70% to 15% (−55pp) — the largest single effect in this file | **Math grading with a reference answer** — GPT-4 judge, 20 judgments (14/20 → 3/20). No one has measured it for rubric grading of prose; the skill states the borrowing at the use-site. | https://ar5iv.labs.arxiv.org/html/2306.05685 | T3 | `SKILL.md` §7 kept table (N6 carries the bare tag) |
| EV-16b | Position-swap consistency: Claude-v1 23.8%, GPT-3.5 46.2%, GPT-4 65.0% — a single-pass pairwise verdict is partly a verdict about position | MT-Bench pairwise judging, stress test of two similar GPT-3.5 answers per first-turn question, default prompt; 23.8% is the **floor** of the range and is named as a floor | https://ar5iv.labs.arxiv.org/html/2306.05685 | T3 | `SKILL.md` P4 block (§7 and `evaluations.md` E1 carry the bare tag) |
| EV-17 | Self-preference is causally tied to self-recognition: GPT-4 recognises its own text 73.5% of the time; fine-tuning recognition upward raises self-preference linearly | News-summarisation judging (CNN/DailyMail, XSUM), single-model self-evaluation. Used here as the **contradiction** to A5's asserted half, not as support for it | https://ar5iv.labs.arxiv.org/html/2404.13076 | T3 | `SKILL.md` A5 |
| EV-19 | Showing or falsifying an author label swings **preference** votes up to 50pp, and **pointwise** ratings up to 12pp | 3 evaluator models, judging with and without author labels. P2's judging is pointwise, so 12pp is the applicable figure — **both numbers are at the use-site**, with which one applies stated there, because this file is never read during a run | https://arxiv.org/html/2508.21164v1 | T3 | `SKILL.md` §7 kept table |
| EV-20 | Intrinsic self-correction without external feedback **degrades** performance on every benchmark tested | Reasoning benchmarks, no external validator. The converse — that a fresh-context instance of the same model supplies the missing signal — is **not** in this row and is not measured anywhere in this file | https://arxiv.org/abs/2310.01798 | T3 | `SKILL.md` A5 — **N1, §3's degraded-mode block and §7 all carry the bare tag** |
| EV-21 | Multi-agent debate does not reliably beat CoT or self-consistency at matched or greater compute; model heterogeneity is "a universal antidote" | 5 MAD methods × 9 benchmarks × 4 models. Claim confirmed; **numbers unconfirmed-lead** | https://arxiv.org/abs/2502.08788 | T3 | `SKILL.md` §7 contradicted-classes |
| EV-22 | Isolated self-correction beats unguided homogeneous debate (Qwen2.5-7B: GSM-Hard 61.0% vs 58.8%, the 61.0 not re-verified; MMLU-Hard 66.7% vs 60.7%) at 2.1-3.4× the tokens; sycophantic conformity (modal adoption up to 85.5%); consensus voting discards correct answers already in the pool — an "oracle gap" up to 32.3pp | Teams of 10 homogeneous 7-8B models (Qwen2.5-7B, Llama-3.1-8B, Ministral-3-8B), 3 rounds, GSM-Hard/MMLU-Hard — verifiable answers; not significant for every model. The oracle-gap claim is why P2 refuses majority aggregation; it is **not** evidence about prose quality | https://arxiv.org/html/2605.00914v1 | T3 | `SKILL.md` **card row 2.7** (§7 contradicted-classes carries the bare tag), so the refusal sits on the row that enforces it |
| EV-23 | Self-consistency over sampled chains: +17.9pp GSM8K, +11.0 SVAMP, +12.2 AQuA, +6.4 StrategyQA, +3.9 ARC-c over CoT | **Majority vote** over sampled reasoning chains, verifiable answers. Rows 2.7 and 3.6 keep the best-scoring artifact instead of voting, so the skill states that this support does not transfer | https://arxiv.org/abs/2203.11171 | T3 | `SKILL.md` §7 kept table |
| EV-24 | Checklist feedback beats scalar reward models for instruction following (RLCF: +5.4% rel. FollowBench hard-satisfaction, +6.9% rel. InFoBench, +6.4% rel. Arena-Hard) | **Training-time** evidence on instruction-following benchmarks — not inference-time rubric use. Numbers **unconfirmed-lead** (abstract-level; PDF unreadable at retrieval), which is why the skill imports the direction and no number | https://arxiv.org/abs/2507.18624 | T3 | `SKILL.md` §7 kept table |

---

## §2 — Relied on, cited nowhere in `SKILL.md`

These shaped the design and are **not** quoted in the skill. Listing them here is the difference between
an influence and a citation.

| tag | claim | scope | source | tier |
|---|---|---|---|---|
| EV-1 | Skill body under 500 lines; split beyond; references exactly one level deep; TOC for reference files >100 lines | Authoring guidance, **asserted, no measurement** | https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices | T1 |
| EV-2 | For complex workflows, provide a checklist the agent copies into its response and ticks; validator loop with "only proceed when validation passes" | Same doc; asserted | same | T1 |
| EV-3 | Build ≥3 evaluations **before** writing the prose; test with every model you plan to use it with (Haiku, Sonnet and Opus named) | Same doc; asserted. E4 exists because of this row and cites it there | same | T1 |
| EV-4 | Recall degrades as context grows; finite "attention budget"; sub-agents should return 1,000-2,000-token summaries | Anthropic context engineering; property + guidance | https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents | T1 |
| EV-5 | Agent Skills are three-level progressive disclosure (metadata → SKILL.md → bundled files) | Asserted as "the core design principle" | https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills | T1/T2 |
| EV-6 | Open skill spec: folder + SKILL.md, minimum frontmatter `name`+`description`, host-agnostic across ~45 clients | Specification, not a measurement. The reason this skill names a **capability** and not a tool | https://agentskills.io/ | T1 |
| EV-8 | AGENTS.md: no required fields; the agent runs the listed checks and fixes failures before finishing | Convention, >60,000 repos; no effect size | https://agents.md/ | T1 |
| EV-9 | Remove redundant and contradictory lines; add a persistence clause; tag distinct behaviour blocks | Prompting guidance; asserted | https://developers.openai.com/cookbook/examples/gpt-5/gpt-5-1_prompting_guide | T1 |
| EV-11 | Multi-turn execution loses ~39% vs the same work single-turn; the loss is mostly unreliability, with a minor aptitude loss | 15 models, 200,000+ simulated conversations, 6 generation tasks | https://arxiv.org/abs/2505.06120 | T3 |
| EV-13 | Context rot: performance varies with input length even on simple tasks; coherent haystacks scored worse than shuffled | 18 models across 4 families | https://www.trychroma.com/research/context-rot | T3 |
| EV-15 | Attention is U-shaped over position; starts and ends win, middles lose | Long-context retrieval | https://arxiv.org/html/2406.16008v1 | T3 |
| EV-18 | A panel of smaller judges from **disjoint families** beats one large judge (κ 0.763 vs 0.627 NQ; Pearson 0.917 vs 0.817 Arena-Hard) at ~1/7 the cost; the authors credit reduced intra-model bias to disjoint families (the Pearson pair not re-verified) | QA and Arena-Hard judging. Cited nowhere because this skill cannot promise disjoint families on one host — the honest version of that is row 1A.7's preflight | https://arxiv.org/html/2404.18796v1 | T3 |
| EV-25 | Multi-agent (lead + subagents) beat single-agent by 90.2% on an internal research eval; multi-agent used ~15× the tokens of a chat (single agents ~4×); explicitly **not** recommended where agents share context or have heavy dependencies | Breadth-first research search. A tournament over one artifact is closer to the excluded case, which is why the figure is not quoted in support of this design | https://www.anthropic.com/engineering/multi-agent-research-system | T2 |
| EV-26 | Skill-delta harness: with-skill vs without-skill in an isolated sandbox; +41 correctness, +39 effectiveness across 300+ skills, two harnesses | Vendor-reported, 300+ verified skills covering 30+ NVIDIA products, **not this skill**. E1 is modelled on the method; the numbers are not this document's and are quoted nowhere in it | https://developer.nvidia.com/blog/evaluating-ai-agent-skill-performance-with-nvidia-skillevaluator/ | T2 |
| EV-27 | Skill-blind A/B: same task twice, only the skill version changes; deterministic transcript process-checks alongside a judge that never learns the version | Community harness; E2's ICR script is this idea | https://www.stackhawk.com/blog/eval-harness-agent-skills/ | T4 |
| EV-28 | Agentic rubrics as contextual verifiers: an agent explores the repo and writes a rubric; candidate patches are scored against it without running tests; ≥+3.5pp over the strongest baseline on SWE-Bench Verified best-of-K | Code-patch selection (SWE-Bench Verified); abstract-level | https://arxiv.org/abs/2601.04171 | T3 |
| EV-29 | Scaling judge-time compute with modular reasoning units reaches parity with far larger fine-tuned judges | Claim confirmed, **numbers unconfirmed** | https://arxiv.org/abs/2502.18018 | T3 |
| EV-30 | Description engineering of tool specs is among the most effective ways to improve tool use | Asserted guidance, no measurement; confirmed at the canonical post. Not used to justify anything | https://www.anthropic.com/engineering/writing-tools-for-agents | T2 |

**Two gaps this file names rather than papering over.** First: no measured study was found isolating
*point-of-use placement of a constraint* against *up-front declaration*. EV-14 is the closest proxy and it
measures architectural layer, not step-locality. The card's design — the prohibition welded to the row it
governs — rests on that unmeasured belief, and E3's ablations are the only thing that would test it.
Second: **nothing here measures whether an anchor's *strength* changes the artifact.**
Every figure above concerns judging, adherence or self-correction. The property axis and the control axis
added at 1A.2 and 1A.3 rest on a design argument alone, which is why E3 gained four anchor sub-variants
instead of a citation.

---

## §3 — Abandoned mechanisms, and what would bring each back

| abandoned | why it went | what would bring it back |
|---|---|---|
| One-Shot Gate | asked an agent whether a redo it will never perform would be better — a counterfactual with no evidence available to the asker | a measured way to ask the counterfactual: E1's N arm run *after* a W run on the same brief, scored blind. If N-after-W beats W, the gate had something to check |
| Dual-lineage carry | one sentence, no merge criterion, no schema, no evaluator; the most expensive escalation in the document | a written merge criterion and a `PAIRWISE_VERDICT`-style schema, plus an E3 ablation showing rows 3.6 + 4.1 leave a gap it would fill |
| Cross-engine as a *mechanism* | on a single-host run it resolved to a sentence in the report | a host where 1A.7's preflight returns two reachable engines, plus EV-18's disjoint-family result reproduced on prose rubric grading rather than QA |
| Majority-vote aggregation at P2 | discards correct answers already in the pool [EV-22] | a measurement of the oracle gap for **prose** candidate selection showing it smaller than the variance best-of-n reduces |
| Multi-agent debate | contradicted at matched compute [EV-21]; conformity rises per round [EV-22] | a debate variant with independent, non-interacting rounds measured against the current single-round panel — which is what the panel already is; a *discussion* variant does not come back |
| Near-ceiling pre-mortem | duplicated the panel's Omission and Durability angles at the same trigger | an E3 ablation showing the panel misses a class the pre-mortem caught |
| Failure-modes table (24 rows) | every mitigation was a pointer to a section above it | nothing; the phase blocks now state each failure at its point of use. If E4 shows drift at a specific phase, that phase's block gets the row, not a table |
| Per-host model-name table | model names age faster than anything else in the document | nothing. Role names in `engine-map.md` are the portable form |
| Run-level `Done when` | seven clauses, each already a P5 card row | nothing; it restated rows in different words, the same delete-test duplication `run-discipline.md` §1 condition 8 lints for in a run's contract |
| Standalone rows 2.4 (inflation re-prompt) and 3.3 (score cites an observation), in an earlier revision's numbering | each was one clause with no artifact of its own; folded into 2.3 and 3.2, which already produce files | an E2 content sample showing the folded clause is dropped more often than the standalone row was — a measurable claim, and currently an assumption |
| Standalone row 4.3 (bonus-cycle cap), folded into 4.2 | one clause, no artifact of its own; 4.2 is where the bonus is spent, so the cap sits on the row that spends it | the same E2 evidence as the row above: a folded clause dropped more often than the standalone row it replaced |
| The `spawns/` clauses on card rows 2.2 and 2.4 | they bound two spawn kinds and left the rest to §0 prose; **N6** binds every spawn in one clause | nothing as a card row. What *would* change the design is a `spawns/` identity — and there is no cheap one, because no identity can distinguish a written prompt from an issued one. E2's second sample measures the ratio without claiming to settle it |
| A fourth `ext` cell for the challenge, and a second opinion on the property verdict | both cost a spawn the envelope prices, a card row, and an ID8 arithmetic change; neither fixes the fact that a same-model judgment stays a same-model judgment [EV-17] | a host with a reachable second engine at 1A.7, so the challenge and the property verdict can come from a different family — the only version of this that is not more of the same |
