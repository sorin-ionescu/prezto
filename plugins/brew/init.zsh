# Complete brew.
completion_file="${0:h}/_brew"
if [[ ! -e "$completion_file" ]] && (( $+commands[brew] )); then
  ln -f -s "$(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh" "$completion_file" 2> /dev/null
else
  if [[ -L "$completion_file" ]]; then
    unlink "$completion_file" 2> /dev/null
  fi
fi
unset completion_file

# Aliases
alias brews='brew list -1'

