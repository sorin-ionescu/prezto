#
# Sets terminal window and tab titles.
#
# Authors:
#   James Cox <james@imaj.es>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
pmodload 'helper'

# Return if requirements are not found.
if [[ "$TERM" == 'dumb' ]]; then
  return 1
fi

# Sets the GNU Screen title.
function set-screen-window-title {
  if [[ "$TERM" == screen* ]]; then
    printf "\ek%s\e\\" ${(V)argv}
  fi
}

# Sets the terminal window title.
function set-terminal-window-title {
  if [[ "$TERM" == ((x|a|ml|dt|E)term*|(u|)rxvt*|dvtm*) ]]; then
    printf "\e]2;%s\a" ${(V)argv}
  fi
}

# Sets the terminal tab title.
function set-terminal-tab-title {
  if [[ "$TERM" == ((x|a|ml|dt|E)term*|(u|)rxvt*|dvtm*) ]]; then
    printf "\e]1;%s\a" ${(V)argv}
  fi
}

# Sets the Terminal.app current working directory.
function set-terminal-app-cwd {
  if [[ "$TERM_PROGRAM" == 'Apple_Terminal' ]]; then
    printf '\e]7;%s\a' "file://$HOST${${1:-$PWD}// /%20}"
  fi
}

# Sets the tab and window titles with a given command.
function set-titles-with-command {
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
  local abbreviated_path="${absolute_path/#$HOME/~}"
  local truncated_path="${abbreviated_path/(#m)?(#c15,)/...${MATCH[-12,-1]}}"
  unset MATCH

  if [[ "$TERM" == screen* ]]; then
    set-screen-window-title "$truncated_path"
  else
    set-terminal-window-title "$abbreviated_path"
    set-terminal-tab-title "$truncated_path"
  fi
}

# Do not override precmd/preexec; append to the hook array.
autoload -Uz add-zsh-hook

# Set up the Apple Terminal.
if [[ "$TERM_PROGRAM" == 'Apple_Terminal' ]] \
  && (( ${${OSTYPE#darwin}[1,2]} >= 11 )) \
	&& ! is-terminal-inside-multiplexer
then
  # Sets the Terminal.app current working directory before the prompt is
	# displayed.
  add-zsh-hook precmd set-terminal-app-cwd

	# Unsets the Terminal.app current working directory when a terminal
	# multiplexer or remote connection is started since it can no longer be
  # updated, and it becomes confusing when the directory displayed in the title
  # bar is no longer synchronized with real current working directory.
	function unset-terminal-app-cwd {
    if [[ "${2[(w)1]:t}" == (screen|tmux|dvtm|ssh|mosh) ]]; then
      set-terminal-app-cwd ' '
    fi
	}
	add-zsh-hook preexec unset-terminal-app-cwd

  # Do not set the tab and window titles in Terminal.app since it sets the tab
  # title to the currently running process by default and the current working
  # directory is set separately, but do set the tab and window titles inside
	# terminal multiplexers inside Terminal.app.
	return
fi

# Set up non-Apple terminals.
if ( ( ! is-terminal-inside-multiplexer || [[ -n "$DVTM" ]] ) \
    && zstyle -t ':prezto:module:terminal:auto-title' emulator ) \
  || ( is-terminal-inside-multiplexer \
    && zstyle -t ':prezto:module:terminal:auto-title' multiplexer )
then
	# Sets the tab and window titles before the prompt is displayed.
	add-zsh-hook precmd set-titles-with-path

	# Sets the tab and window titles before command execution.
	function set-titles-with-command-preexec {
		set-titles-with-command "$2"
	}
	add-zsh-hook preexec set-titles-with-command-preexec
fi

