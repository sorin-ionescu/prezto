#
# Loads the Node Version Manager and enables npm completion.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Zeh Rizzatti <zehrizzatti@gmail.com>
#

lazy_load_nvm() {
  NVM_DIR=$1
  # Skip adding binaries if there is no node version installed yet
  if [ -d $NVM_DIR/versions/node ]; then
    NODE_GLOBALS=(`find $NVM_DIR/versions/node -maxdepth 3 \( -type l -o -type f \) -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
  fi
  NODE_GLOBALS+=("nvm")

  load_nvm () {
    # Unset placeholder functions
    for cmd in "${NODE_GLOBALS[@]}"; do unset -f ${cmd} &>/dev/null; done

    # Load NVM
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

    # (Optional) Set the version of node to use from ~/.nvmrc if available
    nvm use 2> /dev/null 1>&2 || true

    # Do not reload nvm again
    export NVM_LOADED=1
  }

  for cmd in "${NODE_GLOBALS[@]}"; do
    # Skip defining the function if the binary is already in the PATH
    if ! which ${cmd} &>/dev/null; then
      eval "${cmd}() { unset -f ${cmd} &>/dev/null; [ -z \${NVM_LOADED+x} ] && load_nvm; ${cmd} \$@; }"
    fi
  done
}

# Load manually installed NVM into the shell session.
if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
  lazy_load_nvm "$HOME/.nvm"

# Load package manager installed NVM into the shell session.
elif (( $+commands[brew] )) && [[ -d "$(brew --prefix nvm 2>/dev/null)" ]]; then
  lazy_load_nvm "$(brew --prefix nvm)"

# Return if requirements are not found.
elif (( ! $+commands[node] )); then
  return 1
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
