alias please='sudo $(fc -ln -1)'

previous_command_with_sudo() { zle beginning-of-line; zle -U "sudo $(fc -ln -1)" }
zle -N previous-command-with-sudo previous_command_with_sudo
bindkey "^S" previous-command-with-sudo # Ctrl+Shift+S
