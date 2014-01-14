#!/bin/zsh

script_name="${0:t}"
script_version='1.0.0'
cached_argv="${argv}"
backup_dir="$HOME/.prezto-backup/$(date +'%Y-%m-%d-%H-%M-%S')"

# Writes to standard error.
function print-error {
  print "${script_name}: ${@}" >&2
}

# Writes to standard output.
function print-info {
  print "${@}" >&1
}

# Writes version information to standard errror.
function version {
  print "${script_name} ${script_version}

Copyright (c) 2013 Sorin Ionescu

This program is free software. You may modify or distribute it
under the terms of the MIT License." >&2
}

# Writes help to standard error.
function help {
  print "Usage: ${script_name} [‐option ...] archive [directory]

Options:
    -v, --version          Display version and copyright
    -h, --help             Display this help

Report bugs to <sorin.ionescu@gmail.com>." >&2
}

# Backs up existing files.
function backup {
  local from="$1"
  local to="$2"

  if [[ ! -e "$from" ]]; then
    return
  fi

  mkdir -p "$to:h"
  mv "$from" "$to"
}

# Parse switches.
while [[ "${1}" == -* ]]; do
    case "${1}" in
        ( -v | --version )
            version
            exit 0
        ;;
        ( -h | --help )
            help
            exit 0
        ;;
        ( -- )
            shift
            break
        ;;
        ( -* )
            print-error "invalid option: ${1}"
            help
            exit 0
        ;;
    esac
done

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh

is-true "$use_color" && printf "$FG[green]"
printf '%s' \
'________                  _____
___  __ \___________________  /______
__  /_/ /_  ___/  _ \__  /_  __/  __ \
_  ____/_  /   /  __/_  /_/ /_ / /_/ /
/_/     /_/    \___/_____/\__/ \____/
'
is-true "$use_color" && printf "$FG[cyan]"
print
print 'Prezto has been updated to the latest version.'
print 'Follow me on GitHub at https://github.com/sorin-ionescu/prezto.'

exec zsh


