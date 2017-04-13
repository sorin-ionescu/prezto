#
# Defines Docker aliases.
#
# Author:
#   François Vantomme <akarzim@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[docker] )); then
  return 1
fi

#
# Functions
#

# Set Docker Machine environment
function dkme {
  if (( ! $+commands[docker-machine] )); then
    return 1
  fi

  eval $(docker-machine env $1)
}

# Set Docker Machine default machine
function dkmd {
  if (( ! $+commands[docker-machine] )); then
    return 1
  fi

  pushd ~/.docker/machine/machines

  if [[ ! -d $1 ]]; then
    echo "Docker machine '$1' does not exists. Abort."
    popd
    return 1
  fi

  if [[ -L default ]]; then
    eval $(rm -f default)
  elif [[ -d default ]]; then
    echo "A default machine already exists. Abort."
    popd
    return 1
  elif [[ -e default ]]; then
    echo "A file named 'default' already exists. Abort."
    popd
    return 1
  fi

  eval $(ln -s $1 default)
  popd
}

# Source module files.
source "${0:h}/alias.zsh"
