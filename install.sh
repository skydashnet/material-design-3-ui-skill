#!/usr/bin/env bash
set -euo pipefail

REPO="skydashnet/material-design-3-ui-skill"
REF="${MD3_SKILL_REF:-main}"
SKILL_ID="material-design-3-ui"
MODE="all"
FORCE=0
LINK=0
SOURCE=""

usage() {
  cat <<'EOF'
Material Design 3 UI Skill installer

Usage:
  ./install.sh [options]

Options:
  --all                 Install to all supported agent locations (default)
  --detect              Install only for detected agents/config directories
  --agent <name>        Install only for one agent; repeatable
                        claude, codex, antigravity, kiro, opencode, hermes, openclaw
  --source <SKILL.md>   Use a local skill package rooted beside this SKILL.md
  --link                Symlink the local skill package instead of copying it
  --force               Replace an existing different installation
  -h, --help            Show this help

Environment:
  MD3_SKILL_REF         Git ref used for remote downloads (default: main)
  OPENCLAW_STATE_DIR    Optional OpenClaw state-directory override
EOF
}

declare -a REQUESTED=()

while (($#)); do
  case "$1" in
    --all) MODE="all"; shift ;;
    --detect) MODE="detect"; shift ;;
    --agent)
      [[ $# -ge 2 ]] || { echo "error: --agent requires a value" >&2; exit 2; }
      if [[ "${MODE}" != "selected" ]]; then REQUESTED=(); fi
      MODE="selected"
      REQUESTED+=("$2")
      shift 2
      ;;
    --source)
      [[ $# -ge 2 ]] || { echo "error: --source requires a path" >&2; exit 2; }
      SOURCE="$2"; shift 2 ;;
    --link) LINK=1; shift ;;
    --force) FORCE=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "error: unknown option: $1" >&2; usage >&2; exit 2 ;;
  esac
done

case "$(uname -s 2>/dev/null || true)" in
  Darwin) OS="macOS" ;;
  Linux) OS="Linux" ;;
  MINGW*|MSYS*|CYGWIN*) OS="Windows" ;;
  *) OS="Unix" ;;
esac

HOME_DIR="${HOME:?HOME is not set}"
TMP_DIR=""

cleanup() {
  if [[ -n "${TMP_DIR}" && -d "${TMP_DIR}" ]]; then
    rm -rf "${TMP_DIR}"
  fi
  return 0
}
trap cleanup EXIT

download() {
  local url="$1" out="$2"
  mkdir -p "$(dirname -- "$out")"
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$url" -o "$out"
  elif command -v wget >/dev/null 2>&1; then
    wget -qO "$out" "$url"
  else
    echo "error: curl or wget is required for remote installation." >&2
    exit 1
  fi
}

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || true)"
if [[ -z "${SOURCE}" && -n "${SCRIPT_DIR}" && -f "${SCRIPT_DIR}/SKILL.md" ]]; then
  SOURCE="${SCRIPT_DIR}/SKILL.md"
fi

if [[ -n "${SOURCE}" ]]; then
  SOURCE="$(cd -- "$(dirname -- "$SOURCE")" && pwd)/$(basename -- "$SOURCE")"
  [[ -f "$SOURCE" ]] || { echo "error: SKILL.md not found: $SOURCE" >&2; exit 1; }
  PACKAGE_ROOT="$(dirname -- "$SOURCE")"
  MANIFEST="${PACKAGE_ROOT}/skill-files.txt"
  [[ -f "$MANIFEST" ]] || { echo "error: skill-files.txt not found beside local SKILL.md" >&2; exit 1; }
else
  (( LINK == 0 )) || { echo "error: --link requires a local clone or --source." >&2; exit 2; }
  TMP_DIR="$(mktemp -d)"
  PACKAGE_ROOT="${TMP_DIR}/package"
  MANIFEST="${PACKAGE_ROOT}/skill-files.txt"
  BASE_URL="https://raw.githubusercontent.com/${REPO}/${REF}"

  echo "Downloading Material Design 3 UI Skill package from ${REPO}@${REF}..."
  download "${BASE_URL}/skill-files.txt" "$MANIFEST"

  while IFS= read -r rel || [[ -n "$rel" ]]; do
    [[ -z "$rel" || "$rel" == \#* ]] && continue
    case "$rel" in
      /*|../*|*/../*|*/..)
        echo "error: unsafe path in skill-files.txt: $rel" >&2
        exit 1
        ;;
    esac
    download "${BASE_URL}/${rel}" "${PACKAGE_ROOT}/${rel}"
  done < "$MANIFEST"

  SOURCE="${PACKAGE_ROOT}/SKILL.md"
fi

if ! grep -Eq '^name:[[:space:]]*material-design-3-ui[[:space:]]*$' "$SOURCE"; then
  echo "error: package does not contain the expected material-design-3-ui SKILL.md" >&2
  exit 1
fi

mapfile_compat() {
  PACKAGE_FILES=()
  while IFS= read -r rel || [[ -n "$rel" ]]; do
    [[ -z "$rel" || "$rel" == \#* ]] && continue
    case "$rel" in
      /*|../*|*/../*|*/..)
        echo "error: unsafe path in skill-files.txt: $rel" >&2
        exit 1
        ;;
    esac
    [[ -f "${PACKAGE_ROOT}/${rel}" ]] || { echo "error: package file missing: $rel" >&2; exit 1; }
    PACKAGE_FILES+=("$rel")
  done < "$MANIFEST"
}
mapfile_compat

dest_for() {
  case "$1" in
    claude)      printf '%s\n' "${HOME_DIR}/.claude/skills/${SKILL_ID}" ;;
    codex)       printf '%s\n' "${HOME_DIR}/.agents/skills/${SKILL_ID}" ;;
    antigravity) printf '%s\n' "${HOME_DIR}/.gemini/config/skills/${SKILL_ID}" ;;
    kiro)        printf '%s\n' "${HOME_DIR}/.kiro/skills/${SKILL_ID}" ;;
    opencode)    printf '%s\n' "${HOME_DIR}/.config/opencode/skills/${SKILL_ID}" ;;
    hermes)      printf '%s\n' "${HOME_DIR}/.hermes/skills/${SKILL_ID}" ;;
    openclaw)    printf '%s\n' "${OPENCLAW_STATE_DIR:-${HOME_DIR}/.openclaw}/skills/${SKILL_ID}" ;;
    *) return 1 ;;
  esac
}

