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

if ([[ "$TERM_PROGRAM" = 'iTerm.app' ]] && \
  zstyle -t ':prezto:module:tmux:iterm' integrate \
); then
  _tmux_iterm_integration='-CC'
fi

# Get tmux config path
zstyle -s ':prezto:module:tmux:config' path _tmux_config || _tmux_config="$HOME/.tmux.conf"


if [[ -z "$TMUX" && -z "$EMACS" && -z "$VIM" && -z "$INSIDE_EMACS" && "$TERM_PROGRAM" != "vscode" ]] && ( \
  ( [[ -n "$SSH_TTY" ]] && zstyle -t ':prezto:module:tmux:auto-start' remote ) ||
  ( [[ -z "$SSH_TTY" ]] && zstyle -t ':prezto:module:tmux:auto-start' local ) \
); then
  tmux -f "$_tmux_config" start-server

  # Create a 'prezto' session if no session has been defined in tmux.conf.
  if ! tmux -f "$_tmux_config" has-session 2> /dev/null; then
    zstyle -s ':prezto:module:tmux:session' name tmux_session || tmux_session='prezto'
    tmux -f "$_tmux_config" \
      new-session -d -s "$tmux_session" \; \
      set-option -t "$tmux_session" destroy-unattached off &> /dev/null
  fi

  # Attach to the 'prezto' session or to the last session used. (detach first)
  exec tmux -f "$_tmux_config" $_tmux_iterm_integration attach-session -d
fi

#
# Aliases
#

alias tmuxa="tmux -f \"$_tmux_config\" $_tmux_iterm_integration new-session -A"
alias tmuxl="tmux -f \"$_tmux_config\" list-sessions"
