# Prompt: scoped re-invoke

Used by flow/reinvoke.md to keep mid-execution council calls cheap.

Scoping rule, cheapest first:
1. If the question is a pure trade-off with no specialist domain (sequencing, scope, naming), invoke council with core roles only.
2. If the question is squarely in one domain (a database choice, an API contract, an auth question), invoke council with the chairman plus the single relevant specialist (`/council --with <specialist>`).
3. Never convene the full bench for a mid-execution change. Full-bench deliberation belongs to the original decision, not to a patch.

One question per re-invocation. If execution surfaces several entangled questions, decide the blocking one first, then re-invoke for the next; do not bundle.

The returned decision is appended to the master plan as a dated patch, never rewritten over earlier history.
