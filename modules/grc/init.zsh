#
# Defines grc aliases.
#
# Authors:
#   Lance Speelmon <lance@speelmon.com>
#

# Return if requirements are not found.
# assumes grc was installed in /user/local/bin
if [[ ! -h '/usr/local/bin/grc' ]] || [[ "$TERM" == dumb ]]; then
  return 1
fi

#
# Aliases
#

alias colourify="/usr/local/bin/grc -es --colour=auto"
alias configure='colourify ./configure'
# alias diff='colourify diff' # already color coded with prezto
alias make='colourify make'
# alias gcc='colourify gcc'
# alias g++='colourify g++'
# alias as='colourify as'
# alias gas='colourify gas'
# alias ld='colourify ld'
alias netstat='colourify netstat'
alias ping='colourify ping'
alias traceroute='colourify /usr/sbin/traceroute'
