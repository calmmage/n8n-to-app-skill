# Phase 5 — Sanity check & review

**Goal:** step back before calling it done. Is this app production-ready *for
what it actually is* — and did we over-build? Leave the user a clear entry point
for every direction they'll touch.

**Output:** `docs/review.md` + a finalized `make help`.

## Read first
- `conversion-checklist.md`, `docs/port-plan.md`, `docs/conversion-research.md`
- the built app and its `AGENTS.md` / `Makefile`

## Do — three lenses

**1. App-specific productionalization (beyond the standard checklist).**
Nominate **3–4** things *this* app specifically needs, and for each the
*condition* that makes it important here in particular — not generic best
practice. Raise only what the condition actually triggers. Condition → need:
- Handles money / PII → audit trail, stricter secret handling
- High volume / paid APIs → rate limits, cost caps, caching
- Long-running / stateful → persistence, restart recovery, idempotency
- User-facing / real-time → uptime monitoring + alerting
- Irreversible actions (sends, payments) → dry-run / confirmation guard

**2. Simplify / postpone — ship sooner.**
What can be cut or deferred so the user can start using/testing ASAP? Run manual
before cloud, stub a non-critical node, defer the fancy frontend. Bias to shipping.

**3. Replace with agentic / integrations — don't build what you can wire.**
What can be handed to an agent or an existing integration instead of built? e.g.
authenticate Codex/Claude to a Vercel plugin and let it manage deploys; a managed
cron instead of a custom scheduler; an MCP integration instead of a hand-rolled client.

## Then — clear entry points
Ensure `make help` has a **Start here** block with one obvious entry per direction,
each wired to the real command (replace the scaffold's TODO stubs):
- **monitoring** → `make monitor`
- **debugging** → `make debug`
- **quality & continuous development** → `make check`
- **deployment** → `make deploy`

## Produce `docs/review.md`
The 3–4 app-specific candidates (+ their triggering conditions), simplify/postpone
decisions, replace-with-agentic opportunities, and confirmation that every
direction has a working `make` entry point.

## Finish
- In `conversion-checklist.md`: tick **Sanity check & review**, add
  `completed:DD/MM/YYYY`, link the doc.
- Summarize to the user: what's solid, what was simplified, what's deferred, and
  the entry points.
