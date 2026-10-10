# nanika — install helpers
#
#   make link      symlink skills/nanika into every installed host's skills dir
#   make unlink    remove those symlinks
#   make status    show what is installed, per host
#   make check     verify the skill is self-contained and internally consistent
#   make test      run the fixture battery that checks `make check` still catches things
#   make pages     serve docs/ locally
#
# A host that is not installed is skipped and named — nothing creates a skills
# directory for a tool that is not on the machine. Narrowing is explicit:
#
#   make link AGENT=codex            # this host only
#   make link AGENT="claude agy"     # this subset
#   make link PROJECT=/path/to/repo  # that project's .claude/skills instead
#   make link SKILLS_DIR=/some/path  # one literal path; AGENT unused

NAME    := nanika
REPO    := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
SKILL   := $(REPO)/skills/$(NAME)
PAGES   := $(REPO)/docs
PAGES_PORT ?= 8000

AGENT   ?= claude codex agy
PROJECT ?=

CODEX_HOME ?= $(HOME)/.codex
AGY_HOME   ?= $(HOME)/.gemini/antigravity-cli

# Each entry is `guard|dir`: the directory whose existence means the host is on
# this machine, and the skills directory to link into. Judging presence by the
# host's own root rather than its skills dir keeps a first install working.
tgt_claude := $(HOME)/.claude|$(HOME)/.claude/skills
tgt_codex  := $(CODEX_HOME)|$(CODEX_HOME)/skills
tgt_agy    := $(AGY_HOME)|$(AGY_HOME)/skills

UNKNOWN := $(filter-out claude codex agy,$(AGENT))
ifneq ($(UNKNOWN),)
$(error unknown AGENT '$(UNKNOWN)' - use claude, codex or agy, or set SKILLS_DIR)
endif

ifneq ($(SKILLS_DIR),)
TARGETS := $(SKILLS_DIR)|$(SKILLS_DIR)
else ifneq ($(PROJECT),)
TARGETS := $(PROJECT)|$(PROJECT)/.claude/skills
else
TARGETS := $(sort $(foreach a,$(AGENT),$(tgt_$(a))))
endif
QTARGETS := $(foreach t,$(TARGETS),'$(t)')

