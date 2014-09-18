if zstyle -t ':prezto:module:editor' key-bindings 'emacs' 'vi'; then
  for keymap in 'emacs' 'viins'; do
    bindkey -M "$keymap" "\EOw" beginning-of-line
    bindkey -M "$keymap" "\EOq" end-of-line
    bindkey -M "$keymap" "\EOt" backward-char
    bindkey -M "$keymap" "\EOv" forward-char
    bindkey -M "$keymap" "\EOx" up-line-or-history
    bindkey -M "$keymap" "\EOr" down-line-or-history
  done
fi
unset keymap
