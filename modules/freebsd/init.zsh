#
# Defines FreeBSD aliases
#
# Authors:
#   jeffcox
#

# Return if requirements are not found.
if [[ "$OSTYPE" != freebsd* ]]; then
  return 1
fi

#
# Aliases
#

alias pkgu='sudo pkg update'
alias pkgU='sudo pkg update && sudo pkg upgrade'
alias pkgs='pkg search'
alias pkgi='sudo pkg install'
alias pkgx='sudo pkg remove'

alias bsdu='sudo freebsd-update fetch'
alias bsdU='sudo freebsd-update fetch && sudo freebsd-update install'
# Not sure if I want to include these
alias portf='sudo portsnap fetch'
alias portu='sudo portsnap update'
