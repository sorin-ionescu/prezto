#
# Provides Git aliases and functions.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[git] )); then
  return 1
fi

# Load dependencies.
pmodload 'helper'

if ! zstyle -t ':prezto:modules:git' no-aliases; then
  # Source module files.
  source "${0:h}/alias.zsh"
fi

if zstyle -t ':prezto:modules:git' escape-magic; then
  fpath=("${0:h}/external" $fpath)

  autoload -Uz git-escape-magic && git-escape-magic
fi
