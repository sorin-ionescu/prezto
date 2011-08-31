#!/bin/zsh

# Makes the dirstack more persistant.

# $zdirstore is the file used to persist the stack.
zdirstore="$HOME/.zdirstore"

function dirpersist-install() {
  if ! grep 'dirpersist-store' "$HOME/.zlogout" 2> /dev/null; then
    if read -q \?"Would you like to set up your .zlogout file for use with dirspersist? (y/n) "; then
      echo "# Store dirs stack\n# See ~/.oh-my-zsh/plugins/dirspersist.plugin.zsh\ndirpersist-store" >>! "$HOME/.zlogout"
    else
      echo "\nIf you don't want this message to appear, remove dirspersist from \$plugins."
    fi
  fi
}

function dirpersist-store() {
  dirs -p | perl -e 'foreach (reverse <STDIN>) {chomp;s/([& ])/\\$1/g ;print "if [ -d $_ ]; then pushd -q $_; fi\n"}' > "$zdirstore"
}

function dirpersist-restore() {
  if [[ -f "$zdirstore" ]]; then
    source "$zdirstore"
  fi
}

DIRSTACKSIZE=10
setopt autopushd pushdminus pushdsilent pushdtohome pushdignoredups

dirpersist-install
dirpersist-restore

# Make popd changes permanent without having to wait for logout
alias popd="popd;dirpersist-store"

