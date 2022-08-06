#!/bin/zsh

cd $ZPREZTODIR
git clone --recurse-submodules https://github.com/belak/prezto-contrib contrib

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh
