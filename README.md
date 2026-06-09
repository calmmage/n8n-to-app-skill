# n8n-to-app-skill

A Claude Code skill that walks you through converting an **n8n workflow** into a
real, deployable **app / service**.

Built for the SCI AIA course (Module 5). The goal: give you a repeatable process
— plus the scaffolding n8n gives you for free (debugging, error logging,
monitoring, dev/prod) — so your workflow becomes something you can run, deploy,
and maintain on your own.

## Install

One command:

```bash
curl -fsSL https://raw.githubusercontent.com/calmmage/n8n-to-app-skill/main/install.sh | bash
```

It asks which agents to install into — **Claude** (`~/.claude/skills`),
**Codex** (`~/.codex/skills/local`), **Antigravity / agy** (`~/.gemini/skills`)
— or `all`. Restart the agent and run `/n8n-to-app`.

Non-interactive: `./install.sh claude codex` or `AGENTS="claude agy" ./install.sh`.
Already cloned the repo? Run `./install.sh` — it symlinks your clone so
`git pull` keeps the skill current.

## Use

Open Claude Code in (or next to) the workflow you want to port and run:

```
/n8n-to-app
```

or just ask it to "convert my n8n workflow into an app." It will set up a repo,
scaffold the project, and walk the conversion in four phases — pausing for your
review between each.

## What's inside

- **`SKILL.md`** — the conversion process: set up repo → scaffold → 4 phases
- **`scripts/scaffold.py`** — deploys the kit into your repo so `make run` works
  from day one (checklist, `AGENTS.md`, `Makefile`, app stub)
- **`instructions/`** — one file per phase: research · plan · build · deploy
- **`templates/conversion-checklist.md`** — the progress tracker dropped into
  your repo, one line per phase

## Status

🚧 Active prep for the lecture. Repo is private for now.
