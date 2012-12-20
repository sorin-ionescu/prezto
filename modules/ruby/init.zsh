#
# Configures Ruby local gem installation, loads version managers, and defines
# aliases.
#
# Authors: Sorin Ionescu <sorin.ionescu@gmail.com>
#

local _rbenv_rehash
zstyle -s ':prezto:module:ruby:rbenv' rehash '_rbenv_rehash' || _rbenv_rehash='yes'
if [[ "$_rbenv_rehash" == (N|n)(O|o) ]]; then
  $_rbenv_rehash='--no-rehash'
else
  $_rbenv_rehash=''
fi

# Load RVM into the shell session.
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  # Unset AUTO_NAME_DIRS since auto adding variable-stored paths to ~ list
  # conflicts with RVM.
  unsetopt AUTO_NAME_DIRS

  # Source RVM.
  source "$HOME/.rvm/scripts/rvm"

# Load manually installed rbenv into the shell session.
elif [[ -s "$HOME/.rbenv/bin/rbenv" ]]; then
  path=("$HOME/.rbenv/bin" $path)
  eval "$(rbenv init - $_rbenv_rehash zsh)"

# Load package manager installed rbenv into the shell session.
elif (( $+commands[rbenv] )); then
  eval "$(rbenv init - $_rbenv_rehash zsh)"

# Install local gems according to operating system conventions.
else
  if [[ "$OSTYPE" == darwin* ]]; then
    export GEM_HOME="$HOME/Library/Ruby/Gems/1.8"
    path=("$GEM_HOME/bin" $path)
  fi
fi

# Return if requirements are not found.
if (( ! $+commands[ruby] && ! ( $+commands[rvm] || $+commands[rbenv] ) )); then
  return 1
fi

#
# Aliases
#

# General
alias rb='ruby'

# Bundler
if (( $+commands[bundle] )); then
  alias rbb='bundle'
  alias rbbe='rbb exec'
  alias rbbi='rbb install --path vendor/bundle'
  alias rbbl='rbb list'
  alias rbbo='rbb open'
  alias rbbp='rbb package'
  alias rbbu='rbb update'
  alias rbbI='rbbi \
    && rbb package \
    && print .bundle       >>! .gitignore \
    && print vendor/bundle >>! .gitignore \
    && print vendor/cache  >>! .gitignore'
fi

