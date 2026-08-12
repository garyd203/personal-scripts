# Repo config

Add claude.md _for the repo_ so that Claude knows what it's looking at

# Claude config

- **Create a personal "CLI tool" skill** — thin, pointing at
  [clig.dev](https://clig.dev) (Command Line Interface Guidelines) for the
  generic half.
- pull out a skill for python coding from CLAUDE.md, so we don't overload the
  context for non-python coding. Do only when we add too much python-specific
  content and we want to include a bunch of reference examples or lengthy
  instructions
- pull out a skill for testing from CLAUDE.md, so we don't overload the
  context. Do only when we add too much python-specific
  content and we want to include a bunch of reference examples or lengthy
  instructions
- do soemthing better for the code reviewer. it's supposed to look for AI slop,
  but often ends up doing a basic review. Either intentionally broaden, or
  figure out how to make it tighter. Either way, we do want something to do
  a more fundamental first-pass automated review.