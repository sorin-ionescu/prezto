#
# Defines MacPorts aliases and adds MacPorts directories to path variables.
#
# Authors:
#   Matt Cable <wozz@wookie.net>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# Paths
#

# Set the list of directories that info searches for manuals.
infopath=(
  /opt/local/share/info
  $infopath
)

# Set the list of directories that man searches for manuals.
manpath=(
  /opt/local/share/man
  $manpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  /opt/local/{bin,sbin}
  $path
)

#
# Aliases
#

# Return if conditions are unsatistied
if ! zstyle -t ':prezto:alias' pmodule all macports; then
  return 1
fi

alias portc='sudo port clean --all installed'
alias porti='sudo port install'
alias ports='port search'
alias portU='sudo port selfupdate && sudo port upgrade outdated'
alias portu='sudo port upgrade'
alias portX='sudo port -u uninstall'
alias portx='sudo port uninstall'

