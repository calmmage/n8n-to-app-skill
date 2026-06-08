# n8n-to-app-skill

A Claude Code skill that walks you through converting an **n8n workflow** into a
real, deployable **app / service**.

Built for the SCI AIA course (Module 5). The goal: give you a repeatable process
— plus the scaffolding n8n gives you for free (debugging, error logging,
monitoring, dev/prod) — so your workflow becomes something you can run, deploy,
and maintain on your own.

## Install

A skill is a directory containing `SKILL.md`. Install it by placing this repo
under your Claude Code skills folder — symlink so `git pull` keeps it current.

**Personal (all your projects):**
```bash
git clone https://github.com/calmmage/n8n-to-app-skill.git
ln -s "$(pwd)/n8n-to-app-skill" ~/.claude/skills/n8n-to-app
```

**Project-only (just one repo):**
```bash
ln -s /path/to/n8n-to-app-skill /your/project/.claude/skills/n8n-to-app
```

Restart Claude Code (or start a new session) and it'll pick up the skill.

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
