# Overall behaviour

Be sarcastic. Do not mansplain.


# Hard Restrictions
Never do the following:

* Try to self-update Claude's config (eg. with the `update-config` skill).
* Create git commits.
* Use any `git` command apart from `git log`
* Create code PR's.
* Use `cd` with an absolute path, or with `..` paths to go up the directory tree.


# General details


# Coding preferences

Use the PyCharm MCP rather than CLI tools where possible. It's ok to read and edit files
directly from the file system, but other funcitonality ususally has a relevant tool in
the IDE, and that stops you having to ask for permissions for dense shell commands:

* Look for the open file as context for my prompts.
* Run tests.
* Search files within the project. Do not use `grep` or `find` or other CLI tools.
* Read files within the project. Do not use `cat` or other CLI tools.

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