DOCS := README.md skills/$(NAME)/*.md skills/$(NAME)/reference/*.md

.PHONY: help link unlink status check test pages

help: ## list targets
	@echo "nanika - skill install"
	@echo
	@grep -E '^[a-z-]+:.*## ' $(lastword $(MAKEFILE_LIST)) \
	  | awk -F':.*## ' '{printf "  %-8s %s\n", $$1, $$2}'
	@echo
	@echo "  skill:  $(SKILL)"
	@echo "  vars:   AGENT PROJECT SKILLS_DIR PAGES_PORT"

link: ## symlink the skill into every installed host's skills dir
	@n=0; \
	for t in $(QTARGETS); do \
	  guard=$${t%%|*}; dir=$${t##*|}; d="$$dir/$(NAME)"; \
	  if [ ! -d "$$guard" ]; then echo "skip     $$d - $$guard does not exist"; continue; fi; \
	  if [ -L "$$d" ]; then \
	    if [ "$$(readlink "$$d")" = "$(SKILL)" ]; then echo "ok       $$d already linked"; n=$$((n+1)); continue; fi; \
	    echo "refusing $$d is a symlink to $$(readlink "$$d") - resolve it, then re-run" >&2; exit 1; \
	  elif [ -e "$$d" ]; then \
	    echo "refusing $$d exists and is not a symlink - move it aside first" >&2; exit 1; \
	  fi; \
	  mkdir -p "$$dir" && ln -s "$(SKILL)" "$$d" || exit 1; \
	  echo "linked   $$d -> $(SKILL)"; n=$$((n+1)); \
	done; \
	if [ $$n -eq 0 ]; then echo "nothing linked - no skills directory found for: $(AGENT)" >&2; exit 1; fi; \
	echo "invoke it with:  nanika   (or /nanika in a slash-command harness)"

unlink: ## remove the symlinks this Makefile created
	@for t in $(QTARGETS); do \
	  dir=$${t##*|}; d="$$dir/$(NAME)"; \
	  if [ -L "$$d" ]; then \
	    if [ "$$(readlink "$$d")" = "$(SKILL)" ]; then rm -f "$$d"; echo "unlinked $$d"; \
	    else echo "left     $$d - points at $$(readlink "$$d"), not this repo"; fi; \
	  elif [ -e "$$d" ]; then echo "left     $$d - not a symlink"; \
	  else echo "absent   $$d"; fi; \
	done

status: ## show what is installed, per host
	@for t in $(QTARGETS); do \
	  guard=$${t%%|*}; dir=$${t##*|}; d="$$dir/$(NAME)"; \
	  if [ ! -d "$$guard" ]; then echo "skip     $$d - host not installed"; \
	  elif [ -L "$$d" ]; then echo "symlink  $$d -> $$(readlink "$$d")"; \
	  elif [ -d "$$d" ]; then echo "dir      $$d - not a symlink"; \
	  elif [ -e "$$d" ]; then echo "file     $$d - not a skill directory"; \
	  else echo "absent   $$d"; fi; \
	done

check: ## verify the skill is self-contained and internally consistent
	@cd "$(REPO)" || exit 1; fail=0; \
	misses=$$( \
	for f in $(DOCS); do \
	  grep -ohE '`(reference/[A-Za-z][A-Za-z0-9._-]*|README|MANIFEST)\.md`' "$$f" | tr -d '`' | sort -u | while read -r ref; do \
	    [ -f "$(SKILL)/$$ref" ] || [ -f "$$ref" ] \
	      || echo "MISS $$f cites $$ref, which does not exist"; \
	  done; \
	done); \
	if [ -n "$$misses" ]; then echo "$$misses" >&2; fail=1; fi; \
	for f in "$(SKILL)"/reference/*.md; do \
	  [ -e "$$f" ] || continue; b=$$(basename "$$f"); \
	  grep -q "$$b" "$(SKILL)/SKILL.md" || { echo "MISS reference/$$b exists but SKILL.md never names it" >&2; fail=1; }; \
	  head -10 "$$f" | grep -q '\*\*Read when:\*\*' || { echo "MISS reference/$$b has no **Read when:** header" >&2; fail=1; }; \
	done; \
	head -1 "$(SKILL)/SKILL.md" | grep -qx -- '---' || { echo "MISS SKILL.md does not open a frontmatter fence" >&2; fail=1; }; \
	sed -n '2,8p' "$(SKILL)/SKILL.md" | grep -q '^name: $(NAME)$$' || { echo "MISS SKILL.md frontmatter has no 'name: $(NAME)' line" >&2; fail=1; }; \
	d=$$(sed -n 's/^description: //p' "$(SKILL)/SKILL.md" | head -1 | wc -c); \
	[ "$$d" -le 400 ] || { echo "MISS description is $$d chars; listings truncate well before that" >&2; fail=1; }; \
	if grep -rlE '_quality/|_coding/|_planning/|registry/|refute\.py' "$(SKILL)" >&2; then \
	  echo "MISS the skill reaches outside itself - standalone does not hold" >&2; fail=1; fi; \
	if grep -rlniE '\bclaude code\b|\bcodex\b|\bagy\b|\bgemini\b' "$(SKILL)" | grep -v engine-map >&2; then \
	  echo "MISS a host-specific name escaped engine-map.md" >&2; fail=1; fi; \
	if grep -nE '`[^`]*\.\./' $(DOCS) >&2; then \
	  echo "MISS a cited path reaches through a parent directory" >&2; fail=1; fi; \
	n=$$(wc -l < "$(SKILL)/SKILL.md" | tr -d ' '); \
	[ "$$n" -lt 500 ] || { echo "MISS SKILL.md is $$n lines; keep the body under 500 and split into reference/" >&2; fail=1; }; \
	rows=$$(grep -cE '^\[ \] [0-9]' "$(SKILL)/SKILL.md"); \
	census=$$(sed -n 's/.*for \([0-9][0-9]*\) card rows.*/\1/p' "$(SKILL)/reference/identities.md" | head -1); \
	[ "$$rows" = "$$census" ] || { echo "MISS the card has $$rows rows but identities.md §0 counts '$$census'" >&2; fail=1; }; \
	for t in $$(grep -oE 'EV-[0-9]+[a-z]?' "$(SKILL)/SKILL.md" | sort -u); do \
	  grep -qE "^\| $$t \|" "$(SKILL)/reference/evidence.md" \
	    || { echo "MISS SKILL.md cites $$t, which evidence.md has no row for" >&2; fail=1; }; \
	done; \
	for f in "$(SKILL)"/reference/*.md; do \
	  [ -e "$$f" ] || continue; b=$$(basename "$$f"); \
	  head -10 "$$f" | grep -q '\*\*Owns:\*\*' || { echo "MISS reference/$$b has no **Owns:** header" >&2; fail=1; }; \
	  [ "$$(wc -l < "$$f")" -le 100 ] || head -20 "$$f" | grep -q '^Contents:' \
	    || { echo "MISS reference/$$b is over 100 lines with no Contents: line" >&2; fail=1; }; \
	  grep -qF "| \`$$b\` |" "$(SKILL)/MANIFEST.md" || { echo "MISS reference/$$b has no MANIFEST.md row" >&2; fail=1; }; \
	done; \
	for b in $$(sed -n 's/^| `\([A-Za-z0-9._-]*\.md\)` |.*/\1/p' "$(SKILL)/MANIFEST.md"); do \
	  [ -f "$(SKILL)/reference/$$b" ] || { echo "MISS MANIFEST.md lists $$b, which reference/ does not hold" >&2; fail=1; }; \
	done; \
	[ $$fail -eq 0 ] && { \
	  echo "check ok - $$(ls "$(SKILL)"/reference/*.md | wc -l | tr -d ' ') reference files, all cited and headed"; \
	  echo "           bare *.md citations are run-directory artifacts and are not checked here"; }; \
	exit $$fail

test: ## run the fixture battery that checks `make check` still catches things
	@sh "$(REPO)/tools/check.sh"

pages: ## serve docs/ locally
	@echo "serving $(PAGES) at http://localhost:$(PAGES_PORT)/"
	@cd "$(PAGES)" && python3 -m http.server $(PAGES_PORT)
