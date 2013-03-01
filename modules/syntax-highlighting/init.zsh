#
# Integrates zsh-syntax-highlighting into Prezto.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if ! zstyle -t ':prezto:module:syntax-highlighting' color; then
  return 1
fi

# Source module files.
source "${0:h}/external/zsh-syntax-highlighting.zsh"

# Set the highlighters.
zstyle -a ':prezto:module:syntax-highlighting' highlighters 'ZSH_HIGHLIGHT_HIGHLIGHTERS'
if (( ${#ZSH_HIGHLIGHT_HIGHLIGHTERS[@]} == 0 )); then
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
fi

