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
# check must pass; `want=fail` means the injected fault must be caught, and caught
# by the check named in the case's expected message — a fault that fails some
# other check would otherwise keep a deleted check looking alive.

set -u

SRC=$(cd "$(dirname "$0")/.." && pwd)
SKILL=skills/nanika
TMP=$(mktemp -d "${TMPDIR:-/tmp}/nanika-check.XXXXXX") || exit 1
trap 'rm -rf "$TMP"' EXIT
trap 'exit 130' INT TERM

pass=0
fail=0

# copy_ <name> — a throwaway copy of the tree, printed as a path. It runs inside
# $(...), so its exit leaves only the subshell; callers go through new_.
copy_() {
	d=$TMP/$(printf '%s' "$1" | tr -c 'a-zA-Z0-9' '_')
	rm -rf "$d"
	mkdir -p "$d/skills" "$d/docs" || exit 1
	cp "$SRC/Makefile" "$SRC/README.md" "$d/" || exit 1
	cp "$SRC/docs/index.html" "$d/docs/" || exit 1
	cp -R "$SRC/$SKILL" "$d/skills/" || exit 1
	printf '%s' "$d"
}

# new_ <name> — copy_, and stop the battery if the copy did not happen.
new_() {
	d=$(copy_ "$1")
	[ -n "$d" ] && [ -f "$d/Makefile" ] && [ -f "$d/$SKILL/SKILL.md" ] \
		|| { echo "check.sh: could not copy the tree for case '$1'" >&2; exit 1; }
}

