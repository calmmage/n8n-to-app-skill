---
name: n8n-to-app
description: Convert an n8n workflow into a standalone, deployable app/service. Use when a user wants to migrate or port an n8n workflow off n8n into real code they can run, deploy, and maintain. Drives a phased conversion (research → plan → build → deploy) with a tracked checklist and human review between phases.
---

# n8n-to-app

Convert an n8n workflow into a standalone app/service the user can run, deploy,
and maintain — keeping feature parity with the original.

The conversion runs as **4 phases, one agentic session each**, tracked in a
`conversion-checklist.md` deployed into the target repo. **Stop for the user to
review between phases.**

## 1. Set up the repo
Decide where the new app lives:
- Run `gh auth status`. If GitHub is available → offer to create a new repo and
  clone it (or use the repo the user already opened).
- If not → work in a local folder. Don't block on GitHub.

## 2. Scaffold (run the script — don't hand-write these files)
From inside the target repo:

```
python <path-to>/n8n-to-app-skill/scripts/scaffold.py
```

This deploys `conversion-checklist.md`, an `AGENTS.md` stub, a `Makefile`, and a
runnable app stub. Confirm `make run` works — usability from day one.

## 3. Work the checklist, phase by phase
Open `conversion-checklist.md`. For each phase, follow its instruction file in
this skill:

| Phase | Instruction | Output |
|-------|-------------|--------|
| Research | `instructions/01-research.md` | `docs/conversion-research.md` |
| Plan | `instructions/02-plan.md` | `docs/port-plan.md` *(migration mode decision)* |
| Build | `instructions/03-build.md` | working app + `make run` |
| Deploy | `instructions/04-deploy.md` | deployed app |
| Review | `instructions/05-review.md` | `docs/review.md` + finalized `make help` |

After each phase: tick the checklist, stamp the date, link the output doc, and
**stop for the user to review** before starting the next phase.
