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

if [[ -z "$TMUX" && -z "$EMACS" && -z "$VIM" ]] && ( \
  ( [[ -n "$SSH_TTY" ]] && zstyle -t ':prezto:module:tmux:auto-start' remote ) ||
  ( [[ -z "$SSH_TTY" ]] && zstyle -t ':prezto:module:tmux:auto-start' local ) \
); then
  tmux start-server

  # Create a 'prezto' session if no session has been defined in tmux.conf.
  if ! tmux has-session 2> /dev/null; then
    tmux \
      new-session -d -s prezto \; \
      set-option -t prezto destroy-unattached off &> /dev/null
  else
    tmux_session
  fi

  if zstyle -t ':prezto:module:tmux:auto-start' mode shared; then
      # Attach to the 'prezto' session or to the last session used.
      exec tmux attach
  else
      # Find a session to share windows with.
      tmux_session=`tmux list-sessions -F '#S' | head -n 1`
      exec tmux new-session -t "$tmux_session"\; set-option destroy-unattached on
  fi
fi

#
# Aliases
#

alias tmuxa='tmux attach-session'
alias tmuxl='tmux list-sessions'
