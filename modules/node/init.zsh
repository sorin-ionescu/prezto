#
# Configures Node local installation, loads version managers, and defines
# variables and aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Zeh Rizzatti <zehrizzatti@gmail.com>
#

# Possible lookup locations.
local_nvm_paths=({$NVM_DIR,{$XDG_CONFIG_HOME/,$HOME/.}nvm}/nvm.sh(N))
local_nodenv_paths=({$NODENV_ROOT,{$XDG_CONFIG_HOME/,$HOME/.}nodenv}/bin/nodenv(N))

# Load manually installed NVM into the shell session.
if [[ -s ${local_nvm::=$local_nvm_paths[1]} ]]; then
  source "$local_nvm --no-use"
  unset local_nvm{,_paths}

# Load package manager installed NVM into the shell session.
elif (( $+commands[brew] )) \
      && [[ -d "${nvm_prefix::="$(brew --prefix nvm 2> /dev/null)"}" ]]; then
  source "$nvm_prefix/nvm.sh --no-use"
  unset nvm_prefix

# Load manually installed nodenv into the shell session.
elif [[ -s ${local_nodenv::=$local_nodenv_paths[1]} ]]; then
  path=("$local_nodenv:h" $path)
  eval "$(nodenv init - --no-rehash zsh)"
  unset local_nodenv{,_paths}

# Load package manager installed nodenv into the shell session.
elif (( $+commands[nodenv] )); then
  eval "$(nodenv init - --no-rehash zsh)"

# Return if requirements are not found.
elif (( ! $+commands[node] )); then
  return 1
fi

# Load NPM and known helper completions.
typeset -A _compl_commands=(
  npm   'npm completion'
  grunt 'grunt --completion=zsh'
  gulp  'gulp --completion=zsh'
)

for _compl_command in "${(k)_compl_commands[@]}"; do
  if (( $+commands[$_compl_command] )); then
    cache_file="${XDG_CACHE_HOME:-$HOME/.cache}/prezto/${_compl_command}-cache.zsh"

    # Completion commands are slow; cache their output if old or missing.
    if [[ "$commands[$_compl_command]" -nt "$cache_file" \
          || "${ZDOTDIR:-$HOME}/.zpreztorc" -nt "$cache_file" \
          || ! -s "$cache_file" ]]; then
      mkdir -p "$cache_file:h"
      command ${=_compl_commands[$_compl_command]} >! "$cache_file" 2> /dev/null
    fi

    source "$cache_file"

    unset cache_file
  fi
done

unset _compl_command{s,}
