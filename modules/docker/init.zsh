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
    eval $(docker-machine env $1)
}

#
# Aliases
#

alias dk='docker'
alias dka='docker attach'
alias dkb='docker build'
alias dkd='docker diff'
alias dke='docker exec'
alias dkE='docker exec -it'
alias dkh='docker history'
alias dki='docker images'
alias dkin='docker inspect'
alias dkk='docker kill'
alias dkl='docker logs'
alias dkli='docker login'
alias dklo='docker logout'
alias dkn='docker network'
alias dkp='docker pause'
alias dkP='docker unpause'
alias dkps='docker ps'
alias dkpsa='docker ps -a'
alias dkr='docker run'
alias dkR='docker run -it --rm'
alias dkRe='docker run -it --rm --entrypoint /bin/bash'
alias dkrm='docker rm'
alias dkrmi='docker rmi'
alias dkrn='docker rename'
alias dks='docker start'
alias dkS='docker restart'
alias dkss='docker stats'
alias dksw='docker swarm'
alias dkt='docker tag'
alias dktop='docker top'
alias dkup='docker update'
alias dkv='docker volume'
alias dkV='docker version'
alias dkw='docker wait'
alias dkx='docker stop'

# Clean up exited containers
alias dkrmC='docker rm $(docker ps -a | grep Exited | awk '"'"'{ print $1 }'"'"')'

# Clean up dangling images
alias dkrmI='docker rmi $(docker images -f dangling=true -q)'

# Clean up dangling volumes
alias dkrmV='docker volume rm $(docker volume ls -qf dangling=true)'

## Non aliased docker commands:
# commit   -- Create a new image from a container's changes
# cp       -- Copy files/folders between a container and the local filesystem
# create   -- Create a new container
# daemon   -- Enable daemon mode
# events   -- Get real time events from the server
# export   -- Export a container's filesystem as a tar archive
# import   -- Import the contents from a tarball to create a filesystem image
# info     -- Display system-wide information
# load     -- Load an image from a tar archive or STDIN
# node     -- Manage Docker Swarm nodes
# port     -- List port mappings or a specific mapping for the container
# pull     -- Pull an image or a repository from a registry
# push     -- Push an image or a repository to a registry
# save     -- Save one or more images to a tar archive (streamed to STDOUT by default)
# search   -- Search the Docker Hub for images
# service  -- Manage Docker services

alias dkm='docker-machine'
alias dkma='docker-machine active'
alias dkmcp='docker-machine scp'
alias dkmin='docker-machine inspect'
alias dkmip='docker-machine ip'
alias dkmk='docker-machine kill'
alias dkmls='docker-machine ls'
alias dkmpr='docker-machine provision'
alias dkmps='docker-machine ps'
alias dkmrg='docker-machine regenerate-certs'
alias dkmrm='docker-machine rm'
alias dkms='docker-machine start'
alias dkmsh='docker-machine ssh'
alias dkmst='docker-machine status'
alias dkmS='docker-machine restart'
alias dkmu='docker-machine url'
alias dkmup='docker-machine upgrade'
alias dkmV='docker-machine version'
alias dkmx='docker-machine stop'

# Non aliased docker-machine commands:
# config  -- Print the connection config for machine
# create  -- Create a machine

alias dkc='docker-compose'
alias dkcb='docker-compose build'
alias dkcd='docker-compose down'
alias dkce='docker-compose exec'
alias dkck='docker-compose kill'
alias dkcl='docker-compose logs'
alias dkp='docker-compose pause'
alias dkP='docker-compose unpause'
alias dkcps='docker-compose ps'
alias dkcr='docker-compose run'
alias dkcrm='docker-compose rm'
alias dkcs='docker-compose start'
alias dkcsc='docker-compose scale'
alias dkcS='docker-compose restart'
alias dkcu='docker-compose up'
alias dkcV='docker-compose version'
alias dkcx='docker-compose stop'

## Non aliased docker-compose commands:
# bundle  -- Generate a Docker bundle from the Compose file
# config  -- Validate and view the compose file
# create  -- Create services
# events  -- Receive real time events from containers
# port    -- Print the public port for a port binding
# pull    -- Pull service images
# push    -- Push service images
