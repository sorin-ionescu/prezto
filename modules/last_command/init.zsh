#
# Provides information about the last command.
#
# Authors:
#   Alex Reece <awreece@gmail.com>
#

# Provided values.
last_command=''
last_command_status=0
last_command_time=0.0

zmodload zsh/datetime  # For EPOCHREALTIME.

# This value is used internally by this module and is not intended to be used
# elsewhere.
last_command_start_time='invalid'

function last_command_precmd {
  exit_status=$?  # TODO(awreece) What happens if another precmd runs first?

  # We do these 'invalid' shenanigans because zsh executes precmd but not
  # preexec if an empty line is entered.
  if [[ $last_command_start_time != 'invalid' ]]; then
    last_command_status=$exit_status
    last_command_time=$((EPOCHREALTIME - last_command_start_time))

    last_command_start_time='invalid'
  fi
}

function last_command_preexec {
  last_command_start_time=$EPOCHREALTIME
  last_command=$1
}

autoload -Uz add-zsh-hook

add-zsh-hook precmd last_command_precmd
add-zsh-hook preexec last_command_preexec
