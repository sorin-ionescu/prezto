#
# Sets the environment variables to work with docker through boot2docker
#
# Authors:
#   Pavel Chernykh <pavel.v.chernykh@gmail.com>
#

#
# Return if requirements are not found.
#
if (( !( $+commands[docker] && $+commands[boot2docker]) )); then
  return 1
fi

#
# Set the environment variables if boot2docker is running
#
if [[ `boot2docker status` == "running" ]]; then
    eval `boot2docker shellinit 2> /dev/null`
fi
