#
# Integrates zaw into Prezto.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
pmodload 'editor'

# Source module files.
source "${0:h}/external/zaw.zsh" || return 1

#
# Highlighting
#

zstyle -s ':prezto:module:zaw:color' error 'REPLY' || REPLY='bg=red,fg=white'
zstyle ':filter-select:highlight' error "$REPLY"

zstyle -s ':prezto:module:zaw:color' marked 'REPLY' || REPLY='bg=blue,fg=white'
zstyle ':filter-select:highlight' marked "$REPLY"

zstyle -s ':prezto:module:zaw:color' matched 'REPLY' || REPLY='bg=magenta,fg=white'
zstyle ':filter-select:highlight' matched "$REPLY"

zstyle -s ':prezto:module:zaw:color' selected 'REPLY' || REPLY='standout'
zstyle ':filter-select:highlight' selected "$REPLY"

zstyle -s ':prezto:module:zaw:color' title 'REPLY' || REPLY='fg=yellow'
zstyle ':filter-select:highlight' title "$REPLY"

if ! zstyle -t ':prezto:module:zaw' color; then
  for style in error marked matched selected title; do
    zstyle -d ':filter-select:highlight' "$style"
  done
fi

#
# Search
#

zstyle -s ':prezto:module:zaw' max-lines 'REPLY' || REPLY=0
zstyle ':filter-select' max-lines "$REPLY"

zstyle -b ':filter-select' rotate-list 'REPLY' || REPLY='no'
zstyle ':filter-select' rotate-list "$REPLY"

zstyle -b ':prezto:module:zaw' extended-search 'REPLY' || REPLY='no'
zstyle ':filter-select' extended-search "$REPLY"

if ! zstyle -t ':prezto:module:zaw' case-sensitive; then
  zstyle ':filter-select' case-insensitive 'yes'
fi

#
# Key Bindings
#

if [[ -n "$key_info" ]]; then
  # Emacs
  bindkey -M emacs "$key_info[Control]R" zaw-history
  bindkey -M emacs "$key_info[Control]S" zaw-history

  # Vi
  bindkey -M vicmd "/" zaw-history
  bindkey -M vicmd "?" zaw-history
fi

