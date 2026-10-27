#!/usr/bin/env bash
#
# Universal Skill Installer for Humanizer 2.0
# Installs Humanizer into all AI agent environments:
# Universal Standard (~/.agents/skills, .agents/skills),
# Google Antigravity, Claude Code, Cursor, Windsurf, Codex, Cline, OpenHands, GitHub Copilot, Gemini CLI
#
set -e

SKILL_NAME="humanizer"
REPO_URL="https://github.com/Norbert-Brett/humanizer-skill.git"

# Resolve script directory (handle symlinks and piped execution)
if [ -n "${BASH_SOURCE[0]}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
else
    SCRIPT_DIR="$(pwd)"
fi

# If SKILL.md is missing in SCRIPT_DIR (e.g. piped via curl), fetch via git
TEMP_DIR=""
cleanup() {
    if [ -n "$TEMP_DIR" ] && [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
    fi
}
trap cleanup EXIT

if [ ! -f "$SCRIPT_DIR/SKILL.md" ]; then
    echo "SKILL.md not found in current directory. Fetching Humanizer repository..."
    TEMP_DIR="$(mktemp -d 2>/dev/null || mktemp -d -t 'humanizer-install')"
    git clone --depth 1 "$REPO_URL" "$TEMP_DIR" >/dev/null 2>&1
    SCRIPT_DIR="$TEMP_DIR"
fi

echo "=========================================================="
echo "  Humanizer 2.0 - Universal Agent Skill Installer"
echo "=========================================================="

# Parse arguments
TARGET="auto"
SCOPE=""       # "global", "local", or "" (auto)
USE_COPY=0     # 0 = symlink where possible, 1 = copy
INSTALL_RULES=1
INSTALL_ALL_AGENTS=0

while [ $# -gt 0 ]; do
    case "$1" in
        --help|-h|help)
            echo "Usage: ./install.sh [target] [options]"
            echo ""
            echo "Targets:"
            echo "  auto (default)       Auto-detect agent environments and install universally"
            echo "  universal | all      Install to universal .agents/skills and all supported agents"
            echo "  global               Install universally for user across all global agents (~/.agents/skills)"
            echo "  local | workspace    Install into project workspace (.agents/skills) and link to local agents"
            echo "  antigravity          Install to Google Antigravity (global: ~/.gemini/antigravity/skills)"
            echo "  claude               Install to Claude Code (~/.claude/skills and .claude/skills)"
            echo "  cursor               Install to Cursor (~/.cursor/skills, .cursor/skills, and .cursorrules)"
            echo "  windsurf             Install to Windsurf (~/.windsurf/skills and .windsurfrules)"
            echo "  codex                Install to OpenAI Codex (~/.codex/skills)"
            echo "  cline                Install to Cline / Roo Code (~/.cline/skills and .clinerules)"
            echo "  copilot              Install to GitHub Copilot (~/.copilot/skills and instructions)"
            echo "  openhands            Install to OpenHands (~/.openhands/skills)"
            echo "  gemini               Install to Gemini CLI (~/.gemini/skills)"
            echo ""
            echo "Options:"
            echo "  -g, --global         Force global (user home) installation"
            echo "  -l, --local          Force local (project workspace) installation"
            echo "  --all                Deploy to all known agents regardless of detection"
            echo "  --copy               Copy files instead of creating relative/absolute symlinks"
            echo "  --no-rules           Skip copying editor rule files (.cursorrules, .clinerules, etc.)"
            echo ""
            echo "Examples:"
            echo "  ./install.sh                     # Auto-detect and install universally"
            echo "  ./install.sh --global            # Install globally across all user agents"
            echo "  ./install.sh --local             # Install locally in current project"
            echo "  ./install.sh all                 # Install to every supported agent directory"
            echo "  curl -sSL https://raw.githubusercontent.com/Norbert-Brett/humanizer-skill/main/install.sh | bash"
            exit 0
            ;;
        -g|--global|global)
            SCOPE="global"
            ;;
        -l|--local|local|workspace)
            SCOPE="local"
            ;;
        --all)
            INSTALL_ALL_AGENTS=1
            ;;
        --copy)
            USE_COPY=1
            ;;
        --no-rules)
            INSTALL_RULES=0
            ;;
        universal|all)
            TARGET="universal"
            INSTALL_ALL_AGENTS=1
            ;;
        antigravity-global)
            TARGET="antigravity"
            SCOPE="global"
            ;;
        antigravity-local)
            TARGET="antigravity"
            SCOPE="local"
            ;;
        claude-global)
            TARGET="claude"
            SCOPE="global"
            ;;
        claude-local)
            TARGET="claude"
            SCOPE="local"
            ;;
        antigravity|claude|cursor|windsurf|codex|cline|copilot|openhands|gemini)
            TARGET="$1"
            ;;
        auto)
            TARGET="auto"
            ;;
        *)
            echo "Warning: Unrecognized argument '$1'. Run './install.sh --help' for usage."
            ;;
    esac
    shift
done

# Helper: copy payload
copy_skill_payload() {
    local dest="$1"
    mkdir -p "$dest" 2>/dev/null || return 1
    cp -r "$SCRIPT_DIR/SKILL.md" "$dest/" 2>/dev/null || return 1
    cp -r "$SCRIPT_DIR/references" "$dest/" 2>/dev/null || return 1
    cp -r "$SCRIPT_DIR/examples" "$dest/" 2>/dev/null || return 1
    cp -r "$SCRIPT_DIR/scripts" "$dest/" 2>/dev/null || return 1
    return 0
}

# Helper: link or copy
link_or_copy_skill() {
    local src="$1"
    local dest="$2"

    if [ "$src" = "$dest" ]; then
        return 0
    fi

    local parent_dir
    parent_dir="$(dirname "$dest")"
    if ! mkdir -p "$parent_dir" 2>/dev/null; then
        echo "  [Skipped] $dest (cannot create parent directory - permission denied)"
        return 0
    fi

    # Remove existing dest if it's already a symlink or directory
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        if [ ! -w "$dest" ] && [ ! -w "$parent_dir" ]; then
            echo "  [Skipped] $dest (permission denied - read-only or owned by another user)"
            return 0
        fi
        if ! rm -rf "$dest" 2>/dev/null; then
            echo "  [Skipped] $dest (cannot remove existing path - permission denied)"
            return 0
        fi
    fi

    if [ "$USE_COPY" -eq 1 ]; then
        if copy_skill_payload "$dest"; then
            echo "  [Copied]  $dest"
        else
            echo "  [Skipped] $dest (copy failed - permission denied)"
        fi
    else
        # Try relative symlink if within same tree, else absolute symlink
        if ln -s "$src" "$dest" 2>/dev/null; then
            echo "  [Linked]  $dest -> $src"
        else
            if copy_skill_payload "$dest"; then
                echo "  [Copied (fallback)] $dest"
            else
                echo "  [Skipped] $dest (symlink/copy failed - permission denied)"
            fi
        fi
    fi
}

# Determine default scope if not explicitly given
if [ -z "$SCOPE" ]; then
    # If invoked inside a project (has .git, package.json, pyproject.toml, or .agents)
    if [ -d "./.git" ] || [ -f "./package.json" ] || [ -f "./pyproject.toml" ] || [ -d "./.agents" ]; then
        # When run from the skill repo itself and not installing locally, default to global so developer can use skill anywhere
        if [ "$SCRIPT_DIR" = "$(pwd)" ] && [ -f "./SKILL.md" ] && [ "$TARGET" = "auto" ]; then
            SCOPE="both"
        else
            SCOPE="local"
        fi
    else
        SCOPE="global"
    fi
fi

INSTALLED_COUNT=0

