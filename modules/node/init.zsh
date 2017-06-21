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
elif (( $+commands[brew] )) && [[ -d "$(brew --prefix nvm 2>/dev/null)" ]]; then
  source $(brew --prefix nvm)/nvm.sh

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

# Auto node version switch cwd hook
function _node-nvm-switch-cwd {
  # Check if this is a Git repo
  local GIT_REPO_ROOT=""
  local GIT_TOPLEVEL="$(git rev-parse --show-toplevel 2> /dev/null)"
  if [[ $? == 0 ]]; then
    GIT_REPO_ROOT="$GIT_TOPLEVEL"
  fi
  # Get absolute path, resolving symlinks
  local PROJECT_ROOT="${PWD:A}"
  while [[ "$PROJECT_ROOT" != "/" && ! -e "$PROJECT_ROOT/.nvmrc" \
            && ! -d "$PROJECT_ROOT/.git"  && "$PROJECT_ROOT" != "$GIT_REPO_ROOT" ]]; do
    PROJECT_ROOT="${PROJECT_ROOT:h}"
  done
  if [[ "$PROJECT_ROOT" == "/" ]]; then
    PROJECT_ROOT="."
  fi
  # Check for nvmrc
  # We cache the location of the nvmrc file instead of the version itself because nvm's version lookup is slow
  local ENV_VER=""
  if [[ -f "$PROJECT_ROOT/.nvmrc" ]]; then
    ENV_VER="$PROJECT_ROOT/.nvmrc"
  fi
  if [[ -n $CD_NODE_USE && "$ENV_VER" != "$CD_NODE_USE" ]]; then
    # We've just left the repo, return to the default node version
    # Note: this only happens if the node version was selected automatically
    nvm use default && unset CD_NODE_USE
  fi
  if [[ "$ENV_VER" != "" ]]; then
    # Activate the node version only if it is not already active
    if [[ "$CD_NODE_USE" != "$ENV_VER" ]]; then
      nvm use $(cat $ENV_VER) && export CD_NODE_USE="$ENV_VER"
    fi
  fi
}

# Load auto workon cwd hook
if zstyle -t ':prezto:module:node:nvm' auto-switch 'yes'; then
  # Auto workon when changing directory
  add-zsh-hook chpwd _node-nvm-switch-cwd
fi

# Load NPM completion.
if (( $+commands[npm] )); then
  cache_file="${0:h}/cache.zsh"

  if [[ "$commands[npm]" -nt "$cache_file" || ! -s "$cache_file" ]]; then
    # npm is slow; cache its output.
    npm completion >! "$cache_file" 2> /dev/null
  fi

  source "$cache_file"

  unset cache_file
fi
