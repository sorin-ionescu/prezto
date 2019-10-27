# Prezto Docker Container

This branch contains a Dockerfile and a Makefile that hopefully may
prove helpful for prezto development.

The idea is to have a totally independent and isolated environemnet
in which to test changes to either prezto-core or any plugin that you
may be working on, **without disrupting your environment**, thus enabling
automated testing and even continuous integration.

This is a proof of concept, it may not be even a good idea to have
this on the main prezto repository. on the other hand, the container
image should depend on the code, so if the team finds this to be a
useful tool, there are choices to be made in that respect. My
intention is to introduce this as a helpful tool for development and
for new users to try prezto easely

Here is a screencast showing what the container can do so far

[![asciicast](https://asciinema.org/a/277054.svg)](https://asciinema.org/a/277054)

The container is a basic install of [alpine linux][1] so the download
is reasonably small at around 200M, since  debian based images can
weigh in around 1.5G.

On the container we have a few utilities and additional software that
prezto has core support for, (tmux, make, etc) and you can try it i
easily by running:

```bash
    docker pull hlecuanda/prezto-dev:latest
```

once you have the image, create a container from it:

```bash
    docker run -it --rm -h prezto hlecuanda/prezto-dev:latest
```

That will create an interactive (`--it`) ephemeral container (`--rm`)
whose hostname is prezto (`-h prezto`) based on the aforementioned
imag. you should be sitting at the plain sorin prompt in a brand new
prezto instance.

A development and testing workflow can be achieved by mounting a
project's directory on to the image's filesystem:

```bash
    cd /path/to/project/root
    docker run -it --rm -h prezto \
            -v $(pwd):/home/prezto/.zprezto/modules/${:-$(pwd):t} \
            hlecuanda/prezto-dev:latest
```

This will mount the current directory on the container's filesystem,
you can develop on your own machine and environnment, and test your
changes running on the container, your actual source will already be
in-place on prezto's directory hierarchy, as if it was just cloned
recursively (v.gr for modules with extenral dependencies)

Keep in mind that the containers created in this fashion are ephemeral,
so anything you write on the contain'ers filesystem will be lost,
unless you remove the `--rm` option like so:

```bash
    cd /path/to/project/root
    docker run -it -h prezto --name prezto \
            -v $(pwd):/home/prezto/.zprezto/modules/${:-$(pwd):t} \
            hlecuanda/prezto-dev:latest
```
This will create a container named prezto, (`--name prezto`) with it's
hostname set to prezto also (`-h prezto`) that will retain changes
made to it's filesystem. When you detach, the container willi stop and
you can spinit up again using:

```bash
    docker start -ai prezto
```

Containers started this way will remember the volume mounts they were
created with, so the project directory we previously mounted with
`-v` on the `docker run` command, will be ready on the image.

I have found epehermeral containers to be most useful since you get an
untainted, pristine environment for testing every time you spin up the
container.

Since the docker commands can be a bit verbose, the included Makefile
automates some of the frequent steps in the workflow, although it can
be replaced by shell functions  quite easily;

```zsh


function prezto-container () {
# latest source at https://gist.github.com/hlecuanda/78a6a39877c9753230a11c2d8832f4b6

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
}

#  vim: set ft=zsh sw=2 tw=0 fdm=manual et :
```
hope this turns out to be useful.
[1]:https://alpinelinux.org
