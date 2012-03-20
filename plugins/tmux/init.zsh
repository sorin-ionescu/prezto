#
# Defines tmux aliases and provides for auto launching it at start-up.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Colin Hebert <hebert.colin@gmail.com>
#
# Usage:
#   To auto start it, add the following to zshrc:
#
#     # Auto launch tmux at start-up.
#     zstyle -t ':omz:plugin:tmux:auto' start 'yes'
#

# Aliases
alias ta="tmux attach-session"
alias tl="tmux list-sessions"

# Auto Start
if [[ -z "$TMUX" ]] && zstyle -t ':omz:plugin:tmux:auto' start; then
  tmux_session='#OMZ'

  if ! tmux has-session -t "$tmux_session" 2> /dev/null; then
    # Override potential tmux configuration
    tmux set-option -g destroy-unattached off &> /dev/null
    tmux new-session -d -s "$tmux_session"
    tmux set-option -t "$tmux_session" destroy-unattached off &> /dev/null
    # Mandatory, or we'll end up with a lot of open session detached
    tmux set-option -g destroy-unattached on &> /dev/null
  fi
  exec tmux new-session -t "$tmux_session"
fi
