#
# Defines Fink aliases and adds Fink directories to path variables.
#
# Authors:
# 	Jeff Cox  
#	Matt Cable <wozz@wookie.net>
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
  /sw/share/info
  $infopath
)

# Set the list of directories that man searches for manuals.
manpath=(
  /sw/share/man
  $manpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  /sw/{bin,sbin}
  $path
)

#
# Aliases
#

alias finki='fink install'
alias finks='fink list'
alias finku='fink update-all'
alias finkU='fink selfupdate'
alias finkx='fink remove'

