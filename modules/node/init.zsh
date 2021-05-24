#
# Configures Node local installation, loads version managers, and defines
# variables and aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Zeh Rizzatti <zehrizzatti@gmail.com>
#   Indrajit Raychaudhuri <irc@indrajit.com>
#

# Possible lookup locations.
local_nodenv_paths=({$NODENV_ROOT,{$XDG_CONFIG_HOME/,$HOME/.}nodenv}/bin/nodenv(N))
local_nvm_paths=({$NVM_DIR,{$XDG_CONFIG_HOME/,$HOME/.}nvm}/nvm.sh(N))

# Load manually installed nodenv into the shell session.
if [[ -s ${local_nodenv::=$local_nodenv_paths[1]} ]]; then
  path=("$local_nodenv:h" $path)
  eval "$(nodenv init - --no-rehash zsh)"
  unset local_nodenv{,_paths}

# Load package manager installed nodenv into the shell session.
elif (( $+commands[nodenv] )); then
  eval "$(nodenv init - --no-rehash zsh)"

# Load manually installed NVM into the shell session.
elif [[ -s ${local_nvm::=$local_nvm_paths[1]} ]]; then
  source "$local_nvm" --no-use
  unset local_nvm{,_paths}

# Load package manager installed NVM into the shell session.
elif (( $+commands[brew] )) \
      && [[ -d "${nvm_prefix::="$(brew --prefix nvm 2> /dev/null)"}" ]]; then
  source "$nvm_prefix/nvm.sh" --no-use
  unset nvm_prefix

# Return if requirements are not found.
elif (( ! $+commands[node] )); then
  return 1
fi

#
# Variables
#

N_PREFIX="${XDG_CONFIG_HOME:-$HOME/.config}/n"  # The path to 'n' cache.

#
# Aliases
#

# npm
alias npmi='npm install'
alias npml='npm list'
alias npmo='npm outdated'
alias npmp='npm publish'
alias npmP='npm prune'
alias npmr='npm run'
alias npms='npm search'
alias npmt='npm test'
alias npmu='npm update'
alias npmx='npm uninstall'

alias npmci='npm ci'
alias npmcit='npm cit'
alias npmit='npm it'
