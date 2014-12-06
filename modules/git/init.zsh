#
# Provides Git aliases and functions.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[git] )); then
  return 1
fi

# Load dependencies.
pmodload 'helper'

# Source module files.
source "${0:h}/alias.zsh"

#
# Functions
#

# Create .gitignore files using gitignore.io service
function gi() {
  curl -L -s https://www.gitignore.io/api/$@
}
