# Gate tool adapters

Detect-and-invoke only. cadence does not bundle or install these tools. For each, check presence, run if present, parse the result, and record "not run (tool absent)" otherwise.

## Secret scan (gitleaks)
- Detect: `command -v gitleaks`
- Run: `gitleaks detect --no-banner --redact` (history) and `gitleaks protect --staged --no-banner --redact` (working tree).
- Pass: exit 0, no findings. Fail: any finding (FLOOR checklist item 1).

## Dependency / container audit (Dependabot, trivy)
- Dependabot: surfaced via the GitHub repo, not a local CLI. Note its enabled state and open alerts if the repo has it.
- trivy: detect `command -v trivy`; run `trivy fs --severity HIGH,CRITICAL --exit-code 1 .` and, for images, `trivy image <ref>`.
- Pass: no high/critical, or each accepted with a recorded reason. Tool absent: not-verified.

## SAST (Semgrep, CodeQL)
- Semgrep: detect `command -v semgrep`; run `semgrep --error --config auto`.
- CodeQL: note if configured in CI; do not attempt a local full database build inside the gate.
- Pass: no unaddressed high-severity findings. Tool absent: not-verified.

Record every adapter's outcome (ran/clean, ran/findings, not-run) so the gate synthesis can state assurance honestly.
