# Complete task.
completion_file="${0:h}/_task"
if [[ ! -e "$completion_file" ]] && (( $+commands[taskwarrior] )); then
  ln -f -s "${commands[taskwarrior]:h:h}/share/doc/task/scripts/zsh/_task" "$completion_file" 2> /dev/null
else
  if [[ -L "$completion_file" ]]; then
    unlink "$completion_file" 2> /dev/null
  fi
fi
unset completion_file

# Style
zstyle ':completion:*:*:task:*' verbose yes
zstyle ':completion:*:*:task:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:*:task:*' group-name ''

# Aliases
alias t=task
compdef _task t=task

