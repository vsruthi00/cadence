#!/usr/bin/env bash
# cadence context statusline. Claude Code pipes a JSON payload on stdin.
# Prints: <model-context %> | $<cost> [| FRESH SESSION RECOMMENDED]
# Threshold is configurable via CADENCE_FRESH_PCT (default 80).
set -euo pipefail
THRESHOLD="${CADENCE_FRESH_PCT:-80}"
payload="$(cat)"
pct="$(printf '%s' "$payload" | (command -v jq >/dev/null && jq -r '.context_window.used_percentage // empty') 2>/dev/null || true)"
cost="$(printf '%s' "$payload" | (command -v jq >/dev/null && jq -r '.cost.total_cost_usd // empty') 2>/dev/null || true)"
out=""
if [ -n "${pct:-}" ]; then
  pct_int="${pct%.*}"
  out="ctx ${pct_int}%"
  if [ -n "${cost:-}" ]; then out="${out} | \$${cost}"; fi
  if [ "${pct_int:-0}" -ge "$THRESHOLD" ]; then out="${out} | FRESH SESSION RECOMMENDED"; fi
else
  out="ctx n/a (need jq + Claude Code statusline JSON)"
fi
printf '%s' "$out"
