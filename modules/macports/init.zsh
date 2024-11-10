#
# Defines MacPorts aliases and adds MacPorts directories to path variables.
#
# Authors:
#   Matt Cable <wozz@wookie.net>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
pmodload 'helper'

# Return if requirements are not found.
if ! is-darwin; then
  return 1
fi

#
# Paths
#

# Set the list of directories that Zsh searches for programs.
path=(
  /opt/local/{bin,sbin}
  $path
)

#
# Aliases
#

if ! zstyle -t ':prezto:module:macports:alias' skip; then
  alias portc='sudo port clean --all installed'
  alias porti='sudo port install'
  alias ports='port search'
  alias portU='sudo port selfupdate && sudo port upgrade outdated'
  alias portu='sudo port upgrade'
  alias portX='sudo port -u uninstall'
  alias portx='sudo port uninstall'
fi