# ==========================================================
# 1. GLOBAL INSTALLATION
# ==========================================================
install_global() {
    echo ""
    echo "--- Installing Global Agent Skills (~/.agents/skills) ---"
    local global_hub="$HOME/.agents/skills/$SKILL_NAME"
    echo "Primary Universal Hub: $global_hub"
    if copy_skill_payload "$global_hub"; then
        echo "  [Installed] $global_hub"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    else
        echo "  [Warning] Could not write to $global_hub"
    fi

    # Google Antigravity
    if [ "$INSTALL_ALL_AGENTS" -eq 1 ] || [ "$TARGET" = "antigravity" ] || [ -d "$HOME/.gemini/antigravity" ] || [ -n "$ANTIGRAVITY_AGENT" ]; then
        link_or_copy_skill "$global_hub" "$HOME/.gemini/antigravity/skills/$SKILL_NAME"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi

    # Gemini CLI
    if [ "$INSTALL_ALL_AGENTS" -eq 1 ] || [ "$TARGET" = "gemini" ] || [ -d "$HOME/.gemini" ]; then
        link_or_copy_skill "$global_hub" "$HOME/.gemini/skills/$SKILL_NAME"
        if [ -d "$HOME/.gemini/config" ] || [ "$INSTALL_ALL_AGENTS" -eq 1 ]; then
            link_or_copy_skill "$global_hub" "$HOME/.gemini/config/skills/$SKILL_NAME"
        fi
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi

    # Claude Code
    if [ "$INSTALL_ALL_AGENTS" -eq 1 ] || [ "$TARGET" = "claude" ] || [ -d "$HOME/.claude" ] || [ -f "$HOME/.claude.json" ]; then
        link_or_copy_skill "$global_hub" "$HOME/.claude/skills/$SKILL_NAME"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi

    # Cursor
    if [ "$INSTALL_ALL_AGENTS" -eq 1 ] || [ "$TARGET" = "cursor" ] || [ -d "$HOME/.cursor" ]; then
        link_or_copy_skill "$global_hub" "$HOME/.cursor/skills/$SKILL_NAME"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi

    # Codex
    if [ "$INSTALL_ALL_AGENTS" -eq 1 ] || [ "$TARGET" = "codex" ] || [ -d "$HOME/.codex" ]; then
        link_or_copy_skill "$global_hub" "$HOME/.codex/skills/$SKILL_NAME"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi

    # Windsurf
    if [ "$INSTALL_ALL_AGENTS" -eq 1 ] || [ "$TARGET" = "windsurf" ] || [ -d "$HOME/.codeium/windsurf" ] || [ -d "$HOME/.windsurf" ]; then
        link_or_copy_skill "$global_hub" "$HOME/.codeium/windsurf/skills/$SKILL_NAME"
        link_or_copy_skill "$global_hub" "$HOME/.windsurf/skills/$SKILL_NAME"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi

    # Cline & Roo Code
    if [ "$INSTALL_ALL_AGENTS" -eq 1 ] || [ "$TARGET" = "cline" ] || [ -d "$HOME/.cline" ] || [ -d "$HOME/.roo" ]; then
        link_or_copy_skill "$global_hub" "$HOME/.cline/skills/$SKILL_NAME"
        link_or_copy_skill "$global_hub" "$HOME/.roo/skills/$SKILL_NAME"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi

    # GitHub Copilot
    if [ "$INSTALL_ALL_AGENTS" -eq 1 ] || [ "$TARGET" = "copilot" ] || [ -d "$HOME/.copilot" ]; then
        link_or_copy_skill "$global_hub" "$HOME/.copilot/skills/$SKILL_NAME"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi

    # OpenHands
    if [ "$INSTALL_ALL_AGENTS" -eq 1 ] || [ "$TARGET" = "openhands" ] || [ -d "$HOME/.openhands" ]; then
        link_or_copy_skill "$global_hub" "$HOME/.openhands/skills/$SKILL_NAME"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi
}

