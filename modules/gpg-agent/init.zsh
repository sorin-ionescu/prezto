#
# Provides for an easier use of gpg-agent.
#
# Authors:
#   Florian Walch <florian.walch@gmx.at>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   neersighted <neersighted@myopera.com>
#   Jakob Hetzelein <nasenatmer@posteo.de>
#

# Return if requirements are not found.
if (( ! $+commands[gpg-agent] )); then
  return 1
fi

# Make sure to use the $GNUPGHOME first.
_gpg_env="${GNUPGHOME:-$HOME/.gnupg}/gpg-agent.info"

function _gpg-agent-start {
  local ssh_support

  zstyle -b ':prezto:module:gpg-agent' ssh-support 'ssh_support' \
    || ssh_support=''

  gpg-agent \
    --daemon \
    ${ssh_support:+'--enable-ssh-support'} \
    --write-env-file "${_gpg_env}" > /dev/null

  chmod 600 "${_gpg_env}"
  source "${_gpg_env}" > /dev/null
}

# Source GPG agent settings, if applicable.
if [[ -s "${_gpg_env}" ]]; then
  source "${_gpg_env}" > /dev/null
  ps -U "$USER" -o 'command,pid' \
  | grep "${${(@s.:.)GPG_AGENT_INFO}[2]}" \
  | grep -q '^gpg-agent' \
  ||  _gpg-agent-start
else
  _gpg-agent-start
fi

export GPG_AGENT_INFO
export SSH_AUTH_SOCK
export SSH_AGENT_PID
export GPG_TTY="$(tty)"
