# Master Plan: <feature name>

Status: <planning | executing | gating | done> | Launch-readiness: <NN>% | Updated: <DD.Month.YYYY>

## Decision record
- Source: <path to the council decision record this plan implements>
- Decision: <one-line summary of what council decided>

## Execution mode
- <executing-plans | subagent-driven-development> (<why this mode>)

## Phases
1. <phase name> -- checkpoint: <what proves it done>
2. <phase name> -- checkpoint: <what proves it done>

## Session Breakdown
Estimates are coarse bands; the live statusline is the real number and these self-correct against actuals.

| Session | Tasks | Context estimate | Split point | Backup points |
|---|---|---|---|---|
| 1 | <task ids> | <light/moderate/heavy> | <safe-to-close boundary> | <earlier safe-stops> |
| 2 | ... | ... | ... | ... |

Actual vs estimate (updated each session): <session N ran <actual band>; estimate held / was off because ...>

## Security gate
- Checklist: cadence core/gate/checklist.md
- Presets in effect: <Security tier>, <Compliance tier> (from <project>/.council/presets.md)
- Gate result: <not run | GO | NO-GO> (<DD.Month.YYYY>)

## Council patches (append-only)
- <DD.Month.YYYY> -- Q: <question> -> Decision: <decision>. Rationale: <why>.