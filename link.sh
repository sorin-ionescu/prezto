#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source local overrides if present
# See zpreztoconf.example for available options
if [[ -f "$HOME/.zpreztoconf" ]]; then
  source "$HOME/.zpreztoconf"
fi

# Link conf files as dotfiles, applying any CONF_<name> overrides
for f in "$SCRIPT_DIR"/conf/*; do
  name="$(basename "$f")"
  override_var="CONF_${name}"
  if [[ -n "${!override_var}" ]]; then
    ln -sf "$SCRIPT_DIR/${!override_var}" "$HOME/.$name"
  else
    ln -sf "$f" "$HOME/.$name"
  fi
done

# Bin scripts
mkdir -p "$HOME/bin"
for f in "$SCRIPT_DIR"/bin/*; do
  ln -sf "$f" "$HOME/bin/$(basename "$f")"
done

# Neovim (link vimrc as init.vim)
mkdir -p "$HOME/.config/nvim"
ln -sf "$HOME/.vimrc" "$HOME/.config/nvim/init.vim"

# Doom emacs
mkdir -p "$HOME/.config"
ln -sf "$SCRIPT_DIR/doom" "$HOME/.config/doom"

# Claude settings and skills
mkdir -p "$HOME/.claude/skills"
if [[ ! -f "$HOME/.claude/settings.json" ]]; then
  cp "$SCRIPT_DIR/claude/settings.json" "$HOME/.claude/settings.json"
fi
for d in "$SCRIPT_DIR"/claude/skills/*/; do
  ln -sf "$d" "$HOME/.claude/skills/$(basename "$d")"
done
