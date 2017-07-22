#
# Provides for an easier use of SSH by setting up ssh-agent.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[ssh-agent] )); then
  return 1
fi

# Set the path to the SSH directory.
_ssh_dir="$HOME/.ssh"

# Set the path to the environment file if not set by another module.
_ssh_agent_env="${_ssh_agent_env:-${TMPDIR:-/tmp}/ssh-agent.env.$UID}"

# If a socket exists at SSH_AUTH_SOCK, assume ssh-agent is already running and
# skip starting it.
if [[ ! -S "$SSH_AUTH_SOCK" ]]; then
  # Try to grab previously exported environment variables.
  source "$_ssh_agent_env" 2> /dev/null

  # Do not start ssh-agent if the PID from the last start of ssh-agent exists and
  # corresponds to a running ssh-agent under the current user.
  if ! ps -U "$LOGNAME" -o pid,comm | grep -E -q -e "^[[:blank:]]*${SSH_AGENT_PID:--1}[[:blank:]].*ssh-agent$"; then
    eval "$(ssh-agent | sed '/^echo /d' | tee "$_ssh_agent_env")"
  fi
fi

# Load identities.
if ssh-add -l 2>&1 | grep -q 'The agent has no identities'; then
  zstyle -a ':prezto:module:ssh:load' identities '_ssh_identities'
  # ssh-add has strange requirements for running SSH_ASKPASS, so we duplicate
  # them here. Essentially, if the other requirements are met, we redirect stdin
  # from /dev/null in order to meet the final requirement.
  #
  # From ssh-add(1):
  # If ssh-add needs a passphrase, it will read the passphrase from the current
  # terminal if it was run from a terminal. If ssh-add does not have a terminal
  # associated with it but DISPLAY and SSH_ASKPASS are set, it will execute the
  # program specified by SSH_ASKPASS and open an X11 window to read the
  # passphrase.
  if [[ -n "$DISPLAY" && -x "$SSH_ASKPASS" ]]; then
    ssh-add "${_ssh_identities:+$_ssh_dir/${^_ssh_identities[@]}}" < /dev/null 2> /dev/null
  elif [[ "$OSTYPE" == darwin* ]]; then
    # macOS: `ssh-add -A` will load all identities defined in Keychain
    ssh-add -A 2> /dev/null
  else
    ssh-add ${_ssh_identities:+$_ssh_dir/${^_ssh_identities[@]}} 2> /dev/null
  fi
fi

# Clean up.
unset _ssh_{dir,identities,agent_env}
