#
# Configures Node local installation, loads version managers, and defines
# variables and aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Zeh Rizzatti <zehrizzatti@gmail.com>
#   Indrajit Raychaudhuri <irc@indrajit.com>
#

# Possible lookup locations for manually installed version managers
local_nodenv_paths=({$NODENV_ROOT,{$XDG_CONFIG_HOME/,$HOME/.}nodenv}/bin/nodenv(N))
local_nvm_paths=({$NVM_DIR,{$XDG_CONFIG_HOME/,$HOME/.}nvm}/nvm.sh(N))
local_volta_paths=({$VOLTA_HOME,$HOME/.volta}/bin/volta(N))

# Load manually installed or package manager installed nodenv into the shell
# session.
if (( $#local_nodenv_paths || $+commands[nodenv] )); then
  # Ensure manually installed nodenv is added to path when present.
  [[ -s $local_nodenv_paths[1] ]] && path=($local_nodenv_paths[1]:h $path)
  eval "$(nodenv init - zsh)"

# Use volta if it's installed
elif (( $#local_volta_paths || $+commands[volta] )); then
  export VOLTA_HOME="${VOLTA_HOME:-$HOME/.volta}"
  path=("$VOLTA_HOME/bin" $path)

# Load manually installed nvm into the shell session.
elif (( $#local_nvm_paths )); then
  source "$local_nvm_paths[1]" --no-use

# Load package manager installed nvm into the shell session.
elif (( $+commands[brew] )) \
      && [[ -d "${nvm_path::="$(brew --prefix 2> /dev/null)"/opt/nvm}" ]]; then
  source "$nvm_path/nvm.sh" --no-use
fi

unset local_{nodenv,nvm,volta}_paths nvm_path

# Return if requirements are not found.
if (( ! $+commands[node] && ! $#functions[(i)n(odenv|vm)] && ! $+commands[volta] )); then
  return 1
fi

#
# Variables
#

N_PREFIX="${XDG_CONFIG_HOME:-$HOME/.config}/n"  # The path to 'n' cache.

#
# Aliases
#

if ! zstyle -t ':prezto:module:node:alias' skip; then
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

  # Add Volta-specific aliases if Volta is installed
  if (( $+commands[volta] )); then
    alias vl='volta list'
    alias vla='volta list all'
    alias vi='volta install'
    alias vp='volta pin'
  fi
fi