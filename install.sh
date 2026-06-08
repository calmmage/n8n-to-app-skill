#!/usr/bin/env bash
# Install the n8n-to-app skill into Claude Code.
#
# One-liner:
#   curl -fsSL https://raw.githubusercontent.com/calmmage/n8n-to-app-skill/main/install.sh | bash
# Or, from a local clone:
#   ./install.sh
set -euo pipefail

SKILL_NAME="n8n-to-app"
REPO_URL="https://github.com/calmmage/n8n-to-app-skill.git"
DEST="${HOME}/.claude/skills/${SKILL_NAME}"

mkdir -p "${HOME}/.claude/skills"

# Detect whether we're running from inside a checkout of this repo.
SRC=""
if [ -n "${BASH_SOURCE:-}" ] && [ -f "${BASH_SOURCE[0]:-}" ]; then
  maybe="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  [ -f "${maybe}/SKILL.md" ] && SRC="${maybe}"
fi

if [ -n "${SRC}" ]; then
  # Local clone -> symlink it, so `git pull` keeps the skill current.
  rm -rf "${DEST}"
  ln -s "${SRC}" "${DEST}"
  echo "✅ Linked ${SRC} -> ${DEST}"
else
  # Piped install -> clone (or update) directly into the skills dir.
  if [ -d "${DEST}/.git" ]; then
    git -C "${DEST}" pull --ff-only
    echo "✅ Updated ${DEST}"
  else
    git clone --depth 1 "${REPO_URL}" "${DEST}"
    echo "✅ Installed into ${DEST}"
  fi
fi

echo "Restart Claude Code (or start a new session), then run: /${SKILL_NAME}"
