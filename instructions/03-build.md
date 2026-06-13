# Phase 3 — Build the app

**Goal:** build the app per the plan, keeping it runnable the whole way.

**Output:** working app + a `make run` demo.

## Read first
- `conversion-checklist.md`
- `docs/port-plan.md` — the build order and node→code mapping.
- `docs/conversion-research.md` — reference for behaviour details.

## Do
Work down the plan's **build order**. Keep `make run` green at every step —
prefer a thin end-to-end slice first, then fill in. Tick each sub-item in
`conversion-checklist.md` as you go.

- **Core logic** — implement each node group per the node→code mapping.
- **Trigger** — reproduce it (cron / webhook / manual run).
- **Production features** — build the ones the plan selected (skip the rest):
  - **Security** — creds/secrets via env, **never hardcoded**; dev vs prod isolation; PII handling.
  - **Monitoring** — failure notifications / healthcheck.
  - **Logs** — run + error logging.
  - **Debug entry point** — a manual test / replay path.
- **Frontend** *(only if chosen in the plan)* — telegram bot / tauri / web / CLI.

Stay within the plan. If reality forces a change to the plan, note it back in
`docs/port-plan.md` rather than silently diverging.

## Produce
- Working code that reproduces the workflow (feature parity with the original).
- `make run` demonstrates it end-to-end (real or stubbed inputs).

## Finish
- Confirm `make run` works end to end.
- In `conversion-checklist.md`: tick **Build**, add `completed:DD/MM/YYYY`.
- **Stop.** Let the user try `make run` before deploying.
