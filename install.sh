#!/usr/bin/env bash
# Install the n8n-to-app skill into one or more agents (Claude, Codex, Antigravity).
#
#   curl -fsSL https://raw.githubusercontent.com/calmmage/n8n-to-app-skill/main/install.sh | bash
#   ./install.sh                      # from a local clone (symlinks it)
#   ./install.sh claude codex         # non-interactive: pick agents by name
#   AGENTS="claude agy" ./install.sh  # or via env var
set -euo pipefail

SKILL_NAME="n8n-to-app"
REPO_URL="https://github.com/calmmage/n8n-to-app-skill.git"

# --- agent skill dirs (match the calmmage skill-library conventions) ---
claude_dir="${HOME}/.claude/skills"
if [ -d "${HOME}/.codex" ]; then codex_dir="${HOME}/.codex/skills/local"; else codex_dir="${HOME}/.agents/skills"; fi
agy_dir="${HOME}/.gemini/skills"

agent_dir() {
  case "$1" in
    claude)          echo "${claude_dir}" ;;
    codex)           echo "${codex_dir}" ;;
    agy|antigravity) echo "${agy_dir}" ;;
    *)               echo "" ;;
  esac
}

# --- detect: running from a local clone (symlink) vs piped (clone) ---
SRC=""
if [ -n "${BASH_SOURCE:-}" ] && [ -f "${BASH_SOURCE[0]:-}" ]; then
  maybe="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  [ -f "${maybe}/SKILL.md" ] && SRC="${maybe}"
fi

# --- choose agents: args > env > interactive > default claude ---
selection="${*:-${AGENTS:-}}"
if [ -z "${selection}" ]; then
  if [ -r /dev/tty ]; then
    echo "Install '${SKILL_NAME}' into which agents?"
    echo "  1) claude   ${claude_dir}"
    echo "  2) codex    ${codex_dir}"
    echo "  3) agy      ${agy_dir}  (Antigravity / Gemini)"
    printf "Enter names or numbers (space-separated), or 'all' [claude]: "
    read -r selection </dev/tty || true
    [ -z "${selection}" ] && selection="claude"
  else
    selection="claude"
  fi
fi
if [ "${selection}" = "all" ] || [ "${selection}" = "a" ]; then selection="claude codex agy"; fi
selection="${selection//1/claude}"; selection="${selection//2/codex}"; selection="${selection//3/agy}"

install_to() {
  local dest="$1/${SKILL_NAME}"
  mkdir -p "$1"
  if [ -n "${SRC}" ]; then
    rm -rf "${dest}"; ln -s "${SRC}" "${dest}"; echo "  ✅ linked  ${dest}"
  elif [ -d "${dest}/.git" ]; then
    git -C "${dest}" pull --ff-only -q; echo "  ✅ updated ${dest}"
  else
    git clone --depth 1 -q "${REPO_URL}" "${dest}"; echo "  ✅ cloned  ${dest}"
  fi
}

for a in ${selection}; do
  dir="$(agent_dir "${a}")"
  if [ -z "${dir}" ]; then echo "  ⚠️  unknown agent: ${a} (skipped)"; continue; fi
  echo "→ ${a}"
  install_to "${dir}"
done

echo "Done. Restart your agent, then run /${SKILL_NAME}"
