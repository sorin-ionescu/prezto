# ------------------------------------------------------------------------------
#          FILE:  git.plugin.zsh
#   DESCRIPTION:  oh-my-zsh plugin file.
#        AUTHOR:  Sorin Ionescu <sorin.ionescu@gmail.com>
#       VERSION:  1.0.0
# ------------------------------------------------------------------------------

# Source plugin files.
source "${0:h}/info.zsh"
source "${0:h}/utility.zsh"
source "${0:h}/alias.zsh"

# Get the latest Git completion.
completion_file="${0:h}/_git"
completion_file_url='http://zsh.git.sourceforge.net/git/gitweb.cgi?p=zsh/zsh;a=blob_plain;f=Completion/Unix/Command/_git;hb=HEAD'
if [[ ! -e "$completion_file" ]] && (( $+commands[git] )); then
  if (( $+commands[curl] )); then
    curl -L "$completion_file_url" -o "$completion_file" &> /dev/null &!
  fi

  if (( $+commmands[wget] )); then
    wget -C "$completion_file_url" -O "$completion_file" &> /dev/null &!
  fi
fi
unset completion_file
unset completion_file_url

