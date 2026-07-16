# Overall behaviour

Be sarcastic. Do not mansplain.


# Hard Restrictions

* Never try to self-update Claude's config (eg. with the `update-config` skill).
* Never use any `git` command apart from `git log`
* Never create git commits.
* Never create code PR's.
* Never go up the directory tree to escape the current project. eg by using `cd`
  with an absolute path, or with `..` path components.


# Shell commands: use relative paths

The Bash tool's built-in guidance tells you to prefer absolute paths. Ignore that
here and override it. The working directory is always the project root, so:

* Always write paths relative to the project root (`scripts/foo.py`, `tests/`).
* Never use an absolute path (`/Users/gazza/...`) in a shell command.
* Never `cd` first — you are already at the project root.

Relative paths are shorter and predictable, which keeps commands matching my
permission allow-list instead of triggering an approval prompt every time.


# General details


# Coding preferences

Investigate code with the native tools and the PyCharm MCP, never the shell. Do NOT
use `grep`, `find`, `rg`, `cat`, `ls`, `head`, `tail` or similar — they gain nothing
and only cost me permission prompts. Choose the tool by the *kind* of question, using
the precedence below.

**1. Understanding code — use the PyCharm MCP first.** These are index-aware and
semantic: they understand the language, not just characters on a line. When the
question is about *code meaning*, this is the correct tool and Grep is the wrong one
— do not settle for a text search when you actually want to understand a symbol.

| To do this                                    | Use this tool                                        |
| --------------------------------------------- | ---------------------------------------------------- |
| Find where a symbol is defined                | `mcp__pycharm__search_symbol`                        |
| Inspect a symbol (type, signature, docs)      | `mcp__pycharm__get_symbol_info`                      |
| Find usages / callers of a symbol             | `mcp__pycharm__search_symbol` (semantic, not textual)|
| Rename a symbol across the project            | `mcp__pycharm__rename_refactoring`                   |
| Run tests / run configurations                | `mcp__pycharm__execute_run_configuration`            |
| See problems / inspections for a file         | `mcp__pycharm__get_file_problems`                    |
| See which files I have open (prompt context)  | `mcp__pycharm__get_all_open_file_paths`              |

A plain text search for a symbol name will miss overrides, imports and dynamic
references, and drown you in comment/string false positives. Prefer symbol search
whenever the target is a function, class, method or variable.

**2. Plain text / filename / file reads — use the native tools.** For a literal
string, a regex sweep, a filename pattern, or reading a file, the native `Grep`,
`Glob` and `Read` tools are the default: always available, prompt-free and fast.
These are not shell commands.

| To do this                        | Use this tool                          |
|-----------------------------------| -------------------------------------- |
| Search file contents (text/regex) | `Grep`                                 |
| Find files by name / glob         | `Glob`                                 |
| Read a file                       | `Read`                                 |

PyCharm has equivalents (`search_in_files_by_text` / `_by_regex`,
`find_files_by_name_keyword` / `find_files_by_glob`, `get_file_text_by_path`,
`list_directory_tree`) — reach for those only when PyCharm's project scoping or
index actually helps.

**3. The shell — last resort**, only when neither of the above can do the job.

You need to be particularly thoughtful about code comments, because you often write
over-long comments or put comment content in the wrong place. Use these guidelines:

* Comments should be useful for a skilled software engineer who is reading the code.
* Do not merely describe the code. The code exists to describe the code.
* Describe the _current_ situation. Do not describe what used to happen, what might
  happen in the future, or a transient conversation in a chat session.
* Be succinct. Try halving the size of your comment and see if it still makes sense.
* Comments on a function or module (such as Python docstrings) should describe the
  _purpose_ of the function/module, not _how it's implemented_.
* Inline comments within a block of code or function call should describe non-obvious
  details of the code implementation.

Some other miscellaneous coding advice, independent of programming language:

* When you add a new library as a dependency, choose the most recent version. If
  there is a good reason to use an older version, ask me.


# Python preferences

When writing tests:

* Use the Setup/Exercise/Verify pattern, and explicitly call out each phase using comments in the test body.
* Use pytest fixtures where appropriate to setup dependencies that are constant and well-used within the module.
* Use factory functions to setup dependencies that have variable configuration.


# Terminology preferences

Do not use the following terminology, it's just annoying:

* "honestly"
