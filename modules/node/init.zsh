#
# Loads the Node Version Manager and enables npm completion.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Zeh Rizzatti <zehrizzatti@gmail.com>
#

# Load manually installed NVM into the shell session.
if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
  source "$HOME/.nvm/nvm.sh"

# Load package manager installed NVM into the shell session.
elif (( $+commands[brew] )) && \
  [[ -d "${nvm_prefix::="$(brew --prefix 2> /dev/null)"/opt/nvm}" ]]; then
  source "$(brew --prefix nvm)/nvm.sh"
  unset nvm_prefix

# Load manually installed nodenv into the shell session.
elif [[ -s "$HOME/.nodenv/bin/nodenv" ]]; then
  path=("$HOME/.nodenv/bin" $path)
  eval "$(nodenv init - --no-rehash zsh)"

# Load package manager installed nodenv into the shell session.
elif (( $+commands[nodenv] )); then
  eval "$(nodenv init - --no-rehash zsh)"

# Return if requirements are not found.
elif (( ! $+commands[node] )); then
  return 1
fi

# Load NPM and known helper completions.
typeset -A compl_commands=(
  npm   'npm completion'
  grunt 'grunt --completion=zsh'
  gupl  'gulp --completion=zsh'
)

for compl_command in "${(k)compl_commands[@]}"; do
  if (( $+commands[$compl_command] )); then
    cache_file="${TMPDIR:-/tmp}/prezto-$compl_command-cache.$UID.zsh"

    # Completion commands are slow; cache their output if old or missing.
    if [[ "$commands[$compl_command]" -nt "$cache_file" \
          || "${ZDOTDIR:-$HOME}/.zpreztorc" -nt "$cache_file" \
          || ! -s "$cache_file" ]]; then
      command ${=compl_commands[$compl_command]} >! "$cache_file" 2> /dev/null
    fi

    source "$cache_file"

    unset cache_file
  fi
done

unset compl_command{s,}
