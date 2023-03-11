#
# Defines macOS aliases and functions.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
pmodload 'helper'

# Return if requirements are not found.
if ! is-darwin; then
  return 1
fi

#
# Aliases
#

# Changes directory to the current Finder directory.
alias cdf='cd "$(pfd)"'

# Pushes directory to the current Finder directory.
alias pushdf='pushd "$(pfd)"'

# Kill the DNS process to really flush cache
# Maybe replaced by dscacheutil -flushcache ?
alias flushdns='sudo killall -HUP mDNSResponder'
