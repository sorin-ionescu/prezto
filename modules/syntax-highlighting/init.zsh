#
# Integrates zsh-syntax-highlighting into Oh My Zsh.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Check for the minimum supported version.
min_zsh_version='4.3.10'
if ! autoload -Uz is-at-least || ! is-at-least "$min_zsh_version"; then
  return 1
fi
unset min_zsh_version

if zstyle -t ':omz:module:syntax-highlighting' color; then
  source "${0:h}/external/zsh-syntax-highlighting.zsh"

  # Set the highlighters.
  zstyle -a ':omz:module:syntax-highlighting' highlighters 'ZSH_HIGHLIGHT_HIGHLIGHTERS'
  if (( ${#ZSH_HIGHLIGHT_HIGHLIGHTERS[@]} == 0 )); then
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)
  fi
fi

