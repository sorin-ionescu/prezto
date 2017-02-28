#!/bin/zsh
setopt EXTENDED_GLOB

DIR=$(dirname $0)

for rcfile in $DIR/runcoms/^README.md(.N); do
  ln -s $rcfile "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
