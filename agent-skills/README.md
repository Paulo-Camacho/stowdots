# agent-skills

Agent skills, shared by **Claude Code** and **Codex**, version-controlled here.

## Layout

```
.claude/skills/<skill>/     real files
.codex/skills/<skill>   ->  ../../.claude/skills/<skill>   (symlink)
caveman-archive/            reference copy, NOT stowed
```

One real copy per skill. Codex symlinks to it, so editing a `SKILL.md` once
updates both agents.

## Install

```sh
stow -d ~/stowdots -t ~ --no-folding agent-skills
```

`--no-folding` matters: `~/.codex/skills/` already contains Codex's bundled
`.system/` skills. Without it, stow would try to fold the whole directory and
clobber them.

`.stow-local-ignore` keeps `caveman-archive/` and this README out of `$HOME`.

## Provenance

Skills are from [mattpocock/skills](https://github.com/mattpocock/skills) (MIT),
copied byte-for-byte from a `--depth 1` clone of `main`. They are pure markdown —
no scripts, no hooks, no network calls. The upstream repo's shell scripts
(`block-dangerous-git.sh`, `hitl-loop.template.sh`, `wizard/template.sh`) were
deliberately left behind.

### Zero-cost (user-invoked)

`disable-model-invocation: true` — no description loaded into context, so these
cost nothing until typed.

| skill | |
| --- | --- |
| `grill-me` | relentless interview to sharpen a plan (needs `grilling`) |
| `wayfinder` | map a large problem into ticket-sized decisions |
| `to-spec` / `to-tickets` | turn a discussion into a spec / issue tracker tickets |
| `implement` | work a ticket to completion |
| `triage` | triage inbound issues |
| `improve-codebase-architecture` | architecture review + HTML report |
| `grill-with-docs` | grill using library docs as the source of truth |
| `ask-matt` | route a question through Matt Pocock's opinions |
| `handoff` | hand a session off to a fresh context |
| `teach` | interactive lessons with retrieval practice |
| `writing-great-skills` | how to write skills |
| `setup-matt-pocock-skills` | one-time per-repo setup (issue tracker, domain) |
| `edit-article` | Matt's article editing style — personal, likely not useful |

### Always-on cost (model-invoked)

Description sits in **every** request. Total ~245 tokens.

| skill | cost |
| --- | --- |
| `mp-code-review` | ~104 tok |
| `codebase-design` | ~66 tok |
| `grilling` | ~38 tok — hard dependency of `grill-me` |
| `tdd` | ~37 tok |

`mp-code-review` is upstream's `code-review`, renamed. Claude Code ships its own
built-in `/code-review` (with `ultra` multi-agent mode, `--fix`, `--comment`);
keeping the upstream name would shadow it. Only the `name:` frontmatter field
was changed.

## caveman-archive/

Markdown from [JuliusBrussee/caveman](https://github.com/JuliusBrussee/caveman)
(MIT), pinned at `25d22f864ad6`. **Reference only — not stowed.**

Caveman stays installed as a Claude Code plugin, because its behaviour depends on
hooks (`caveman-activate.js`, `caveman-mode-tracker.js`) that markdown cannot
replicate — they inject the mode into every prompt. Those hooks were audited:
no network calls, local filesystem only.

Stowing this archive into `~/.claude/skills/` would collide with the plugin's
skills of the same name. Don't.

Embedded Python from `caveman-compress/scripts/` was stripped; this archive is
markdown only.

## Updating

```sh
git clone --depth 1 https://github.com/mattpocock/skills /tmp/mp
cp -R /tmp/mp/skills/productivity/grill-me .claude/skills/grill-me
# re-apply the mp-code-review rename if code-review changed
git -C ~/stowdots diff   # review before committing
```

Skills are prompt text an agent will follow. Read the diff on every update.
