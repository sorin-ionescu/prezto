#
# Configures Emacs dependency management.
#
# Authors: Sebastian Wiesner <lunaryorn@gmail.com>
#

# Return if requirements are not found.
if [[ ! -d "$HOME/.carton" ]]; then
  return 1
fi

# Prepend Carton bin directory.
path=($HOME/.carton/bin $path)

# Load Carton completion
source "$HOME/.carton/etc/carton_completion.zsh" 2> /dev/null

#
# Aliases
#

alias cai='carton install'
alias cau='carton update'
alias caI='carton init'
alias cae='carton exec'
