# Prompt: gate synthesis

Used by flow/gate.md to turn checklist results and tool evidence into a single go / no-go.

1. Assemble the question for council's gate roster (security-redteam, compliance, pre-mortem): the checklist with each item's pass / fail / not-verified mark, the raw tool-adapter outcomes, and the project's selected Security and Compliance preset tiers.
2. Ask the roster to (a) confirm or dispute each checklist mark, (b) name any floor violation, and (c) for pre-mortem, narrate the most likely way this ships and then fails.
3. Verdict rules:
   - Any FLOOR item failed -> hard NO-GO. security-redteam and compliance hold this veto; nothing overrides it.
   - A graded item (deps, SAST) with unresolved high/critical findings -> NO-GO unless the user explicitly accepts the risk with a recorded reason.
   - not-verified items (tool absent) do not pass silently: state them as reduced assurance.
   - Runtime / error-monitoring signals (Sentry and similar) are recorded as Ops/SRE follow-ups, not gate blockers.
4. Emit: GO or NO-GO, the evidence table, the reasons, and for NO-GO the specific items to route back through council / plan. The gate does not fix anything itself.
