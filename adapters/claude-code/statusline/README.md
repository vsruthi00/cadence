# Cadence Context Statusline

## What This Is

An optional Claude Code statusline that shows your live context window
percentage, the running session cost, and a fresh-session flag once context
usage passes a threshold.

The statusline is the only place Claude Code exposes live context usage.
Without it, cadence degrades to structural break recommendations and coarse
estimates with no live numbers. With it, cadence can react to the real
percentage as it climbs.

Example output:

```
ctx 42% | $0.12
ctx 85% | $1.40 | FRESH SESSION RECOMMENDED
```

## One-Time Install

Add a `statusLine` entry to `~/.claude/settings.json`. Set the type to
`command` and point `command` at the absolute path of `statusline.sh` in this
directory.

```json
"statusLine": {
  "type": "command",
  "command": "/absolute/path/to/cadence/adapters/claude-code/statusline/statusline.sh"
}
```

Use the real absolute path on your machine. Claude Code picks up the change on
the next session.

## Requirement

The script needs `jq` on your PATH to parse the JSON payload Claude Code pipes
in. Without `jq` it prints a graceful `ctx n/a` line instead of failing.

## Configuration

The fresh-session threshold defaults to 80 percent. Override it with the
`CADENCE_FRESH_PCT` environment variable, for example `CADENCE_FRESH_PCT=70` to
flag earlier.

## Optional

This statusline is optional. Cadence works without it - you just lose the live
numbers and fall back to structural recommendations.
