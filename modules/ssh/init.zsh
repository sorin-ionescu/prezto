#
# Provides for an easier use of SSH by setting up ssh-agent.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if [[ "$OSTYPE" == darwin* ]] || (( ! $+commands[ssh-agent] )); then
  return 1
fi

# Set the path to the SSH directory.
_ssh_dir="$HOME/.ssh"

# Set the path to the environment file if not set by another module.
_ssh_agent_env="${_ssh_agent_env:-$TMPDIR/ssh-agent.env}"

# Set the path to the persistent authentication socket.
_ssh_agent_sock="$TMPDIR/ssh-agent.sock"

# Start ssh-agent if not started.
if [[ ! -S "$SSH_AUTH_SOCK" ]]; then
  eval "$(ssh-agent | sed '/^echo /d' | tee "$_ssh_agent_env")"
else
  # Export environment variables.
  source "$_ssh_agent_env" 2> /dev/null
fi

# Load identities.
if ssh-add -l 2>&1 | grep 'The agent has no identities'; then
  zstyle -a ':prezto:module:ssh:load' identities '_ssh_identities'
  if (( ${#identities} > 0 )); then
    ssh-add "$_ssh_dir/${^_ssh_identities[@]}"
  else
    ssh-add
  fi
fi

# Create a persistent SSH authentication socket.
if [[ -S "$SSH_AUTH_SOCK" && "$SSH_AUTH_SOCK" != "$_ssh_agent_sock" ]]; then
  ln -sf "$SSH_AUTH_SOCK" "$_ssh_agent_sock"
  export SSH_AUTH_SOCK="$_ssh_agent_sock"
fi

# Clean up.
unset _ssh_{dir,identities} _ssh_agent_{env,sock}

