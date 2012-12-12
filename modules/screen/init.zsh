#
# Defines GNU Screen aliases and provides for auto launching it at start-up.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[screen] )); then
  return 1
fi

#
# Auto Start
#

if [[ -z "$STY" ]] && zstyle -t ':prezto:module:screen' auto-start; then
  session="$(
    screen -list 2> /dev/null \
      | sed '1d;$d' \
      | awk '{print $1}' \
      | head -1)"

  if [[ -n "$session" ]]; then
    exec screen -x "$session"
  else
    exec screen -a -A -U -D -R -m "$SHELL" -l
  fi
fi

#
# Aliases
#

# Return if conditions are unsatistied
if ! zstyle -t ':prezto:alias' pmodule all screen; then
  return 0
fi

alias scr='screen'
alias scrl='screen -list'
alias scrn='screen -U -S'
alias scrr='screen -a -A -U -D -R'

