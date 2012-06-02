#
# Defines MacPorts aliases.
#
# Authors:
#   Matt Cable <wozz@wookie.net>
#

# This module is for Mac OS X only.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

# Paths

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

# Aliases
alias pc="sudo port clean --all installed"
alias pi="sudo port install $1"
alias psu="sudo port selfupdate"
alias puni="sudo port uninstall inactive"
alias puo="sudo port upgrade outdated"
alias pup="psu && puo"

