#!/usr/bin/make shebang
#                     _              ____             _
#  _ __  _ __ ___ ___| |_ ___       |  _ \  ___   ___| | _____ _ __
# | '_ \| '__/ _ \_  / __/ _ \ _____| | | |/ _ \ / __| |/ / _ \ '__|
# | |_) | | |  __// /| || (_) |_____| |_| | (_) | (__|   <  __/ |
# | .__/|_|  \___/___|\__\___/      |____/ \___/ \___|_|\_\___|_|
# |_|
# h@h-lo.me 20191025 004745 -0700 PDT 1571989665 d(-_- )b...
# This makefile automates image building and container management
# for easy development of prezto and prezto-plugins without messing
# up your current configuration. Prezto is installed fresh on an
# alpine container, where you may add your edits
#
#######################################################################
# REPO and IMG define the TAG for our image. this is how it gets named
# when pushed to dockerhum. REPO should be your dockerhub username
# IMG would be nice if its related to the project.
REPO       = hlecuanda
IMG        = prezto-dev
TAG        = $(REPO)/$(IMG)
# ALLCODE recirds all code files so we can have the docker image
# depend on all of them. if any file changes, the image gets rebuilt
ALLCODE   != find . -type f | grep -vEe '^\./\.+|*.md'
RUNCOMS   != ls runcoms
# The context is the current directory. this is important if you have
# a buildserver, v.gr on gitlab or google cloud. its still needed for
# local builds. so don't touch this, unless you know what you're doing
CONTEXT    = .
# All reciipes on this makefile are zsh scripts, not bash or sh
# scripts, so we don't have to be context-switching
SHELL      = zsh
# This removes the default build rules for gmake's built in suffixes
# when debugging the Makefile, output is a lot more readable, plus
# if you're not making C programs, it just makes sense to avoid
# mistery bugs
.SUFFIXES  =

# We don't want to fail recipies on error for the targets if .IGNORE
.IGNORE: clean realclean ;

# These targets don't create files and are defined for convenience.
# note that other targets do create real files which are used to
# determine the state of the build
.PHONY: default run clean realclean ;

# an empty recipe, to avoid expensive operations if we "make" by
# mistake. it can be made to depend on another target and it will
# become the target of a "make" call with no arguments, vg.r:
# default: image; results in "make"  and "make image" doing the same
default: ;

# a user callable target, depends on .container/image whiech records
# the timestamp of the last successfuly built image
image: .container/image ;

# we declare .container/image to depend on $(ALLCODE) which contains
# all files in the distribution. thus, if ANY file changes, it makes
# our image obsolete and will be re-made on next make command
.container/image: $(ALLCODE)
	docker build -t $(TAG) $(CONTEXT)
	[[ ! -d .container ]] && mkdir .container || :
	touch $@

# NOTE: The following targets ( .homercs clone and .clone ) are
# run inside the container while building a container image. They are
# called from the Dockerfile when you "make image". .homercs creates
# the dotfiles on our home directory and depends on .clone, so .clone
# should be made before .homercs. We're spelling these out explicitly
# for clarity instead of using Makefile enchantments that would make
# this a 2 line recipe
.homercs: .clone
	ln -s .zprezto/runcoms/zshenv /home/prezto/.zshenv
	ln -s .zprezto/runcoms/zprofile /home/prezto/.zprofile
	ln -s .zprezto/runcoms/zshrc /home/prezto/.zshrc
	ln -s .zprezto/runcoms/zlogin /home/prezto/.zlogin
	ln -s .zprezto/runcoms/zlogout /home/prezto/.zlogout
	touch $@

# clones the prezto repository we have copied from the build context
# into the container, into a .zprezto directory, as the installation
# instructions recommend.
.clone:
	git clone --recursive src .zprezto
	touch $@

# This runs an interactive (-it) ephemeral (--rm) container named
# $(IMG) created from the image stored at $(TAG) it is made to depend
# on container/image so that it checks whether image is up to # date.
# Given that image depends on $(ALLCODE), calling "make run" will use
# the latest image, unless any code file hasa changed in which case,
# the image is rebuilt and then run.
run: .container/image
	docker run -it --rm -h $(IMG) --name $(IMG) $(TAG)

# Removes the current container and image, so we can build a new one
# from scratch. If you want a real clean slate, then "make realclean"
clean:
	docker container rm $(TAG):
	docker image rm $(TAG):

# Deep cleaning, will remove dangling (intermediate build) images
# and containers for which a final image or container cannot be found
# (i.e has been deleted by clean or removed after usage for ephemeral
# containers. Run every once in a while.
realclean:
	$(MAKE) clean
	docker container prune
	docker image prune

# vim: set ft=make sw=2 tw=7 fdm=manual noet :
