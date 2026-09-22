#!/usr/bin/env bash
#
# Universal Skill Installer for Humanizer 2.0
# Installs Humanizer 2.0 into your agent of choice (Antigravity, Claude Code, Cursor, OpenAgents)
#
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${1:-auto}"

echo "=========================================================="
echo "  Humanizer 2.0 - Universal Agent Skill Installer"
echo "=========================================================="

install_to_path() {
    local dest="$1"
    echo "Installing Humanizer skill into: $dest"
    mkdir -p "$dest"
    cp -r "$SCRIPT_DIR/SKILL.md" "$dest/"
    cp -r "$SCRIPT_DIR/references" "$dest/"
    cp -r "$SCRIPT_DIR/examples" "$dest/"
    cp -r "$SCRIPT_DIR/scripts" "$dest/"
    echo " Successfully installed into $dest"
}

case "$TARGET" in
    antigravity-global)
        DEST="$HOME/.gemini/antigravity/skills/humanizer"
        install_to_path "$DEST"
        ;;
    antigravity-local|local)
        DEST="./.agents/skills/humanizer"
        install_to_path "$DEST"
        ;;
    claude-global)
        DEST="$HOME/.claude/skills/humanizer"
        install_to_path "$DEST"
        ;;
    claude-local)
        DEST="./.claude/skills/humanizer"
        install_to_path "$DEST"
        ;;
    cursor)
        if [ -f "$SCRIPT_DIR/integrations/.cursorrules" ]; then
            echo "Copying .cursorrules to current directory..."
            cat "$SCRIPT_DIR/integrations/.cursorrules" >> .cursorrules
            echo " Appended Humanizer rules to .cursorrules"
        fi
        ;;
    --help|-h|help)
        echo "Usage: ./install.sh [target]"
        echo "Available targets:"
        echo "  ./install.sh antigravity-global  -> ~/.gemini/antigravity/skills/humanizer"
        echo "  ./install.sh antigravity-local   -> ./.agents/skills/humanizer"
        echo "  ./install.sh claude-global       -> ~/.claude/skills/humanizer"
        echo "  ./install.sh claude-local        -> ./.claude/skills/humanizer"
        echo "  ./install.sh cursor              -> appends rules to .cursorrules"
        echo "  ./install.sh local               -> ./.agents/skills/humanizer"
        echo "  ./install.sh auto                -> automatically detects agent environment"
        exit 0
        ;;
    auto|"")
        echo "Auto-detecting agent configuration..."
        INSTALLED=0
        if [ -d "$HOME/.gemini/antigravity" ]; then
            echo "-> Detected Google Antigravity installation."
            install_to_path "$HOME/.gemini/antigravity/skills/humanizer"
            INSTALLED=1
        fi
        if [ -d "$HOME/.claude" ]; then
            echo "-> Detected Claude CLI configuration."
            install_to_path "$HOME/.claude/skills/humanizer"
            INSTALLED=1
        fi
        if [ -d "./.agents" ] || [ ! -d "$HOME/.gemini" -a ! -d "$HOME/.claude" ]; then
            echo "-> Installing to workspace ./.agents/skills/humanizer..."
            install_to_path "./.agents/skills/humanizer"
            INSTALLED=1
        fi
        if [ "$INSTALLED" -eq 0 ]; then
            echo "No agent environments automatically detected."
            echo "Usage: ./install.sh [antigravity-global | antigravity-local | claude-global | claude-local | cursor | local]"
        fi
        ;;
    *)
        echo "Unknown target: $TARGET"
        echo "Available options:"
        echo "  ./install.sh antigravity-global  -> ~/.gemini/antigravity/skills/humanizer"
        echo "  ./install.sh antigravity-local   -> ./.agents/skills/humanizer"
        echo "  ./install.sh claude-global       -> ~/.claude/skills/humanizer"
        echo "  ./install.sh claude-local        -> ./.claude/skills/humanizer"
        echo "  ./install.sh cursor              -> appends rules to .cursorrules"
        echo "  ./install.sh local               -> ./.agents/skills/humanizer"
        exit 1
        ;;
esac

echo ""
echo "Installation complete! To test the narrative auditor CLI, run:"
echo "  python3 scripts/audit_narrative.py examples/sample_narratives/raw_ai_story.txt"
echo "=========================================================="
