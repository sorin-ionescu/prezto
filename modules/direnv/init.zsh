#
# Loads direnv, if installed 
#
# Authors:
#   Philihp Busby <philihp@gmail.com>
#

# Return if not installed/available
if (( ! $+commands[direnv] )); then
  return 1
fi

# Install direnv hook for zsh
eval "$(direnv hook zsh)"
