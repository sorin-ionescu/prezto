#
# Defines Brew aliases and adds Brew directories to path variables.
#
# Authors:
#   Lance Speelmon <lance@speelmon.com>
#

# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# Aliases
#

alias brewc='brew cleanup'
alias brewi='brew install'
alias brews='brew search'
alias brewU='brew update && brew upgrade'
alias brewu='brew upgrade'
alias brewx='brew remove'
