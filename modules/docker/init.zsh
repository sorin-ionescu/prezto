#
# Defines docker and boot2docker commands & aliases
#
# Authors:
#   andrew williams (https://github.com/skarfacegc)
#

# Only setup the boot2docker commands and aliases if we're on OSX
if [[ "$OSTYPE" == darwin* ]]; then

    # Set environment if boot2docker is already running
    if [[ $(boot2docker status) == "running" ]]; then
        eval $(boot2docker shellinit 2> /dev/null)
    fi
    
    alias b2d='boot2docker'
    alias b2dstart='boot2docker start &> /dev/null && eval $(boot2docker shellinit 2> /dev/null)'
    alias b2dstop='boot2docker stop'
    alias b2dssh='boot2docker ssh'
    alias b2di='boot2docker info'
    
fi


# Docker alases
alias doc='docker'
alias docp='docker ps'
alias docpa='docker ps -a'
alias docimg='docker images'

docbash() {
    docker exec -t -i "$1" /bin/bash
}
compdef -e 'words[1]=(docker exec); service=docker; (( CURRENT+=1 )); _docker' docbash

