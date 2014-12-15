#
# Defines Mac OS X aliases and functions.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# Aliases
#

# Changes directory to the current Finder directory.
alias cdf='cd "$(pfd)"'

# Pushes directory to the current Finder directory.
alias pushdf='pushd "$(pfd)"'

# aliases to browsers
alias canary='open -a "Google Chrome Canary" $*'
alias chrome='open -a "Google Chrome" $*'
alias firefox='open -a "Firefox" $*'
alias safari='open -a "Safari" $*'

