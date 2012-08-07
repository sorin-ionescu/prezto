#
# Provides for an easier use of ssh-agent.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Theodore Robert Campbell Jr <trcjr@stupidfoot.com>
#   Joseph M. Reagle Jr. <reagle@mit.edu>
#   Florent Thoumie <flz@xbsd.org>
#   Jonas Pfenniger <jonas@pfenniger.name>
#   gwjo <gowen72@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[ssh-agent] )); then
  return 1
fi

_ssh_agent_env="${HOME}/.ssh/environment-${HOST}"
_ssh_agent_forwarding=

function _ssh-agent-start {
  local -a identities

  # Start ssh-agent and setup the environment.
  rm -f "${_ssh_agent_env}"
  ssh-agent > "${_ssh_agent_env}"
  chmod 600 "${_ssh_agent_env}"
  source "${_ssh_agent_env}" > /dev/null

  # Load identities.
  zstyle -a ':prezto:module:ssh-agent' identities 'identities'

  if (( ${#identities} > 0 )); then
    ssh-add "${HOME}/.ssh/${^identities[@]}"
  else
    ssh-add
  fi
}

# Test if agent-forwarding is enabled.
zstyle -b ':prezto:module:ssh-agent' forwarding '_ssh_agent_forwarding'
if is-true "${_ssh_agent_forwarding}" && [[ -n "$SSH_AUTH_SOCK" ]]; then
  # Add a nifty symlink for screen/tmux if agent forwarding.
  [[ -L "$SSH_AUTH_SOCK" ]] || ln -sf "$SSH_AUTH_SOCK" /tmp/ssh-agent-$USER-screen
elif [[ -s "${_ssh_agent_env}" ]]; then
  # Source SSH settings, if applicable.
  source "${_ssh_agent_env}" > /dev/null
  ps -ef | grep "${SSH_AGENT_PID}" | grep -q 'ssh-agent$' || {
    _ssh-agent-start;
  }
else
  _ssh-agent-start;
fi

# Tidy up after ourselves.
unfunction _ssh-agent-start
unset _ssh_agent_{env,forwarding}

