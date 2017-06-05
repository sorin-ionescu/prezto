##
# dircycle plugin: enables cycling through the directory
# stack using Ctrl+Shift+Left/Right

alias dircycle-left="pushd -q +1"
alias dircycle-right="pushd -q -0"

eval "insert-cycledleft () { zle push-line; LBUFFER='dircycle-left'; zle accept-line }"
zle -N insert-cycledleft
bindkey "\e[1;6D" insert-cycledleft
eval "insert-cycledright () { zle push-line; LBUFFER='dircycle-right'; zle accept-line }"
zle -N insert-cycledright
bindkey "\e[1;6C" insert-cycledright
