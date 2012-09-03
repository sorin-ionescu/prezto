#
# Defines Yaourt aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Aliases
#

# Disable color.
if ! zstyle -t ':prezto:module:pacman:yaourt' color; then
  alias pacman='pacman --nocolor'
fi

# Manages .pac* files.
alias pacc='pacman -C'