detected() {
  case "$1" in
    claude)
      command -v claude >/dev/null 2>&1 || [[ -d "${HOME_DIR}/.claude" ]] ;;
    codex)
      command -v codex >/dev/null 2>&1 || [[ -d "${HOME_DIR}/.codex" || -d "${HOME_DIR}/.agents" ]] ;;
    antigravity)
      command -v agy >/dev/null 2>&1 || [[ -d "${HOME_DIR}/.gemini/config" ]] ;;
    kiro)
      command -v kiro-cli >/dev/null 2>&1 || command -v kiro >/dev/null 2>&1 || [[ -d "${HOME_DIR}/.kiro" ]] ;;
    opencode)
      command -v opencode >/dev/null 2>&1 || [[ -d "${HOME_DIR}/.config/opencode" ]] ;;
    hermes)
      command -v hermes >/dev/null 2>&1 || [[ -d "${HOME_DIR}/.hermes" ]] ;;
    openclaw)
      command -v openclaw >/dev/null 2>&1 || [[ -d "${OPENCLAW_STATE_DIR:-${HOME_DIR}/.openclaw}" ]] ;;
    *) return 1 ;;
  esac
}

ALL_AGENTS=(claude codex antigravity kiro opencode hermes openclaw)
declare -a TARGETS=()

case "$MODE" in
  all)
    TARGETS=("${ALL_AGENTS[@]}")
    ;;
  detect)
    for agent in "${ALL_AGENTS[@]}"; do
      if detected "$agent"; then TARGETS+=("$agent"); fi
    done
    ;;
  selected)
    for agent in "${REQUESTED[@]}"; do
      case "$agent" in
        claude|codex|antigravity|kiro|opencode|hermes|openclaw) TARGETS+=("$agent") ;;
        *) echo "error: unsupported agent: $agent" >&2; exit 2 ;;
      esac
    done
    ;;
esac

if ((${#TARGETS[@]} == 0)); then
  echo "No supported agents detected. Re-run with --all or --agent <name>."
  exit 0
fi

package_same() {
  local dest="$1" rel
  [[ -d "$dest" || -L "$dest" ]] || return 1
  for rel in "${PACKAGE_FILES[@]}"; do
    [[ -f "$dest/$rel" ]] || return 1
    cmp -s "${PACKAGE_ROOT}/${rel}" "$dest/$rel" || return 1
  done
  return 0
}

install_copy() {
  local agent="$1" dest="$2" rel

  if [[ -L "$dest" || -e "$dest" ]]; then
    if package_same "$dest"; then
      printf '  %-12s already up to date  %s\n' "$agent" "$dest"
      return
    fi
    if (( FORCE == 0 )); then
      printf '  %-12s skipped (exists; use --force)  %s\n' "$agent" "$dest"
      return
    fi
    rm -rf "$dest"
  fi

  mkdir -p "$dest"
  for rel in "${PACKAGE_FILES[@]}"; do
    mkdir -p "$(dirname -- "$dest/$rel")"
    cp "${PACKAGE_ROOT}/${rel}" "$dest/$rel"
  done
  printf '  %-12s installed %d files  %s\n' "$agent" "${#PACKAGE_FILES[@]}" "$dest"
}

install_link() {
  local agent="$1" dest="$2"

  if [[ -L "$dest" ]]; then
    local current
    current="$(readlink "$dest" || true)"
    if [[ "$current" == "$PACKAGE_ROOT" ]]; then
      printf '  %-12s already linked      %s\n' "$agent" "$dest"
      return
    fi
  fi

  if [[ -e "$dest" || -L "$dest" ]]; then
    if (( FORCE == 0 )); then
      printf '  %-12s skipped (exists; use --force)  %s\n' "$agent" "$dest"
      return
    fi
    rm -rf "$dest"
  fi

  mkdir -p "$(dirname -- "$dest")"
  ln -s "$PACKAGE_ROOT" "$dest"
  printf '  %-12s linked              %s -> %s\n' "$agent" "$dest" "$PACKAGE_ROOT"
}

echo
echo "Material Design 3 UI Skill"
echo "OS: ${OS}"
echo "Mode: ${MODE}"
echo "Package files: ${#PACKAGE_FILES[@]}"
echo

declare -A SEEN_DESTS=()
for agent in "${TARGETS[@]}"; do
  dest="$(dest_for "$agent")"
  if [[ -n "${SEEN_DESTS[$dest]:-}" ]]; then
    printf '  %-12s covered by %s      %s\n' "$agent" "${SEEN_DESTS[$dest]}" "$dest"
    continue
  fi
  SEEN_DESTS["$dest"]="$agent"

  if (( LINK == 1 )); then
    install_link "$agent" "$dest"
  else
    install_copy "$agent" "$dest"
  fi
done

echo
echo "Done."
echo "Restart an agent only if it does not detect the new skill automatically."
