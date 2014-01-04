#
# Defines Yaourt aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Yaourt does not need sudo
_pacman_sudo=''

#
# Aliases
#

# Disable color.
if ! zstyle -t ':prezto:module:pacman:yaourt' color; then
  alias pacman='yaourt --nocolor'
fi

# Manages .pac* files.
alias pacc='yaourt -C'

