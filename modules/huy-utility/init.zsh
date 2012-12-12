# General utilities that should be useful for all of us

# Useful
setopt interactivecomments
setopt numericglobsort
setopt cshnullglob
# Report CPU usage stats if user+system > 5 seconds
REPORTTIME=5

# Minor
setopt histnostore
setopt kshoptionprint

##############################################################################
### Global alias

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# Use at the end of the line to quickly redirect
alias -g 1NUL=">/dev/null"
alias -g 2NUL="2>/dev/null"
alias -g NUL=">/dev/null 2>&1"

##############################################################################
### Common commands

# Command line
function h {
  history -d "${argv[1]:--$[ ${LINES:-24} - 3 ]}" "${(@)argv[2,-1]}" | $PAGER
}

### ls (which works on Linux, OS X, and OS X with GNU coreutils installed by Homebrew)

zstyle -s ':prezto:module:gnu-utility' prefix '_gnu_utility_p' || _gnu_utility_p='g'

if is-callable 'dircolors'; then
  # GNU Core Utilities
  _ls_color_flag=--color=always
else
  # BSD Core Utilities
  _ls_color_flag=-G
fi

# NOTE: The $_ls_color_flag goes after "$@" because prezto defines an alias which has
# --color=auto that we want to override
_gnu_utility_pcmd="${_gnu_utility_p}ls"
if (( ${+commands[${_gnu_utility_pcmd}]} )); then
  _gnu_utility_ls="'${commands[${_gnu_utility_pcmd}]}'"
else
  _gnu_utility_ls="command ls"
fi
eval "
  function ls {
    $_gnu_utility_ls -ACF \"\$@\" $_ls_color_flag | \$PAGER -e
  }
"
alias ll="$aliases[ll] -a"

unset _gnu_utility_{p,cmds,cmd,pcmd,ls} _ls_color_flag

### Network commands

# Occasional commands
alias mtr='mtr --curses'
