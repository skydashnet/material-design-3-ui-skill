#!/usr/bin/env bash
set -euo pipefail

SKILL_ID="material-design-3-ui"
HOME_DIR="${HOME:?HOME is not set}"
OPENCLAW_ROOT="${OPENCLAW_STATE_DIR:-${HOME_DIR}/.openclaw}"

DESTS=(
  "${HOME_DIR}/.claude/skills/${SKILL_ID}"
  "${HOME_DIR}/.agents/skills/${SKILL_ID}"
  "${HOME_DIR}/.gemini/config/skills/${SKILL_ID}"
  "${HOME_DIR}/.kiro/skills/${SKILL_ID}"
  "${HOME_DIR}/.config/opencode/skills/${SKILL_ID}"
  "${HOME_DIR}/.hermes/skills/${SKILL_ID}"
  "${OPENCLAW_ROOT}/skills/${SKILL_ID}"
)

echo "Removing Material Design 3 UI Skill..."
for dest in "${DESTS[@]}"; do
  if [[ -e "$dest" || -L "$dest" ]]; then
    rm -rf "$dest"
    echo "  removed $dest"
  fi
done
echo "Done."