# changed_ <file> — assert a mutation actually changed <file> against the source,
# so a sed that matched nothing cannot pass as a caught fault.
changed_() {
	rel=${1#"$d"/}
	if [ -f "$SRC/$rel" ] && cmp -s "$1" "$SRC/$rel"; then
		echo "check.sh: the mutation left $rel unchanged" >&2; exit 1
	fi
}

# case_ <want> <name> [<expected MISS substring>] — run make check in $d and
# assert the exit status and, for want=fail, which check fired.
case_() {
	want=$1 name=$2 expect=${3:-}
	out=$(make -s -C "$d" check 2>&1) && got=ok || got=fail
	why=
	if [ "$got" = fail ] && [ -n "$expect" ] && ! printf '%s\n' "$out" | grep -qF -- "$expect"; then
		got=wrong-reason; why=" expected: $expect"
	fi
	if [ "$got" = "$want" ]; then
		pass=$((pass + 1)); printf '  ok    %-46s (want=%s)\n' "$name" "$want"
	else
		fail=$((fail + 1)); printf '  FAIL  %-46s (want=%s got=%s)%s\n' "$name" "$want" "$got" "$why"
		printf '%s\n' "$out" | sed 's/^/          /'
	fi
}

echo "check.sh — asserting that make check catches what it claims to"
echo

new_ clean
case_ ok "an unmodified tree passes"

new_ env-agent
out=$(AGENT=foo make -s -C "$d" check 2>&1) && got=ok || got=fail
if [ "$got" = ok ]; then pass=$((pass + 1)); printf '  ok    %-46s (want=ok)\n' "an exported AGENT does not break check"
else fail=$((fail + 1)); printf '  FAIL  %-46s (want=ok got=fail)\n%s\n' "an exported AGENT does not break check" "$out"; fi

new_ orphan-reference
printf '# orphan\n\n**Owns:** nothing.\n**Read when:** never.\n' > "$d/$SKILL/reference/nobody-names-me.md"
printf '| `nobody-names-me.md` | nothing |\n' >> "$d/$SKILL/MANIFEST.md"
case_ fail "a reference file SKILL.md never names" "SKILL.md never names it"

new_ substring-name
printf '# loop\n\n**Owns:** nothing.\n**Read when:** never.\n' > "$d/$SKILL/reference/loop.md"
printf '| `loop.md` | nothing |\n' >> "$d/$SKILL/MANIFEST.md"
case_ fail "a name only matched inside a longer name" "loop.md exists but SKILL.md never names it"

new_ missing-read-when
sed -i.bak '/\*\*Read when:\*\*/d' "$d/$SKILL/reference/identities.md"; changed_ "$d/$SKILL/reference/identities.md"
case_ fail "a reference file with no Read when: header" "no **Read when:** header"

new_ dangling-citation
printf '\nSee `reference/does-not-exist.md`.\n' >> "$d/$SKILL/SKILL.md"
case_ fail "a citation of a reference file that is absent" "cites reference/does-not-exist.md"

new_ dangling-link
printf '\nSee [the map](reference/missing.md).\n' >> "$d/$SKILL/SKILL.md"
case_ fail "a Markdown link to an absent reference file" "cites reference/missing.md"

new_ broken-fence
sed -i.bak '1s/^---$/-/' "$d/$SKILL/SKILL.md"; changed_ "$d/$SKILL/SKILL.md"
case_ fail "frontmatter that does not open with a fence" "does not open a frontmatter fence"

new_ wrong-name
sed -i.bak 's/^name: nanika$/name: something-else/' "$d/$SKILL/SKILL.md"; changed_ "$d/$SKILL/SKILL.md"
case_ fail "frontmatter whose name is not the skill" "no 'name: nanika' line"

new_ name-outside-fence
sed -i.bak 's/^name: nanika$/name: something-else/' "$d/$SKILL/SKILL.md"; changed_ "$d/$SKILL/SKILL.md"
awk 'f == 0 && NR > 1 && /^---$/ { print; print "name: nanika"; f = 1; next } { print }' \
	"$d/$SKILL/SKILL.md" > "$d/tmp.md" && mv "$d/tmp.md" "$d/$SKILL/SKILL.md"
case_ fail "the right name only after the fence closes" "no 'name: nanika' line"

new_ long-description
awk 'NR==3 && /^description:/ { printf "description: \"%s\"\n", sprintf("%*s", 500, "") ; next } { print }' \
	"$d/$SKILL/SKILL.md" > "$d/tmp.md" && mv "$d/tmp.md" "$d/$SKILL/SKILL.md"; changed_ "$d/$SKILL/SKILL.md"
case_ fail "a description longer than a listing shows" "description is 500 chars"

new_ missing-description
sed -i.bak '/^description:/d' "$d/$SKILL/SKILL.md"; changed_ "$d/$SKILL/SKILL.md"
case_ fail "a frontmatter with no description" "no one-line description"

new_ folded-description
sed -i.bak 's/^description: .*/description: >/' "$d/$SKILL/SKILL.md"; changed_ "$d/$SKILL/SKILL.md"
case_ fail "a description the check cannot measure" "no one-line description"

new_ external-dependency
printf '\nDefer to `_quality/CONTRACT.md` for the floor.\n' >> "$d/$SKILL/reference/run-discipline.md"
case_ fail "a reach outside the skill directory" "reaches outside itself"

new_ host-name-leak
printf '\nSpawn it with the Claude Code Agent tool.\n' >> "$d/$SKILL/reference/evaluator-loop.md"
case_ fail "a host-specific name outside engine-map.md" "host-specific name"

new_ host-env-leak
printf '\nRead the skills under CODEX_HOME.\n' >> "$d/$SKILL/reference/evaluator-loop.md"
case_ fail "a host variable outside engine-map.md" "host-specific name"

new_ host-path-leak
printf '\nLink it into ~/.claude/skills.\n' >> "$d/$SKILL/reference/evaluator-loop.md"
case_ fail "a host path outside engine-map.md" "host-specific name"

new_ parent-traversal
printf '\nSee `../elsewhere/thing.md`.\n' >> "$d/README.md"
case_ fail "a cited path reaching through a parent" "through a parent directory"

new_ parent-link
printf '\nSee [elsewhere](../elsewhere/thing.md).\n' >> "$d/README.md"
case_ fail "a Markdown link reaching through a parent" "through a parent directory"

new_ ellipsis-is-not-a-parent
printf '\nRun `make` from the root, not ../ anything; `a/.../b` is a path.\n' >> "$d/README.md"
case_ ok "prose ../ and an ellipsis in a path pass"

new_ long-skill
awk 'BEGIN { for (i = 0; i < 500; i++) print "" }' >> "$d/$SKILL/SKILL.md"
case_ fail "a SKILL.md body of 500 lines or more" "keep the body under 500"

new_ census-drift
printf '\n[ ] 5.8 a row the census never counted\n' >> "$d/$SKILL/SKILL.md"
case_ fail "a card row the identities census misses" "identities.md §0 counts"

new_ unknown-evidence
printf '\nA figure nobody registered [EV-99].\n' >> "$d/$SKILL/SKILL.md"
case_ fail "an [EV-n] tag with no evidence.md row" "cites EV-99"

new_ unknown-evidence-reference
printf '\nA figure nobody registered [EV-98].\n' >> "$d/$SKILL/reference/run-discipline.md"
case_ fail "an [EV-n] tag in a reference file, unregistered" "cites EV-98"

new_ missing-owns
sed -i.bak '/\*\*Owns:\*\*/d' "$d/$SKILL/reference/nanika-ledger.md"; changed_ "$d/$SKILL/reference/nanika-ledger.md"
case_ fail "a reference file with no Owns: header" "no **Owns:** header"

new_ missing-contents
sed -i.bak '/^Contents:/d' "$d/$SKILL/reference/evaluations.md"; changed_ "$d/$SKILL/reference/evaluations.md"
case_ fail "a long reference file with no Contents:" "no Contents: line"

new_ manifest-missing-row
sed -i.bak '/^| `identities\.md` |/d' "$d/$SKILL/MANIFEST.md"; changed_ "$d/$SKILL/MANIFEST.md"
case_ fail "a reference file MANIFEST.md never lists" "has no MANIFEST.md row"

new_ manifest-stale-row
printf '| `gone.md` | nothing |\n' >> "$d/$SKILL/MANIFEST.md"
case_ fail "a MANIFEST.md row for an absent file" "MANIFEST.md lists gone.md"

new_ stale-page
sed -i.bak 's/of 57</of 56</' "$d/docs/index.html"; changed_ "$d/docs/index.html"
case_ fail "a public page showing a stale row count" "docs/index.html does not show"

new_ stale-readme
sed -i.bak 's/57-row card/56-row card/' "$d/README.md"; changed_ "$d/README.md"
case_ fail "a README naming a stale row count" "README.md does not name"

echo
echo "  $pass passed, $fail failed"
[ "$fail" -eq 0 ] || exit 1
