#
# Provides for an easier use of GPG by setting up gpg-agent.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[gpg-agent] )); then
  return 1
fi

# Set the default paths to gpg-agent files.
_gpg_agent_conf="$HOME/.gnupg/gpg-agent.conf"
_gpg_agent_env="$TMPDIR/gpg-agent.env"

# Start gpg-agent if not started.
if ! ps -U "$USER" -o ucomm | grep -q gpg-agent; then
  eval "$(gpg-agent --daemon | tee "$_gpg_agent_env")"
else
  # Export environment variables.
  source "$_gpg_agent_env" 2> /dev/null
fi

# Inform gpg-agent of the current TTY for user prompts.
export GPG_TTY="$(tty)"

# Integrate with the SSH module.
if grep 'enable-ssh-support' "$_gpg_agent_conf" &> /dev/null; then
  # Override the ssh-agent environment file default path.
  _ssh_agent_env="$_gpg_agent_env"

  # Load the SSH module for additional processing.
  pmodload 'ssh'
fi

# Clean up.
unset _gpg_agent_{conf,env}

# Disable GUI prompts inside SSH.
if [[ -n "$SSH_CONNECTION" ]]; then
  export PINENTRY_USER_DATA='USE_CURSES=1'
fi