# ==========================================================
# 2. LOCAL / WORKSPACE INSTALLATION
# ==========================================================
install_local() {
    echo ""
    echo "--- Installing Workspace Agent Skills (.agents/skills) ---"
    local local_hub="$(pwd)/.agents/skills/$SKILL_NAME"
    echo "Primary Workspace Hub: $local_hub"
    if copy_skill_payload "$local_hub"; then
        echo "  [Installed] $local_hub"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    else
        echo "  [Warning] Could not write to $local_hub"
    fi

    # Link to Claude Code workspace path (.claude/skills)
    if [ "$INSTALL_ALL_AGENTS" -eq 1 ] || [ "$TARGET" = "claude" ] || [ -d "./.claude" ] || [ -d "$HOME/.claude" ]; then
        link_or_copy_skill "$local_hub" "$(pwd)/.claude/skills/$SKILL_NAME"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi

    # Link to Cursor workspace path (.cursor/skills)
    if [ "$INSTALL_ALL_AGENTS" -eq 1 ] || [ "$TARGET" = "cursor" ] || [ -d "./.cursor" ] || [ -f "./.cursorrules" ]; then
        link_or_copy_skill "$local_hub" "$(pwd)/.cursor/skills/$SKILL_NAME"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi

    # Link to Windsurf workspace path (.windsurf/skills)
    if [ "$INSTALL_ALL_AGENTS" -eq 1 ] || [ "$TARGET" = "windsurf" ] || [ -d "./.windsurf" ] || [ -f "./.windsurfrules" ]; then
        link_or_copy_skill "$local_hub" "$(pwd)/.windsurf/skills/$SKILL_NAME"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi

    # Link to Codex workspace path (.codex/skills)
    if [ "$INSTALL_ALL_AGENTS" -eq 1 ] || [ "$TARGET" = "codex" ] || [ -d "./.codex" ]; then
        link_or_copy_skill "$local_hub" "$(pwd)/.codex/skills/$SKILL_NAME"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi

    # Link to Cline / Roo Code workspace path (.cline/skills)
    if [ "$INSTALL_ALL_AGENTS" -eq 1 ] || [ "$TARGET" = "cline" ] || [ -d "./.cline" ] || [ -f "./.clinerules" ]; then
        link_or_copy_skill "$local_hub" "$(pwd)/.cline/skills/$SKILL_NAME"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi

    # Link to GitHub Copilot workspace path (.github/skills)
    if [ "$INSTALL_ALL_AGENTS" -eq 1 ] || [ "$TARGET" = "copilot" ] || [ -d "./.github" ]; then
        link_or_copy_skill "$local_hub" "$(pwd)/.github/skills/$SKILL_NAME"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi

    # Link to OpenHands workspace path (.openhands/skills)
    if [ "$INSTALL_ALL_AGENTS" -eq 1 ] || [ "$TARGET" = "openhands" ] || [ -d "./.openhands" ]; then
        link_or_copy_skill "$local_hub" "$(pwd)/.openhands/skills/$SKILL_NAME"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi

    # Optional rule files installation
    if [ "$INSTALL_RULES" -eq 1 ]; then
        if [ "$TARGET" = "cursor" ] || [ -f "./.cursorrules" ] || [ "$INSTALL_ALL_AGENTS" -eq 1 ]; then
            if [ -f "$SCRIPT_DIR/integrations/.cursorrules" ] && [ ! -f "./.cursorrules" ]; then
                cp "$SCRIPT_DIR/integrations/.cursorrules" ./.cursorrules
                echo "  [Rule Created] ./.cursorrules"
            fi
            if [ -f "$SCRIPT_DIR/integrations/cursor-rules.mdc" ]; then
                mkdir -p ./.cursor/rules
                cp "$SCRIPT_DIR/integrations/cursor-rules.mdc" ./.cursor/rules/humanizer.mdc
                echo "  [Rule Created] ./.cursor/rules/humanizer.mdc"
            fi
        fi

        if [ "$TARGET" = "windsurf" ] || [ -f "./.windsurfrules" ] || [ "$INSTALL_ALL_AGENTS" -eq 1 ]; then
            if [ -f "$SCRIPT_DIR/integrations/.windsurfrules" ] && [ ! -f "./.windsurfrules" ]; then
                cp "$SCRIPT_DIR/integrations/.windsurfrules" ./.windsurfrules
                echo "  [Rule Created] ./.windsurfrules"
            fi
        fi

        if [ "$TARGET" = "cline" ] || [ -f "./.clinerules" ] || [ "$INSTALL_ALL_AGENTS" -eq 1 ]; then
            if [ -f "$SCRIPT_DIR/integrations/.clinerules" ] && [ ! -f "./.clinerules" ]; then
                cp "$SCRIPT_DIR/integrations/.clinerules" ./.clinerules
                echo "  [Rule Created] ./.clinerules"
            fi
        fi

        if [ "$TARGET" = "copilot" ] || [ -d "./.github" ] || [ "$INSTALL_ALL_AGENTS" -eq 1 ]; then
            if [ -f "$SCRIPT_DIR/integrations/copilot-instructions.md" ] && [ ! -f "./.github/copilot-instructions.md" ]; then
                mkdir -p ./.github
                cp "$SCRIPT_DIR/integrations/copilot-instructions.md" ./.github/copilot-instructions.md
                echo "  [Rule Created] ./.github/copilot-instructions.md"
            fi
        fi
    fi
}

# Execute based on scope
case "$SCOPE" in
    global)
        install_global
        ;;
    local)
        install_local
        ;;
    both)
        install_global
        install_local
        ;;
esac

echo ""
echo "=========================================================="
echo " Installation complete! ($INSTALLED_COUNT locations updated)"
echo ""
echo "To test the narrative auditor CLI, run:"
echo "  python3 scripts/audit_narrative.py examples/sample_narratives/raw_ai_story.txt"
echo "=========================================================="
