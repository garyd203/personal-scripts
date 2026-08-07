#!/usr/bin/env bash
# Symlink Claude's config directory with the concrete skill & agent implementations in various repos, rsync-style:
#   - each listed path gets a symlink named after its basename.
#   - any obsolete symlink in the target directory that is not in the list is removed.
#
# Real files and directories are never touched.

set -euo pipefail
shopt -s nullglob dotglob

DATARO="$HOME/devel/ai-agent-tooling"
PERSONAL="$HOME/devel/gazzas-personal-scripts"

SKILLS=(
    "$PERSONAL/claude/skills/mystic-tdd"
    "$PERSONAL/claude/skills/retro"
)

AGENTS=(
    "$PERSONAL/claude/agents/code-review-no-slop.md"
)

# sync_links <target_dir> <source_path>...
sync_links() {
    local target_dir=$1; shift
    local src link name keep

    mkdir -p "$target_dir"

    for link in "$target_dir"/*; do
        [ -L "$link" ] || continue
        name=$(basename "$link")
        keep=no
        for src in "$@"; do
            [ "$(basename "$src")" = "$name" ] && keep=yes
        done
        if [ "$keep" = no ]; then
            rm "$link"
            echo "removed $link"
        fi
    done

    for src in "$@"; do
        name=$(basename "$src")
        link="$target_dir/$name"
        if [ ! -e "$src" ]; then
            echo "warning: $src does not exist, skipping" >&2
            continue
        fi
        if [ -e "$link" ] && [ ! -L "$link" ]; then
            echo "warning: $link is not a symlink, leaving it alone" >&2
            continue
        fi
        if [ "$(readlink "$link" 2>/dev/null)" = "$src" ]; then
            continue
        fi
        ln -sfn "$src" "$link"
        echo "linked $link -> $src"
    done
}

sync_links "$HOME/.claude/skills" "${SKILLS[@]}"
sync_links "$HOME/.claude/agents" "${AGENTS[@]}"
