# ------------------------------------------------------------------------------
#          FILE:  upgrade-oh-my-zsh.plugin.zsh
#   DESCRIPTION:  oh-my-zsh plugin file.
#        AUTHOR:  Jonathan Dahan <jonathan@jedahan.com>
#       VERSION:  0.3.0
# ------------------------------------------------------------------------------

# This plugin adds upgrade_zsh(), a relatively safe manual upgrade.
# It also has two dangerous options that are off by default.
#
# zstyle ':omz:plugin:upgrade' auto-commit 'yes'
#   auto-commit will commit whatever upstream changes there are without review
#   This will still favor local changes when conflict arive
#
# zstyle ':omz:plugin:upgrade' auto-upgrade 'yes'
#   auto-upgrade will check for updates 6 hours from the last successful upgrade

function upgrade_zsh() {
  cd ~/.oh-my-zsh
  current_path=$PWD

  zstyle -t ':omz:plugin:update-omz' auto-commit || local nocommit='--no-commit'

  if git pull $nocommit --strategy=recursive -X ours origin master; then
    zstyle -t ':omz:plugin:update-omz' color && printf "$FG[blue]"
    printf 'Hooray! oh-my-zsh is up-to-date :)'
    touch ~/.zsh-upgrade
  else
    printf 'Oh no! There was an error upgrading oh-my-zsh :('
    zstyle -t ':omz:plugin:update-omz' color && printf "$FG[red]"
  fi

  cd $current_path
}

if zstyle -t ':omz:plugin:upgrade' auto-upgrade; then
  if [ -f ~/.zsh-upgrade ]; then
    # upgrade if ~/.zsh-update was modified over 6 hours ago
    if [ ~/.zsh-upgrade(Nmh+6) ]; then
      upgrade_zsh
    fi
  else
    upgrade_zsh
  fi
fi
