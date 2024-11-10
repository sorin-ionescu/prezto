#
# Defines Homebrew aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
pmodload 'helper'

# Return if requirements are not found.
if ! is-darwin && ! is-linux; then
  return 1
fi

#
# Variables
#

# Load standard Homebrew shellenv into the shell session.
# Load 'HOMEBREW_' prefixed variables only. Avoid loading 'PATH' related
# variables as they are already handled in standard zsh configuration.
if (( $+commands[brew] )); then
  cache_file="${XDG_CACHE_HOME:-$HOME/.cache}/prezto/brew-shellenv-cache.zsh"
  if [[ "$commands[brew]" -nt "$cache_file" \
      || "${ZDOTDIR:-$HOME}/.zpreztorc" -nt "$cache_file" \
      || ! -s "$cache_file" ]]; then
    mkdir -p "$cache_file:h"
    # Cache the result.
    echo "${(@M)${(f)"$(brew shellenv 2> /dev/null)"}:#export HOMEBREW*}" >! "$cache_file" 2> /dev/null
  fi

  source "$cache_file"
  unset cache_file
fi

#
# Aliases
#

# Homebrew
if ! zstyle -t ':prezto:module:homebrew:alias' skip; then
  alias brewc='brew cleanup'
  alias brewi='brew install'
  alias brewL='brew leaves'
  alias brewl='brew list'
  alias brewo='brew outdated'
  alias brews='brew search'
  alias brewu='brew upgrade'
  alias brewx='brew uninstall'

  # Homebrew Cask
  alias caski='brew install --cask'
  alias caskl='brew list --cask'
  alias casko='brew outdated --cask'
  alias casks='brew search --cask'
  alias casku='brew upgrade --cask'
  alias caskx='brew uninstall --cask'
fi
