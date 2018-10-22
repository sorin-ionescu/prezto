#
# Defines Homebrew aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if [[ "$OSTYPE" != (darwin|linux)* ]]; then
  return 1
fi

#
# Variables
#

# Load standard Homebrew shellenv into the shell session.
# `brew shellenv` is relatively new, guard for legacy Homebrew.
if (( $+commands[brew] )); then
  eval "$(brew shellenv 2> /dev/null)"
fi

#
# Aliases
#

# Homebrew
alias brewc='brew cleanup'
alias brewC='brew cleanup --force'
alias brewi='brew install'
alias brewl='brew list'
alias brewo='brew outdated'
alias brews='brew search'
alias brewu='brew upgrade'
alias brewx='brew uninstall'

# Homebrew Cask
alias cask='brew cask'
alias caskc='hb_deprecated brew cask cleanup'
alias caskC='hb_deprecated brew cask cleanup'
alias caski='brew cask install'
alias caskl='brew cask list'
alias casko='brew cask outdated'
alias casks='hb_deprecated brew cask search'
alias caskx='brew cask uninstall'

function hb_deprecated {
  local cmd="${argv[3]}"
  local cmd_args=( ${(@)argv:4} )

  printf "'brew cask %s' has been deprecated, " "${cmd}"
  printf "using 'brew %s' instead\n" "${cmd}"

  cmd_args=( ${(@)argv:4} )
  command brew "${cmd}" ${(@)cmd_args}
}
