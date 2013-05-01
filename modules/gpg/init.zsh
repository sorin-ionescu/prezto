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

# Set the default path to the gpg-agent-info file.
_gpg_agent_info="$HOME/.gpg-agent-info"

# Start gpg-agent if not started.
ps -U "$USER" -o ucomm | grep -q gpg-agent \
  || gpg-agent --daemon >! "$_gpg_agent_info"

# Export environment variables.
export GPG_TTY="$(tty)"
source "$_gpg_agent_info"

# Clean up.
unset _gpg_agent_info

# Disable GUI prompts inside SSH.
if [[ -n "$SSH_CONNECTION" ]]; then
  export PINENTRY_USER_DATA='USE_CURSES=1'
fi

