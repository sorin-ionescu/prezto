#!/usr/bin/env zsh
  local opts withvals

  zmodload zsh/zutil || { <<< 'Requires zparseopts'; false; return }

  [ -z $commands[docker] ] && { <<< 'Requires Docker'; false; return }

  zparseopts -D -E -M -a opts -A withvals - \
             h=hlp  -help=h              \
             i:     -image=i             \
             N:     -name=N              \
             n      -dry-run=n           \
             p      -persistant=p        \
             r      -run=r               \
                    -zdotdir:            \
                    -zpreztodir:

  if (( $#hlp == 1 )) ; then
    <<-USAGE
    ${0}: create an ephemeral  prezto container using docker

    usage:
        ${0} [options] -- [addtl-args]

    options:
        -h, --help           : print this message
        -p, --persistant     : make a persistant container
        -N NAME, --name=NAME : set container name to NAME (default: prezto)
        -n, --dry-run        : see what command would be run without doing so
        -r 'CMD' --run 'CMD' : run 'CMD' on the container (quote CMD)
        -i IMG,  --image=IMG : create container from image IMG (default hlecuanda/prezto-dev)
        -zdotdir=PATH        : use dotfiles from local PATH
        -zpreztodir          : override default prezto to local PATH

    example:
        ${0} -n myruncoms -zdotdir=$HOME

       creates an ephemeral container named myruncoms using
        dotfiles found in ${HOME}

        ${0} -n illbeback  -p

        creates a persistant container named illbeback if such
        container exists, then startit and attach to it

        ${0} -n ivebeenback -r 'apk add python'

        spins up the a container named ivebeenback, and runs
        the comand 'apk add python'. the container stops when
        done.

		USAGE
  fi

  local image="hlecuanda/prezto-dev"
  local name="prezto"
  local persistant="--rm"
  local zdotdir=""
  local zpreztodir=""
  local dockercmd='docker run'
  local dockerpull=""

  for opt  in ${(k)withvals}
    case $opt in
      -i)
        image="$withvals[-i]" ;;
      -n)
        local dryrun="print --" ;;
      -N)
        name="$withvals[-n]" ;;
      -p)
        persistant="" ;;
      -zdotdir)
        zdotdir="-v ${(qq)withvals[-zdotdir]}:/home/prezto/zdotdir -e 'ZDOTDIR=/home/prezto/zdotdir  " ;;
      -zpreztodir)
        zpreztodir="-v ${(qq)withvals[-zpreztodir]}:/home/prezto/zpreztodir -e 'ZPREZTODIR=/home/prezto/zpreztodir  " ;;
    esac

  docker images \
  | grep prezto-dev \
  &>>! /dev/null || dockerpull="docker pull $image && "

  dockercmd="$dryrun $dockerpull $dockercmd $persistant -h $name "
  dockercmd="$dockercmd -name $name $zdotdir $zpreztodir $image"

  cmd=$(echo $dockercmd | tr -s \  )

  ${(z)cmd}


#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
