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

if [[ -z "$TMUX" && -z "$EMACS" && -z "$VIM" && -z "$INSIDE_EMACS" && -z "$VSCODE_RESOLVING_ENVIRONMENT" && "$TERM_PROGRAM" != "vscode" && "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]] && ( \
  ( [[ -n "$SSH_TTY" ]] && zstyle -t ':prezto:module:tmux:auto-start' remote ) ||
  ( [[ -z "$SSH_TTY" ]] && zstyle -t ':prezto:module:tmux:auto-start' local ) \
); then
  tmux start-server

  # Make sure we have a session to connect to, either named via an environment
  # variable, the default style as documented, or 'prezto' for last resort
  [[ -z "${tmux_session:// }" ]] && zstyle -s ':prezto:module:tmux:session' name tmux_session || : ${tmux_session:=prezto}
  if ! tmux has-session -t "$tmux_session" 2> /dev/null; then
    tmux \
      new-session -d -s "$tmux_session" \; \
      set-option -t "$tmux_session" destroy-unattached off &> /dev/null
  fi

  # Attach to the session name requested in an environment variable or the default (detaching others)
  exec tmux $_tmux_iterm_integration attach-session -t "$tmux_session" -d
fi

#
# Aliases
#

if ! zstyle -t ':prezto:module:tmux:alias' skip; then
  alias tmuxa="tmux $_tmux_iterm_integration new-session -A"
  alias tmuxl='tmux list-sessions'
fi
