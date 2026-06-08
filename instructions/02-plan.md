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
- Decide how to rebuild each *n8n freebie* from the research doc (scheduling,
  error logging, dev/prod).

**3. Make it convenient (optional):**
- Propose a frontend / integration if it fits: telegram bot, macOS tauri app,
  web UI, CLI. Recommend one; let the user pick.

## Produce `docs/port-plan.md`
Sections: Migration mode (+ rationale) · Architecture overview · Node→code
mapping (table) · Frontend choice · Rebuilding n8n freebies · Risks & open
questions · **Build order**.

## Finish
- Write the doc.
- In `conversion-checklist.md`: tick **Port plan**, add `completed:DD/MM/YYYY`,
  link the doc.
- **Stop.** The migration-mode decision needs the user's sign-off before building.
