#
# Defines tmux aliases and provides for auto launching it at start-up.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Colin Hebert <hebert.colin@gmail.com>
#   neersighted <neersighted@myopera.com>
#

# Return if requirements are not found.
if (( ! $+commands[tmux] )); then
  return 1
fi

#
# Auto Start
#

if [[ -z "$TMUX" ]] && zstyle -t ':prezto:module:tmux' auto-start; then
  tmux_session='#Prezto'

  # Check that the default session exists.
  if ! tmux has-session -t "$tmux_session" 2> /dev/null; then
    # Create a new, detached session only if needed.
    tmux new-session -d -s "$tmux_session"
  fi

  # Attach to the session.
  TERM=xterm-256color tmux attach -t "$tmux_session"
fi

#
# Aliases
#

alias tmuxa='tmux attach-session'
alias tmuxl='tmux list-sessions'
