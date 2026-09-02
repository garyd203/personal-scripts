# Claude config

- **Create a personal "CLI tool" skill** — thin, pointing at
  [clig.dev](https://clig.dev) (Command Line Interface Guidelines) for the
  generic half.
- pull out a skill for python coding from CLAUDE.md, so we don't overload the
  context for non-python coding. Do only when we add too much python-specific
  content and we want to include a bunch of reference examples or lengthy
  instructions
- pull out a skill for testing from CLAUDE.md, so we don't overload the
  context. Do only when we add too much testing-specific
  content and we want to include a bunch of reference examples or lengthy
  instructions
- write an agent to review (Python?) tests. I should have plenty of content
  to write, and the bar is usually low. Bonus is that it could run on an
  existing codebase. The hard part will be ensuring that it gives actionable
  output