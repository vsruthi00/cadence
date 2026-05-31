# Flow: plan

Run when the user invokes `/cadence plan` or starts a new lifecycle from a council decision.

Inputs:
- A council decision record and any spec stub it emitted. Location follows project convention; ask the user for the path if it is not obvious.
- The project's ledger, if present, for context.

Steps:
1. Read the decision record and spec stub. If the decision was NO-GO, stop. There is nothing to plan until council returns a GO.
2. Invoke the superpowers `writing-plans` skill against the spec to produce the implementation plan. Do not reimplement planning.
3. Produce a session breakdown: dispatch council scoped to the executor role only (see prompts/session-breakdown.md) against the finished plan. The executor returns sessions, per-session context estimates, split points, and backup points.
4. Wrap everything in the master plan artifact using schema/master-plan.template.md: link the decision record, carry in the ordered phases and checkpoints, set the chosen execution mode (see flow/execute.md), embed the Session Breakdown, reference the security gate checklist, and add the status / launch-readiness line.
5. Store the master plan at the project's plan location (default `docs/plans/YYYY-MM-DD-<feature>.md`).
6. Hand off to flow/execute.md.
