# prezto docker container

This branch contains a Dockerfile and a Makefile that hopefully may
prove helpful for prezto development.

The idea is to have a totally independendn and isolated environemnet
in which to quickly make changes to either prezto-core or any plugin
that may bein development, enabling automated testing and even
continuous integration.

[![asciicast](https://asciinema.org/a/277054.svg)](https://asciinema.org/a/277054)

The container is a basic install of alpine linux, so the image
download is reasonably small

On the container we have a few utilities and additionalsoftware that
prezto has core support for, and you can  check it out in a snap by doing:

```bash
    docker pull hlecuanda/prezto-dev:latest
```
once you have the image, create a container from it with:

```bash
docker run -it --rm -h prezto hlecuanda/prezto-dev:latest
```

That will set you on a prompt within the container with a
vanilla install of prezto.

A development and testing workflow can be achieved by mounting the stuff
you're working on to the image's filesystem:

```bash
docker run -it --rm -h prezto \
        -v /local/path:/home/prezto \
        -v /local/path/zdotdir:/home/preztoa \
        -v /local/module-dev-src:/home/prezto/.zprezto/modules/yourmodulea \
        hlecuanda/prezto-dev:latest
```

the third volume mapping is particularly interesting. you can
develop on your own machine and environnment, and when spinning up the
container, your actual source is already in-plase as if installed on a
vanilla prezto instance

keep in mind that the container are ephemeral, unless you remove the
`--rm` option which will create new containers each time you run the
command, but the changes to the filesystemwill persist on a container
file that you can later spin up again to re-use.

I have found epehermeral containers to be most useful since you get an
untainted, pristine environment for testing every time you spin up the
container.

hope this turns out to be useful. 
