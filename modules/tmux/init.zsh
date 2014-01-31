#
# Defines tmux aliases and provides for auto launching it at start-up.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Colin Hebert <hebert.colin@gmail.com>
#   Georges Discry <georges@discry.be>
#   Xavier Cambar <xcambar@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[tmux] )); then
  return 1
fi

#
# Auto Start
#

if [[ -z "$TMUX" && ( -z "$INSIDE_EMACS" || -z "$EMACS" || -z "$VIM" ) ]] && ( \
  ( [[ -n "$SSH_TTY" ]] && zstyle -t ':prezto:module:tmux:auto-start' remote ) ||
  ( [[ -z "$SSH_TTY" ]] && zstyle -t ':prezto:module:tmux:auto-start' local ) \
); then
  tmux_session='prezto'

  # Create the default '#Prezto' session if not available. 
  if ! tmux has-session -t "$tmux_session" 2> /dev/null; then
    tmux start-server \; new-session -d -s "$tmux_session" \; set-option -t "$tmux_session" destroy-unattached off &> /dev/null
  fi

  #By default, prezto sets destroy-unattached to on
  tmux_destroy_unattached=`tmux show-options -v -g destroy-unattached`
  if [[ -z "$tmux_destroy_unattached" ]]; then
    tmux set-option -g destroy-unattached on
  fi

  #Opens the session '#Prezto' or the latest session used
  exec tmux attach-session
fi

#
# Aliases
#

alias tmuxa='tmux attach-session'
alias tmuxl='tmux list-sessions'
