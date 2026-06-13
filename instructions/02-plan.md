# Phase 2 — Port plan

**Goal:** decide *how* to port the workflow, given the research. Plan only — no
code.

**Output:** `docs/port-plan.md`

## Read first
- `conversion-checklist.md`
- `docs/conversion-research.md` — the full picture of the workflow.

## Do
**1. Decide migration mode (with the user) — feature parity is required either way:**
- **Direct port** — reproduce the workflow as-is, minimal change. Lower risk, faster.
- **Rework** *(optional)* — use the migration to redesign / optimize.
  ⚠️ If the user chooses rework, do the redesign with a **top model in extended
  thinking / planning mode** before mapping anything. Higher value, higher risk.

**2. Plan the implementation:**
- Choose an approach per node group (raw code / library / framework).
- Map each n8n node → its code equivalent (a table).
- **Pick the production features this workflow actually needs** — n8n gave these
  for free; decide which to rebuild and skip the rest (don't force all four on a
  trivial port):
  - **Security** — secrets/creds via env, dev vs prod isolation, PII handling
  - **Monitoring** — failure notifications / healthcheck
  - **Logs** — run + error logging
  - **Debug entry point** — manual test / replay (plus scheduling/trigger)

**3. Make it convenient (optional):**
- Propose a frontend / integration if it fits: telegram bot, macOS tauri app,
  web UI, CLI. Recommend one; let the user pick.

## Produce `docs/port-plan.md`
Sections: Migration mode (+ rationale) · Architecture overview · Node→code
mapping (table) · Frontend choice · Production features (security / monitoring /
logs / debug — which ones, and why) · Risks & open questions · **Build order**.

## Finish
- Write the doc.
- In `conversion-checklist.md`: tick **Port plan**, add `completed:DD/MM/YYYY`,
  link the doc.
- Populate the **Build → Production features** sub-checklist in
  `conversion-checklist.md` — keep only the features this workflow needs, delete
  the rest.
- **Stop.** The migration-mode decision needs the user's sign-off before building.
