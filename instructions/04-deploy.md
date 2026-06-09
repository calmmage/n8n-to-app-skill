# Phase 4 — Deploy & hand off

**Goal:** get the app running in its target environment and leave the repo set
up for ongoing work.

**Output:** deployed app + finalized `AGENTS.md`.

## Read first
- `conversion-checklist.md`
- `docs/port-plan.md` — any deploy constraints noted during planning.

## Do
**1. Pick a deploy target (with the user):**
- **Manual run** — a single launch of the app (optionally package as a macOS
  app with tauri).
- **Local docker compose** — one command up/down on their machine.
- **Cloud** — hosted, always-on.

**2. Set up the chosen path and verify it actually runs in that target** — not
just locally. For prod, confirm error logging + failure notifications fire.

**3. Finalize the repo for ongoing work:**
- Update `AGENTS.md`: drop the "conversion in progress" note, keep the usual
  project content, and add a clear **ongoing-work entry point** — how to change
  the app and re-deploy.

## Produce
- A running deployment in the chosen target.
- Finalized `AGENTS.md`. Optionally `docs/deploy.md` with the exact steps used.

## Finish
- In `conversion-checklist.md`: tick **Deploy & hand off**, add
  `completed:DD/MM/YYYY`.
- Summarize to the user: what's deployed and where.
- **Next:** the final sanity-check & review pass (`instructions/05-review.md`).
