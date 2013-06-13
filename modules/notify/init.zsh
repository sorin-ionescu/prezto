# Notifies if the last command completes and terminal window is not in
# foreground.
#
# Authors:
#   Alex Reece <awreece@gmail.com>
#

pmodload 'last_command'

if ! should_load_notify_module; then
  return 1
fi

# Initialize $terminal_window_id to the current active window.
terminal_window_id=$(focused_window_id)

# Returns true if the current window has focus.
#
# TODO(awreece) Add support for tabs.
function window_is_focused {
  [[ $(focused_window_id) == $terminal_window_id ]]
}

# Sends a notification that the last command terminated.
# Warning: currently only implemented for mac.
function last_command_notify {
  message=$(printf "Command \"%s\" finished (%d) after %s." \
                   $last_command \
                   $last_command_status \
                   $(time_to_human $last_command_time))

  # TODO(awreece) Add support for user defined callback.
  case "$OSTYPE" in
    (darwin*)
      callback="osascript -e 'tell application \"Terminal\"' \
                          -e 'activate' \
                          -e 'set index of window id $terminal_window_id to 1' \
                          -e 'end tell'"
      terminal-notifier -message $message -execute $callback >/dev/null
      ;;
    (linux-gnu*)
      notify-send "Command finished" $message
      ;;
    (*)
      return 1
      ;;
  esac
}

function notify_precmd {
  if ! window_is_focused; then
    last_command_notify
  fi
}

autoload -Uz add-zsh-hook

add-zsh-hook precmd notify_precmd
