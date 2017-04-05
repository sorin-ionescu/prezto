#
# Load Deer Module
#
fpath=("${0:h}/external" $fpath)

autoload -U deer
zle -N deer
zstyle -s ':prezto:module:deer' key-bindings 'key_bindings'
bindkey "$key_bindings" deer
unset key_bindings
