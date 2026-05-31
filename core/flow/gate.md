# Flow: gate

Run near project completion, on `/cadence gate` or automatically at the end of flow/execute.md, before finishing the branch.

The gate is a scoped council deliberation plus tool evidence, returning a single go / no-go.

Steps:
1. Gather evidence by running the tool adapters (gate/tool-adapters.md): secret scan, dependency / container audit, SAST. Each runs only if its tool is installed; record "not run (tool absent)" otherwise. Never block solely because a tool is missing; record reduced assurance.
2. Read the project's Security and Compliance presets from `<project>/.council/presets.md`. These define the hard floors.
3. Run the checklist (gate/checklist.md) against evidence and code, marking each item pass / fail / not-verified.
4. Convene the gate roster by invoking council scoped to security-redteam, compliance, and pre-mortem, handing them the checklist results, tool output, and presets (see prompts/gate-synthesis.md).
5. Apply the verdict: any hard-floor violation (no secrets in git, real auth, row-level access; no PII leaked, lawful basis to hold data) is a hard NO-GO nothing can override. This is the council veto.
6. Note runtime / error-monitoring signals (for example Sentry) as Ops/SRE follow-ups, not security blockers.
7. Return go / no-go with evidence and reasons. On no-go, fixes go back through council / plan; the gate does not auto-remediate.
