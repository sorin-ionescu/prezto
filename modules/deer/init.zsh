#
# Load Deer Module
#
fpath=("${0:h}/external" $fpath)

autoload -U deer
zle -N deer
bindkey '\ek' deer
