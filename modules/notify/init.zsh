# Notifies if the last command completes and terminal window is not in
# foreground.
#
# Authors:
#   Alex Reece <awreece@gmail.com>
#

pmodload 'helper'

if should_auto_notify; then
  pmodload 'last_command'

  # Initialize $terminal_window_id to the current active window.
  terminal_window_id=$(focused_window_id)

  function notify_precmd {
    if [[ $(focused_window_id) != $terminal_window_id ]]; then
      notify_last_command
    fi
  }

  autoload -Uz add-zsh-hook

  add-zsh-hook precmd notify_precmd
fi
