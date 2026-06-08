#!/usr/bin/env python3
"""Scaffold a target repo for an n8n -> app conversion.

Run this from inside the target app repo (the one being converted). It deploys
the conversion checklist, an AGENTS.md stub, a Makefile, and a minimal runnable
app stub so `make run` works from day one.

Non-destructive: existing files are left untouched (a skip notice is printed).
Dependency-free — plain Python 3 standard library.
"""
from __future__ import annotations

import argparse
import subprocess
from datetime import date
from pathlib import Path

SKILL_ROOT = Path(__file__).resolve().parent.parent
TEMPLATES = SKILL_ROOT / "templates"

APP_STUB = '''"""Entry point for the converted app. Replaced during Phase 3 (build)."""


def main() -> None:
    print("app stub — deployed by the n8n-to-app conversion. Replace me in Phase 3.")


if __name__ == "__main__":
    main()
'''


def skill_remote_url() -> str:
    try:
        url = subprocess.check_output(
            ["git", "-C", str(SKILL_ROOT), "remote", "get-url", "origin"],
            text=True,
            stderr=subprocess.DEVNULL,
        ).strip()
        return url or "<unknown>"
    except Exception:
        return "<unknown>"


def write(path: Path, content: str) -> None:
    if path.exists():
        print(f"  skip  {path.name} (already exists)")
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content)
    print(f"  write {path}")


def render_checklist() -> str:
    text = (TEMPLATES / "conversion-checklist.md").read_text()
    text = text.replace("<local path to n8n-to-app-skill>", str(SKILL_ROOT))
    text = text.replace("<github repo url>", skill_remote_url())
    text = text.replace(
        "**Started:** <DD/MM/YYYY>",
        f"**Started:** {date.today().strftime('%d/%m/%Y')}",
    )
    return text


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("target", nargs="?", default=".", help="target repo dir (default: cwd)")
    args = parser.parse_args()

    target = Path(args.target).resolve()
    print(f"Scaffolding n8n->app conversion in: {target}\n")

    write(target / "conversion-checklist.md", render_checklist())
    write(target / "AGENTS.md", (TEMPLATES / "AGENTS.stub.md").read_text())
    write(target / "Makefile", (TEMPLATES / "Makefile").read_text())
    write(target / "app" / "main.py", APP_STUB)
    (target / "docs").mkdir(exist_ok=True)

    print("\nDone. Next:")
    print("  1. `make run`  — confirm the stub runs end to end.")
    print(f"  2. Follow {SKILL_ROOT / 'instructions' / '01-research.md'} to start Phase 1.")


if __name__ == "__main__":
    main()
