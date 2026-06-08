# Phase 1 — Conversion research

**Goal:** fully understand the n8n workflow *before any code is written*. One
unified research pass, one output doc.

**Output:** `docs/conversion-research.md`

## Read first
- `conversion-checklist.md` — see where this phase sits.
- The n8n workflow itself: the exported workflow JSON the user provides (n8n →
  *Download* / *Copy to clipboard*). If they only have screenshots or a
  description, work from that and list what's missing under *Open questions*.

## Do
Trace the workflow end to end. Don't propose solutions yet — only describe what
*is*.

- **Trigger & schedule** — what kicks it off (cron / webhook / manual / app
  event) and how often.
- **Nodes** — for each node: what it does, its inputs/outputs, and any config
  that matters for porting.
- **Integrations & credentials** — every external service it touches and the
  secrets/credentials each needs.
- **Data flow** — how data moves and is transformed between nodes.
- **n8n freebies** — what n8n gives for free that a standalone app must rebuild:
  scheduling, retries, the credential vault, execution history/logs, error
  branches, etc.

## Produce `docs/conversion-research.md`
Sections: Overview · Trigger & schedule · Nodes (table) · Integrations &
credentials · Data flow · n8n freebies to rebuild · Open questions.

Keep it factual and complete — the next phase plans entirely off this doc.

## Finish
- Write the doc.
- In `conversion-checklist.md`: tick **Conversion research**, add
  `completed:DD/MM/YYYY`, and link the doc.
- **Stop.** Let the user read the research before planning the port.
