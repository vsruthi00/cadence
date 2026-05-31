# Flow: execute

Run when the user invokes `/cadence execute` or continues after plan.

Pre-session hook (ledger orient):
- If the project has a ledger (`.ledger/` present), invoke `ledger orient` first to load only relevant shards plus recent git changes and print a "you are here" plus launch-readiness snapshot. If no ledger, skip silently.

Choose execution mode (if not already set on the master plan):
- `executing-plans` when tasks have sequential dependencies or need separate-session checkpoints.
- `subagent-driven-development` when tasks are independent and can run in-session with per-task review.
- Infer from plan shape or honor the user's explicit choice. Record the chosen mode.

Execute:
1. Run the master plan through the chosen superpowers execution skill, task by task, following the Session Breakdown.
2. Watch for a change request, a blocker, or an open question. Any of these routes to flow/reinvoke.md before continuing. Do not silently make a scope or design decision council did not make.
3. Route in-execution needs via mappings/role-to-skill.md: a bug -> systematic-debugging, test-first -> test-driven-development, "confirm it works" -> verification-before-completion, pre-merge -> requesting-code-review / receiving-code-review.

Clean-session breaks (context economy):
4. When execution reaches a split point in the Session Breakdown, run a safe break:
   a. `ledger handoff` (append session log, update changed shards, bump roadmap) and confirm "safe to close", emitting the copy-pasteable kickoff prompt first.
   b. Show the economics: if the statusline is installed, the user's current context percentage and tokens; then the kickoff-payload restart size, framed as "a fresh session restarts at roughly Y tokens and drops you from X percent to about Z percent." If the statusline is not installed, give the structural recommendation plus the coarse estimate, and state that exact live numbers need the statusline (adapters/claude-code/statusline/).
   c. Recommend the break. The user decides whether to act.
5. If scope creeps before a planned split point (the session is ballooning past its estimate), fall back to the nearest backup point and run the same safe break there.

Completion:
6. When the plan is complete, run flow/gate.md before wrapping the branch with finishing-a-development-branch.

Post-session hook (ledger handoff):
- At any session end, if it has not already happened as part of a break, invoke `ledger handoff`. If no ledger, skip silently.
