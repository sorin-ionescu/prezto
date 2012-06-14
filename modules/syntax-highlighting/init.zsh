#
# Integrates zsh-syntax-highlighting into Oh My Zsh.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

if zstyle -t ':omz:module:syntax-highlighting' color; then
  source "${0:h}/external/zsh-syntax-highlighting.zsh"

  # Set the highlighters.
  zstyle -a ':omz:module:syntax-highlighting' highlighters 'ZSH_HIGHLIGHT_HIGHLIGHTERS'
  if (( ${#ZSH_HIGHLIGHT_HIGHLIGHTERS[@]} == 0 )); then
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)
  fi
fi

