# Updates oh-my-zsh.
# Jonathan Dahan <jonathan@jedahan.com>

# This plugin adds auto-update support to omz.
#
# zstyle ':omz:plugin:update-omz' auto-commit 'yes'
#   auto-commit will commit whatever upstream changes there are without review
#   This will still favor local changes when conflict arive
#
# zstyle ':omz:plugin:update-omz' auto-update 'yes'
#   auto-update will check for updates 6 hours from the last successful upgrade

function update-omz() {
  current_path=$PWD
  cd $HOME/.oh-my-zsh

  zstyle -t ':omz:plugin:update-omz' auto-commit || local nocommit='--no-commit'

  if git pull $nocommit --strategy=recursive -X ours origin master; then
    zstyle -t ':omz:plugin:update-omz' color && printf "$FG[blue]"
    printf 'Hooray! oh-my-zsh is up-to-date :)'
    touch ~/.omz-update
  else
    zstyle -t ':omz:plugin:update-omz' color && printf "$FG[red]"
    printf 'Oh no! There was an error updating oh-my-zsh :('
  fi

  cd "$current_path"
}

if zstyle -t ':omz:plugin:update-omz' auto-update; then
  if [ -f ~/.omz-update ]; then
    # update if ~/.omz-update was modified over 6 hours ago
    if [ ~/.omz-update(Nmh+6) ]; then
      update-omz
    fi
  else
    update-omz
  fi
fi
