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

function _gpg-agent-start {
  local ssh_support

  zstyle -b ':prezto:module:gpg-agent' ssh-support 'ssh_support' \
    || ssh_support=''

  gpg-agent \
    --daemon ${ssh_support:+'--enable-ssh-support'}
    --write-env-file "${_gpg_env}" > /dev/null

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

