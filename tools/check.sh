#!/bin/sh
# Fixture battery for `make check`.
#
# `make check` is what backs this skill's self-containment claim, so the check
# itself needs a check: each case below mutates a throwaway copy of the tree and
# asserts the exit status. An edit to the check recipe that stops catching
# something fails here instead of passing quietly.
#
#   sh tools/check.sh
#
# Cases are named for what they inject. `want=ok` means the tree is clean and the
# check must pass; `want=fail` means the injected fault must be caught.

set -u

SRC=$(cd "$(dirname "$0")/.." && pwd)
SKILL=skills/nanika
TMP=$(mktemp -d "${TMPDIR:-/tmp}/nanika-check.XXXXXX") || exit 1
trap 'rm -rf "$TMP"' EXIT

pass=0
fail=0

# copy_ <name> — a throwaway copy of the tree, printed as a path.
copy_() {
	d=$TMP/$(printf '%s' "$1" | tr -c 'a-zA-Z0-9' '_')
	rm -rf "$d"
	mkdir -p "$d/skills" || exit 1
	cp "$SRC/Makefile" "$SRC/README.md" "$d/" || exit 1
	cp -R "$SRC/$SKILL" "$d/skills/" || exit 1
	printf '%s' "$d"
}

# case_ <want> <name> <dir> — run make check in <dir>, assert the exit status.
case_() {
	want=$1 name=$2 dir=$3
	if make -s -C "$dir" check >/dev/null 2>&1; then got=ok; else got=fail; fi
	if [ "$got" = "$want" ]; then
		pass=$((pass + 1)); printf '  ok    %-42s (want=%s)\n' "$name" "$want"
	else
		fail=$((fail + 1)); printf '  FAIL  %-42s (want=%s got=%s)\n' "$name" "$want" "$got"
	fi
}

echo "check.sh — asserting that make check catches what it claims to"
echo

d=$(copy_ clean)
case_ ok "an unmodified tree passes" "$d"

d=$(copy_ orphan-reference)
echo '# orphan' > "$d/$SKILL/reference/nobody-names-me.md"
case_ fail "a reference file SKILL.md never names" "$d"

d=$(copy_ missing-read-when)
sed -i.bak '/\*\*Read when:\*\*/d' "$d/$SKILL/reference/identities.md"
case_ fail "a reference file with no Read when: header" "$d"

d=$(copy_ dangling-citation)
printf '\nSee `reference/does-not-exist.md`.\n' >> "$d/$SKILL/SKILL.md"
case_ fail "a citation of a reference file that is absent" "$d"

d=$(copy_ broken-fence)
sed -i.bak '1s/^---$/-/' "$d/$SKILL/SKILL.md"
case_ fail "frontmatter that does not open with a fence" "$d"

d=$(copy_ wrong-name)
sed -i.bak 's/^name: nanika$/name: something-else/' "$d/$SKILL/SKILL.md"
case_ fail "frontmatter whose name is not the skill" "$d"

d=$(copy_ long-description)
awk 'NR==3 && /^description:/ { printf "description: \"%s\"\n", sprintf("%*s", 500, "") ; next } { print }' \
	"$d/$SKILL/SKILL.md" > "$d/tmp.md" && mv "$d/tmp.md" "$d/$SKILL/SKILL.md"
case_ fail "a description longer than a listing shows" "$d"

d=$(copy_ external-dependency)
printf '\nDefer to `_quality/CONTRACT.md` for the floor.\n' >> "$d/$SKILL/reference/run-discipline.md"
case_ fail "a reach outside the skill directory" "$d"

d=$(copy_ host-name-leak)
printf '\nSpawn it with the Claude Code Agent tool.\n' >> "$d/$SKILL/reference/evaluator-loop.md"
case_ fail "a host-specific name outside engine-map.md" "$d"

d=$(copy_ parent-traversal)
printf '\nSee `../elsewhere/thing.md`.\n' >> "$d/README.md"
case_ fail "a cited path reaching through a parent" "$d"

d=$(copy_ long-skill)
awk 'BEGIN { for (i = 0; i < 500; i++) print "" }' >> "$d/$SKILL/SKILL.md"
case_ fail "a SKILL.md body of 500 lines or more" "$d"

d=$(copy_ census-drift)
printf '\n[ ] 5.8 a row the census never counted\n' >> "$d/$SKILL/SKILL.md"
case_ fail "a card row the identities census misses" "$d"

d=$(copy_ unknown-evidence)
printf '\nA figure nobody registered [EV-99].\n' >> "$d/$SKILL/SKILL.md"
case_ fail "an [EV-n] tag with no evidence.md row" "$d"

d=$(copy_ missing-owns)
sed -i.bak '/\*\*Owns:\*\*/d' "$d/$SKILL/reference/nanika-ledger.md"
case_ fail "a reference file with no Owns: header" "$d"

d=$(copy_ missing-contents)
sed -i.bak '/^Contents:/d' "$d/$SKILL/reference/evaluations.md"
case_ fail "a long reference file with no Contents:" "$d"

d=$(copy_ manifest-missing-row)
sed -i.bak '/^| `identities\.md` |/d' "$d/$SKILL/MANIFEST.md"
case_ fail "a reference file MANIFEST.md never lists" "$d"

d=$(copy_ manifest-stale-row)
printf '| `gone.md` | nothing |\n' >> "$d/$SKILL/MANIFEST.md"
case_ fail "a MANIFEST.md row for an absent file" "$d"

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ] || exit 1
