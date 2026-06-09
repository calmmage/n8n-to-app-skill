# Conversion checklist — n8n workflow → app

> Deployed by the **n8n-to-app** skill. Each line below is **one agentic
> session**. It points to the skill file that drives that session. When the
> session is done: tick it, add `completed:DD/MM/YYYY`, and fill in the doc it
> produced.

**Workflow:** <name of the workflow being ported>
**Skill source:** `<local path to n8n-to-app-skill>` · <github repo url>
**Started:** <DD/MM/YYYY>

---

## Phases

- [ ] **Scaffold repo** — run `scripts/scaffold.py` (skeleton: `AGENTS.md` stub, `make help` / `make run`, this checklist). Just run it.
      → output: repo skeleton
- [ ] **Conversion research** — follow `instructions/01-research.md` (one unified pass: what the workflow does, integrations, creds, triggers, data flow, n8n freebies)
      → output: `docs/conversion-research.md`
- [ ] **Port plan** — follow `instructions/02-plan.md` (migration mode: direct vs rework · node→code mapping · frontend choice)
      → output: `docs/port-plan.md`
- [ ] **Build** — follow `instructions/03-build.md` (core logic · n8n built-ins: debug/error-logging/dev-prod · optional frontend)
      → output: working app + `make run` demo
- [ ] **Deploy & hand off** — follow `instructions/04-deploy.md` (pick target: manual / docker / cloud · finalize `AGENTS.md` + ongoing-work entry)
      → output: deployed app
- [ ] **Sanity check & review** — follow `instructions/05-review.md` (app-specific gaps · simplify/postpone to ship sooner · replace-with-agentic · clear `make help` entry point per direction)
      → output: `docs/review.md` + finalized `make help`
