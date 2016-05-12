#
# Defines docker and docker-machine commands & aliases
#
# Authors:
#   andrew williams (https://github.com/skarfacegc)
#

# docker-machine
alias dm='docker-machine'

dm-start() {
  docker-machine start $1
   eval "$(docker-machine env $1)"
}


# Docker alases
alias doc='docker'
alias docp='docker ps'
alias docpa='docker ps -a'
alias docimg='docker images'
