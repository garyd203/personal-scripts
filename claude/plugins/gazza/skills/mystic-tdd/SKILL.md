---
name: mystic-tdd
description: Incremental code implementation with multi-step test-driven development. Use when the user asks to TDD a feature.
---

# TDD

Work towards a high-level behavioral goal through a sequence of small
red-green-refactor cycles. The goal is fixed; the route to it — and often the
design itself — is discovered one step at a time. Never write implementation
code before a failing test demands it.

## Goal first

Before the first test, state the behavioral goal in one or two sentences: what
the system does when this work is done, described as observable behavior, not
implementation. Every cycle is a small step toward that goal, and the goal is
the only thing fixed in advance.

## Keep a test list

Maintain a running scratch list of candidate tests — behaviors the goal implies
but that aren't proven yet. Each cycle:

* Pick the **smallest** test off the list, not the most interesting one.
* Add new candidates as the work reveals them — edge cases, error paths,
  interactions you didn't foresee.
* Cross off tests that turn out to be irrelevant or covered.

The list is how discovery stays concrete: it changes constantly, and that is it
working, not failing.

## The cycle

1. **Red** — write the one test you picked. Run it and confirm it fails *for
   the right reason*: an assertion failure about the missing behavior, not an
   import error, typo, or fixture problem. If it fails for the wrong reason,
   fix the test before touching implementation.
2. **Green** — write the minimum implementation to make that test pass. Resist
   generalising beyond what the test requires. Run the test and confirm it
   passes.
3. **Refactor** — this is where the design emerges. With tests green, reshape
   the implementation the accumulated tests are asking for: remove duplication,
   extract the concepts that have become visible, improve names. Don't
   pre-build structure the tests haven't demanded yet. Run the tests again
   after refactoring. The tests are frozen during refactoring. They are the
   only proof the refactor preserved behavior — if a refactor requires editing
   a test, it isn't a refactor, it's a behavior change in disguise. Stop and
   go back to red.
4. Update the test list and repeat with the next smallest test.

## Keep the steps small

The size limit applies to the green step — code written under a failing test
is unprotected, so keep it minimal. A step is small enough when getting to
green takes a few lines and one design decision. If it needs more than a
couple of test runs to converge, or a diff bigger than the test itself, the
step was too big: revert (or set the test aside) and pick a smaller test off
the list.

The refactor step has no size limit. A substantial reshaping is fine because
the tests protect it — its constraint is different: behavior must not change,
and the tests stay green from start to finish. Take a big refactor as a
series of small mechanical moves, running the tests between moves.

## Rules

* One failing test at a time. Do not write a batch of tests up front.
* Never weaken, skip, or delete a test to get to green. If a test looks wrong,
  stop and say so.
* Never modify implementation and tests in the same move. Refactor
  implementation under frozen tests; tidy tests (shared setup, factories,
  names) as a separate move under frozen implementation, without changing
  any assertion.
* If the implementation needs code the test didn't force into existence, the
  slice was too big — note it and prefer a smaller next test.
* Run the full test suite for the affected module before declaring a cycle
  done, not just the new test.
* When fixing a bug, the first test reproduces the bug and fails on the current
  code. That failure is the proof the test is worth keeping.
* Discovering mid-way that the plan was wrong is TDD working as intended, not a
  deviation. Update the test list and the goal statement if needed, tell the
  user what changed, and keep going — don't apologise for it.

## Pacing

Pause after each green (or at least after each small group of cycles) and show
the user the test, the implementation so far, and the current test list. TDD is
a conversation about design, not a batch job — let the user redirect before the
next slice.
