# Mapping: council role to superpowers skill

cadence routes execution needs into existing superpowers skills rather than reimplementing them. This table is the source of truth for which skill fires when, and which council role owns that concern.

| Need during execution | Skill invoked | Owning council role |
|---|---|---|
| Turn spec into plan | writing-plans | executor |
| Execute plan with checkpoints | executing-plans | executor |
| In-session independent tasks | subagent-driven-development | executor |
| Write code test-first | test-driven-development | empiricist |
| Confirm work actually works | verification-before-completion | empiricist |
| A bug or unexpected behavior | systematic-debugging | contrarian + relevant specialist |
| Pre-merge review | requesting-code-review / receiving-code-review | contrarian + security-redteam |
| Wrap up the branch | finishing-a-development-branch | executor |

cadence never reimplements planning, testing, debugging, or review. It detects the need, names the owning role for the record, and invokes the listed skill.
