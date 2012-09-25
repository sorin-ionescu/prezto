#
# Provides for an easier use of gpg-agent.
#
# Authors:
#   Florian Walch <florian.walch@gmx.at>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[gpg-agent] )); then
  return 1
fi

_gpg_env="$HOME/.gnupg/gpg-agent.env"
_gpg_ssh_enabled=
zstyle -b ':prezto:module:gpg-agent' ssh-support '_gpg_ssh_enabled'

function _gpg-agent-start {
  _gpg_ssh_support=
  if is-true "${_gpg_ssh_enabled}"; then
    _gpg_ssh_support="--enable-ssh-support"
  fi
  gpg-agent --daemon ${_gpg_ssh_support} --write-env-file "${_gpg_env}" > /dev/null
  chmod 600 "${_gpg_env}"
  source "${_gpg_env}" > /dev/null
}

# Source GPG agent settings, if applicable.
if [[ -s "${_gpg_env}" ]]; then
  source "${_gpg_env}" > /dev/null
  ps -ef | grep "${SSH_AGENT_PID}" | grep -q 'gpg-agent' || {
    _gpg-agent-start
  }
else
  _gpg-agent-start
fi

export GPG_AGENT_INFO
export SSH_AUTH_SOCK
export SSH_AGENT_PID
export GPG_TTY="$(tty)"

