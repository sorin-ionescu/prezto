#
# Provides Git aliases and functions.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

if (( ! $+commands[git] )); then
  return 1
fi

# Source module files.
source "${0:h}/alias.zsh"
source "${0:h}/hub.zsh"

