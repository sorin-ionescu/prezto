# Notifies if the last command completes and terminal window is not in
# foreground.
#
# Authors:
#   Alex Reece <awreece@gmail.com>
#

pmodload 'last_command'

if [[ "$OSTYPE" == darwin* ]]; then
  terminal_window_id=$(osascript -e 'tell application "Terminal" to ¬' \
                                 -e '  get id of front window')
fi

# Returns true if the current window has focus.
# Warning: Currently only implementd on mac.
# Assume $terminal_window_id is the osascript id of the current window.
#
# TODO(awreece) Add support for tabs.
function window_is_focused {
  if [[ "$OSTYPE" == darwin* ]]; then
    focus_window_id=$(osascript -e 'tell application "System Events" to ¬' \
                                -e '  set focus_app_name to ¬' \
                                -e '    name of first application process ¬' \
                                -e '    whose frontmost is true' \
                                -e 'tell application focus_app_name to ¬' \
                                -e '  get id of front window')
  fi
  # On a not mac, this will always return true since focus_id and
  # terminal_window_id are both undefined so empty strings.
  [[ $focus_window_id == $terminal_window_id ]]
}

# Sends a notification that the last command terminated.
# Warning: currently only implemented for mac.
function last_command_notify {
  message=$(printf "Command \"%s\" finished (%d) after %s." \
                   $last_command \
                   $last_command_status \
                   $(time_to_human $last_command_time))

  # TODO(awreece) Add support for user defined callback.
  if [[ "$OSTYPE" == darwin* ]]; then
    callback="osascript -e 'tell application \"Terminal\"' \
                        -e 'activate' \
                        -e 'set index of window id $terminal_window_id to 1' \
                        -e 'end tell'"
    terminal-notifier -message $message -execute $callback >/dev/null
  fi
}

function notify_precmd {
  if ! window_is_focused; then
    last_command_notify
  fi
}

autoload -Uz add-zsh-hook

add-zsh-hook precmd notify_precmd
