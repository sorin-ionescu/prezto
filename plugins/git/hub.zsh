#
# Adds GitHub knowledge to the Git command.
# https://github.com/defunkt/hub
#
# Authors:
#   Chris Wanstrath <chris@wanstrath.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Colin Hebert <hebert.colin@gmail.com>
#

if (( $+commands[hub] )); then
  eval "$(hub alias -s)"
fi

