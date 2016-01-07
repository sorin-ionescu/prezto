source "${0:h}/external/zsh-autosuggestions/autosuggestions.zsh" || return 1

zle-line-init() {
  zle autosuggest-start
}

zle -N zle-line-init

zstyle -s ':prezto:module:editor' key-bindings 'key_bindings'
if [[ "$key_bindings" == vi ]]; then
  bindkey '' vi-forward-word
  bindkey '' vi-end-of-line
fi
