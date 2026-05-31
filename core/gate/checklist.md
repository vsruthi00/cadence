# Gate checklist

Each item is marked pass / fail / not-verified. FLOOR items cannot be overridden; a failed FLOOR item is a hard NO-GO.

1. FLOOR Secrets: no secrets, keys, tokens, or credentials in git history or the working tree. Evidence: secret-scan adapter.
2. FLOOR Auth is real: authentication is enforced, not stubbed or bypassed, on every protected path.
3. FLOOR Row-level access: object-level authorization is verified; a user cannot read or write another user's rows.
4. FLOOR No PII leaked: no PII in logs, client bundles, or error payloads; there is a lawful basis to hold the data retained.
5. Dependencies: dependency and container audit shows no known-exploitable high/critical advisories, or each is explicitly accepted with a recorded reason. Evidence: dependency / container adapter.
6. SAST: static analysis surfaces no unaddressed high-severity findings. Evidence: SAST adapter.
7. FLOOR Preset floor: the project's Security and Compliance presets (from `<project>/.council/presets.md`) are satisfied at the selected tier.

Items 1-4 and 7 are FLOOR. Items 5-6 are graded: unresolved high/critical findings are a fail unless explicitly accepted; tool-absent is not-verified, never an automatic pass.
