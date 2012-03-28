#
# Integrates zsh-syntax-highlighting into Oh My Zsh.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

if zstyle -t ':omz:module:syntax-highlighting' color; then
  source "${0:h}/external/zsh-syntax-highlighting.zsh"
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
fi

