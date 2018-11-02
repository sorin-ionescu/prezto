#
# Configures Ruby local gem installation, loads version managers, and defines
# aliases.
#
# Authors: Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load RVM into the shell session.
# General
alias rb='ruby'

# Bundler
if (( $+commands[bundle] )); then
  alias b='bundle'
  alias be='b exec'
  alias bi='b install --path vendor/bundle -j4'
  alias bu='b update'
fi
