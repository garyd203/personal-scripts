# About this repo

My personal Claude Code configuration, along with miscellaneous non-agent config. 
Nothing here is a deployed application — it's dotfile-style config under version control:

- `claude/` — Claude Code customisation:
    - `plugins/gazza/` — the "gazza" plugin (agents and skills), published via the
      `gazzas-personal` marketplace defined in `claude/.claude-plugin/marketplace.json`.
    - `user-account-CLAUDE.md` — source of truth for `~/.claude/CLAUDE.md`, the
      user-level instructions applied to every project.
    - `claude-code-settings.json` — user-level Claude Code settings.
- `TODO.md` — ideas for future config changes.

# Conventions

## Agent & skill frontmatter

The `description` is dispatch metadata for the caller: one concrete what-it-does
sentence plus an "invoke when" cue. Category lists and implementation detail live
in the body, not the description.
