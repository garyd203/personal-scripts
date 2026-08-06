---
name: retro
description: Distil this session's corrections into durable config, conventions or memory.
---

Close the "trained by feedback" loop: turn what you learned *this session* into
something that survives it.

## Read

Scan the current conversation for signal — not the code, the *collaboration*:

- Corrections the user made ("no, do it this way", rejected tool calls, reverted edits).
- Preferences they confirmed (an approach they approved, a default they endorsed).
- Friction that recurred (a prompt you hit repeatedly, a mistake you made twice).

Ignore one-off task chatter. You want lessons that generalise to future sessions.

## Classify and route

For each lesson, pick the *durable* home by what kind of thing it is. Prefer the
most enforceable option — a check beats prose.

| Kind of lesson | Where it goes |
| --- | --- |
| Enforceable rule (lint, format, permission, hook behaviour) | tool config: `settings.json` or a `.claude/hooks/` script |
| Judgment call specific to *this* project | a convention in the project `CLAUDE.md` |
| How the user wants you to work across *all* projects (style, interaction, tool prefs) | the user's global `~/.claude/CLAUDE.md` |
| A repeated multi-step task worth a shortcut | a new `.claude/skills/` skill or `.claude/agents/` subagent |
| A fact about who the user is, or a pointer to a resource | a memory file (see the memory section of the system prompt) |

## Write

- Propose the change — quote the lesson, name the destination, show the diff — and
  **ask before writing**. Don't silently mutate config.
- Only record what's *settled*. Speculative conventions are slop; leave them out.
- Project vs global CLAUDE.md: a lesson lands in the *project* file when it's specific to this
  repo, in the *global* `~/.claude/CLAUDE.md` when it applies everywhere. The global file
  changes every project — get explicit confirmation before touching it.
- Keep each entry minimal and self-explaining. Halve it, then check it still reads.
