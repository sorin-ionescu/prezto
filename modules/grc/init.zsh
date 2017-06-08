#
# Defines grc aliases.
#
# Authors:
#   Lance Speelmon <lance@speelmon.com>
#

# Return if requirements are not found.
if (( ! $+commands[grc] )) || [[ $TERM == 'dumb' ]]; then
  return 1
fi

#
# Aliases
#

alias colourify="$commands[grc] -es --colour=auto"
alias configure='colourify ./configure'
# alias diff='colourify diff' # already color coded with prezto
alias make="colourify $commands[make]"
# alias gcc='colourify gcc'
# alias g++='colourify g++'
# alias as='colourify as'
# alias gas='colourify gas'
# alias ld='colourify ld'
alias netstat="colourify $commands[netstat]"
alias ping="colourify $commands[ping]"
alias traceroute="colourify $commands[traceroute]"
