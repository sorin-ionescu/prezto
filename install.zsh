#!/usr/bin/env zsh
setopt PIPEFAIL
setopt EXTENDED_GLOB

## Ensure colors are available.
autoload -U colors && colors

PREZTO_DIRECTORY="${ZDOTDIR:-$HOME}/.zprezto"
PREZTO_GIT_REMOTE="https://github.com/sorin-ionescu/prezto.git"

function print_header {
  printf "\n${fg[blue]}%s${reset_color}\n" "$@"
}

function print_success {
  printf "${fg[green]}✓ %s${reset_color}\n" "$@"
}

function print_notice {
  printf "${fg[yellow]}i %s${reset_color}\n" "$@"
}

function print_warning {
  printf "${fg[magenta]}! %s${reset_color}\n" "$@"
}

function print_error {
  printf "${fg[red]}x %s${reset_color}\n" "$@"
}

function print_question {
  printf "${fg[cyan]}? %s${reset_color}\n" "$@"
}

function seek_confirmation {
  print_warning "$@"
  read -q "REPLY?${fg[cyan]}? Continue? (y/n)${reset_color} " -n 1
  printf "\n"
}

function is_confirmed {
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    return 0
  fi

  return 1
}

TRAPINT() {
  print ""
  print_error "Caught SIGINT, aborting."
  return $(( 128 + $1 ))
}

print_header "Prezto — Instantly Awesome Zsh"
seek_confirmation "Do you want to proceed with the installation"
if is_confirmed; then
  print_notice "Cloning prezto to $PREZTO_DIRECTORY ..."
  if [[ ! -d $PREZTO_DIRECTORY ]]; then
     git clone --recursive "$PREZTO_GIT_REMOTE" "$PREZTO_DIRECTORY"
  fi
  print_success "... done!"

  print_notice "Creating sym links for prezto rcfiles ..."
  for rcfile in "$PREZTO_DIRECTORY"/runcoms/^README.md(.N); do
    tarfile="${ZDOTDIR:-$HOME}/.${rcfile:t}"
    if [[ -f "$tarfile" ]]; then
      print_warning "$tarfile already exists, creating a backup as ${tarfile}.backup"
      mv "$tarfile" "${tarfile}.backup"
    fi
    ln -s "$rcfile" "$tarfile"
  done
  print_success "... done!"
else
  print_error "Installation aborted."
fi
