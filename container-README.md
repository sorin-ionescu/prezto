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

The container is a basic install of [alpine linux](https://alpinelinux.org) so the download
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
so anything you write on the containers filesystem will be lost,
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
be replaced by [a shell function](https://gist.github.com/hlecuanda/78a6a39877c9753230a11c2d8832f4b6)
quite easily.


hope this turns out to be useful.
