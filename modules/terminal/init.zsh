#
# Sets terminal window and tab titles.
#
# Authors:
#   James Cox <james@imaj.es>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if [[ "$TERM" == 'dumb' ]]; then
  return 1
fi

# Set the GNU Screen window number.
if [[ -n "$WINDOW" ]]; then
  export SCREEN_NO="%B${WINDOW}%b "
else
  export SCREEN_NO=""
fi

# Sets the GNU Screen title.
function set-screen-window-title {
  if [[ "$TERM" == screen* ]]; then
    printf "\ek%s\e\\" ${(V)argv}
  fi
}

# Sets the terminal window title.
function set-terminal-window-title {
  if [[ "$TERM" == ((x|a|ml|dt|E)term*|(u|)rxvt*) ]]; then
    printf "\e]2;%s\a" ${(V)argv}
  fi
}

# Sets the terminal tab title.
function set-terminal-tab-title {
  if [[ "$TERM" == ((x|a|ml|dt|E)term*|(u|)rxvt*) ]]; then
    printf "\e]1;%s\a" ${(V)argv}
  fi
}

# Sets the tab and window titles with a given command.
function set-titles-with-command {
  # Do not set the window and tab titles in Terminal.app because they are not
  # reset upon command termination.
  if [[ "$TERM_PROGRAM" == 'Apple_Terminal' ]]; then
    return 1
  fi

  emulate -L zsh
  setopt EXTENDED_GLOB

  # Get the command name that is under job control.
  if [[ "${1[(w)1]}" == (fg|%*)(\;|) ]]; then
    # Get the job name, and, if missing, set it to the default %+.
    local job_name="${${1[(wr)%*(\;|)]}:-%+}"

    # Make a local copy for use in the subshell.
    local -A jobtexts_from_parent_shell
    jobtexts_from_parent_shell=(${(kv)jobtexts})

    jobs $job_name 2>/dev/null > >(
      read index discarded
      # The index is already surrounded by brackets: [1].
      set-titles-with-command "${(e):-\$jobtexts_from_parent_shell$index}"
    )
  else
    # Set the command name, or in the case of sudo or ssh, the next command.
    local cmd=${${1[(wr)^(*=*|sudo|ssh|-*)]}:t}
    local truncated_cmd="${cmd/(#m)?(#c15,)/${MATCH[1,12]}...}"
    unset MATCH

    if [[ "$TERM" == screen* ]]; then
      set-screen-window-title "$truncated_cmd"
    else
      set-terminal-window-title "$cmd"
      set-terminal-tab-title "$truncated_cmd"
    fi
  fi
}

# Sets the tab and window titles with a given path.
function set-titles-with-path {
  emulate -L zsh
  setopt EXTENDED_GLOB

  local absolute_path="${${1:a}:-$PWD}"

  if [[ "$TERM_PROGRAM" == 'Apple_Terminal' ]]; then
    printf '\e]7;%s\a' "file://$HOST${absolute_path// /%20}"
  else
    local abbreviated_path="${absolute_path/#$HOME/~}"
    local truncated_path="${abbreviated_path/(#m)?(#c15,)/...${MATCH[-12,-1]}}"
    unset MATCH

    if [[ "$TERM" == screen* ]]; then
      set-screen-window-title "$truncated_path"
    else
      set-terminal-window-title "$abbreviated_path"
      set-terminal-tab-title "$truncated_path"
    fi
  fi
}

# Don't override precmd/preexec; append to hook array.
autoload -Uz add-zsh-hook

# Sets the tab and window titles before the prompt is displayed.
function set-titles-precmd {
  if zstyle -t ':prezto:module:terminal' auto-title; then
    set-titles-with-path
  fi
}
add-zsh-hook precmd set-titles-precmd

# Sets the tab and window titles before command execution.
function set-titles-preexec {
  if zstyle -t ':prezto:module:terminal' auto-title; then
    set-titles-with-command "$2"
  fi
}
add-zsh-hook preexec set-titles-preexec

