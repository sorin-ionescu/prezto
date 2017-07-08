#
# Defines Mix Phoenix aliases.
#
# Authors:
#   Han Ngo <nntruonghan@gmail.com>
#

# Load dependencies.
pmodload 'elixir'

# Return if requirements are not found.
if (( ! $+commands[mix phoenix.new] )); then
  return 1
fi

# Source module files.
source "${0:h}/alias.zsh"