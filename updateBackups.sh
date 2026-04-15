#!/usr/bin/env bash
#
# backup-dotfiles.sh
# Copies common bash, git, tmux, and vim config files into
# organised folders alongside this script.
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ---------- helpers ----------

copy_if_exists() {
    local src="$1"
    local dest_dir="$2"

    if [[ -f "$src" ]]; then
        mkdir -p "$dest_dir"
        cp -v "$src" "$dest_dir/"
    else
        echo "  skipped (not found): $src"
    fi
}

# ---------- bash ----------

echo "==> Backing up bash configs"
BASH_DIR="$SCRIPT_DIR/bash"

copy_if_exists "$HOME/.bashrc"        "$BASH_DIR"
# copy_if_exists "$HOME/.bash_profile"  "$BASH_DIR"
copy_if_exists "$HOME/.bash_aliases"  "$BASH_DIR"
# copy_if_exists "$HOME/.bash_logout"   "$BASH_DIR"
# copy_if_exists "$HOME/.profile"       "$BASH_DIR"
# copy_if_exists "$HOME/.inputrc"       "$BASH_DIR"

# ---------- git ----------

echo ""
echo "==> Backing up git configs"
GIT_DIR="$SCRIPT_DIR/git"

copy_if_exists "$HOME/.gitconfig"     "$GIT_DIR"
copy_if_exists "$HOME/.gitignore"     "$GIT_DIR"
# copy_if_exists "$HOME/.gitattributes" "$GIT_DIR"

# Also try XDG location (~/.config/git/)
# copy_if_exists "${XDG_CONFIG_HOME:-$HOME/.config}/git/config"  "$GIT_DIR"
# copy_if_exists "${XDG_CONFIG_HOME:-$HOME/.config}/git/ignore"  "$GIT_DIR"
# copy_if_exists "${XDG_CONFIG_HOME:-$HOME/.config}/git/attributes" "$GIT_DIR"

# ---------- tmux ----------

echo ""
echo "==> Backing up tmux configs"
TMUX_DIR="$SCRIPT_DIR/tmux"

copy_if_exists "$HOME/.tmux.conf"     "$TMUX_DIR"

# XDG location
# copy_if_exists "${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf" "$TMUX_DIR"

# ---------- vim ----------

echo ""
echo "==> Backing up vim configs"
VIM_DIR="$SCRIPT_DIR/vim"

copy_if_exists "$HOME/.vimrc"         "$VIM_DIR"
# copy_if_exists "$HOME/.gvimrc"        "$VIM_DIR"
# copy_if_exists "$HOME/.exrc"          "$VIM_DIR"

# XDG / Neovim location
# copy_if_exists "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.vim"  "$VIM_DIR"
# copy_if_exists "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.lua"  "$VIM_DIR"

# ---------- summary ----------

echo ""
echo "Done! Backed-up configs are in:"
for d in "$BASH_DIR" "$GIT_DIR" "$TMUX_DIR" "$VIM_DIR"; do
    if [[ -d "$d" ]]; then
        echo "  $d/ ($(ls -1A "$d" | wc -l) file(s))"
    else
        echo "  $(basename "$d")/ — no files found, folder not created"
    fi
done
