#
# Configures Ruby local installation, loads version managers, and defines
# aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Indrajit Raychaudhuri <irc@indrajit.com>
#

# Possible lookup locations for manually installed rbenv and rvm.
local_rbenv_paths=({$RBENV_ROOT,{$XDG_CONFIG_HOME/,$HOME/.}rbenv}/bin/rbenv(N))
local_rvm_paths=({$RVM_DIR,{$XDG_CONFIG_HOME/,$HOME/.}rvm}/scripts/rvm(N))

# Load manually installed or package manager installed rbenv into the shell
# session.
if (( $#local_rbenv_paths || $+commands[rbenv] )); then

  # Ensure manually installed rbenv is added to path when present.
  [[ -s $local_rbenv_paths[1] ]] && path=($local_rbenv_paths[1]:h $path)

  eval "$(rbenv init - zsh)"

# Load manually installed rvm into the shell session.
elif (( $#local_rvm_paths )); then
  # Unset AUTO_NAME_DIRS since auto adding variable-stored paths to ~ list
  # conflicts with rvm.
  unsetopt AUTO_NAME_DIRS

  source "$local_rvm_paths[1]"

# Load package manager installed chruby into the shell session.
elif (( $+commands[chruby-exec] )); then
  if (( ! $+functions[chruby] )); then
    source "${commands[chruby-exec]:h:h}/share/chruby/chruby.sh"
  fi

  if zstyle -t ':prezto:module:ruby:chruby' auto-switch; then
    if (( ! $+functions[chruby_auto] )); then
      source "${commands[chruby-exec]:h:h}/share/chruby/auto.sh"
    fi

    # If a default ruby is set, switch to it.
    chruby_auto
  fi

# Prepend local gems bin directories to PATH.
else
  path=($HOME/.gem/ruby/*/bin(N) $path)
fi

unset local_rbenv

# Return if requirements are not found.
if (( ! $+commands[ruby] && ! $#functions[(i)r(benv|vm)] )); then
  return 1
fi

#
# Aliases
#

if ! zstyle -t ':prezto:module:ruby:alias' skip; then
  # General
  alias rb='ruby'

  # Bundler
  if (( $+commands[bundle] )); then
    alias rbb='bundle'
    alias rbbc='bundle clean'
    alias rbbe='bundle exec'
    alias rbbi='bundle install --path vendor/bundle'
    alias rbbl='bundle list'
    alias rbbo='bundle open'
    alias rbbp='bundle package'
    alias rbbu='bundle update'
    alias rbbI='rbbi \
      && bundle package \
      && print .bundle       >>! .gitignore \
      && print vendor/assets >>! .gitignore \
      && print vendor/bundle >>! .gitignore \
      && print vendor/cache  >>! .gitignore'
  fi
fi
