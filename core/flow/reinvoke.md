# Flow: reinvoke

Run whenever execution surfaces a change request, a blocker, or an open question the original council decision did not settle.

Principle: cheap by design. Never re-run the full bench. Scope narrow.

Steps:
1. Frame the single question that needs deciding. One question per re-invocation.
2. Scope the roster using prompts/scoped-reinvoke.md: core roles only, or the chairman plus the single relevant specialist, never the full bench.
3. Invoke council on that scoped question (for example `/council --with <one-specialist> <question>`), capped at one escalation round (council enforces this).
4. Patch the master plan: append a dated patch entry (DD.Month.YYYY) with the question, the decision, and the rationale. Do not rewrite earlier history; append.
5. Return to flow/execute.md at the point of interruption.

If the re-invocation returns NO-GO (a floor violation), stop execution and surface it to the user. A floor No-go is not something execution can work around.
