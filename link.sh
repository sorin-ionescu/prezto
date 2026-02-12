#!/usr/bin/env bash

for f in `ls conf`; do
  ln -sf $(pwd)/conf/$f $HOME/.$f
done

ln -sf $(pwd)/doom $HOME/.config/doom

mkdir -p "$HOME/.claude/commands"
for f in `ls claude-commands`; do
  ln -sf $(pwd)/claude-commands/$f $HOME/.claude/commands/$f
done
