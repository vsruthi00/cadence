---
name: cadence
description: Use to carry a council decision through its full lifecycle: turn a decision record into a master plan, execute it, re-invoke council whenever something changes, and run an end-of-project security gate that returns go or no-go. Also plans the work into sessions and recommends safe clean-session breaks to keep the model performing well. Invoke when the user says "plan this out", "execute the plan", "run the security gate", "we made a decision, now build it", "something changed mid-build", "are we safe to ship", or "should we start a fresh session". Routes into the superpowers planning, execution, debugging, and review skills rather than reimplementing them.
---

# cadence

The lifecycle skill. It carries a council decision through to a master plan and execution, loops back to council whenever something changes, owns the end-of-project security gate, and keeps the build economical on context. cadence is orchestration: it routes into the superpowers, council, and ledger skills and does not reimplement planning, testing, debugging, or review.

## Commands

- `/cadence plan` - run `core/flow/plan.md`: decision record -> writing-plans -> master plan, including a session breakdown from council's executor.
- `/cadence execute` - run `core/flow/execute.md`: run the plan via executing-plans or subagent-driven-development, with ledger orient/handoff hooks and safe clean-session breaks at split points.
- `/cadence gate` - run `core/flow/gate.md`: the end-of-project security gate, returns go / no-go.
- `/cadence` with no subcommand - start or resume: if no master plan exists, run plan; else resume execute; offer gate when the plan is complete.

Re-invoking council on a mid-execution change (`core/flow/reinvoke.md`) is triggered automatically from execute; it is not a user command.

## Lifecycle

plan -> execute -> (on any change, blocker, or question: reinvoke council scoped narrow, patch the plan, resume) -> gate -> go / no-go. During execute, at each session split point: ledger handoff, safe-to-close, kickoff prompt, then a fresh-session recommendation with the context economics.

## Dependencies

- council (the deliberation engine): invoked for the original decision, scoped mid-execution re-invocations, the gate roster (security-redteam, compliance, pre-mortem), and the executor-driven session breakdown. cadence holds no roles of its own.
- ledger (project memory): orient before execute, handoff at breaks and session end. Skipped silently if the project has no `.ledger/`.
- superpowers skills: writing-plans, executing-plans, subagent-driven-development, test-driven-development, verification-before-completion, systematic-debugging, requesting-code-review, receiving-code-review, finishing-a-development-branch. See `core/mappings/role-to-skill.md`.
- Optional: the context statusline at `adapters/claude-code/statusline/` for live context numbers.

## Rules

- Dates use DD.Month.YYYY. No emojis, no em dashes.
- The master plan is the authoritative execution artifact. Council re-invocations append dated patches; they never rewrite history.
- A session break is never a bare restart: ledger handoff, safe-to-close confirmation, kickoff prompt, then the recommendation with the economics.
- Live context numbers come only from the statusline. Without it, give structural break recommendations and coarse estimates, and say so; never fabricate a percentage.
- The gate runs tools only if installed (detect-and-invoke); a missing tool is reduced assurance, never an automatic pass. A hard-floor violation is a NO-GO the gate cannot override.
- Path base: paths in this file are relative to the repo root (so `core/flow/plan.md`). Paths inside `core/flow/*.md`, `core/gate/*.md`, and `core/prompts/*.md` are relative to `core/` (so `gate/checklist.md` means `core/gate/checklist.md`).

Read the relevant `core/flow/*.md`, `core/gate/*.md`, and `core/prompts/*.md` and follow them exactly.
