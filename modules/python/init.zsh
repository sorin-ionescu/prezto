#
# Enables local Python package installation.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Sebastian Wiesner <lunaryorn@googlemail.com>
#

# Load manually installed pyenv into the shell session.
if [[ -s "$HOME/.pyenv/bin/pyenv" ]]; then
  path=("$HOME/.pyenv/bin" $path)
  eval "$(pyenv init -)"

# Load package manager installed pyenv into the shell session.
elif (( $+commands[pyenv] )); then
  eval "$(pyenv init -)"

# Prepend PEP 370 per user site packages directory, which defaults to
# ~/Library/Python on Mac OS X and ~/.local elsewhere, to PATH. The
# path can be overridden using PYTHONUSERBASE.
else
  if [[ -n "$PYTHONUSERBASE" ]]; then
    path=($PYTHONUSERBASE/bin $path)
  elif [[ "$OSTYPE" == darwin* ]]; then
    path=($HOME/Library/Python/*/bin(N) $path)
  else
    # This is subject to change.
    path=($HOME/.local/bin $path)
  fi
fi

# Return if requirements are not found.
if (( ! $+commands[python] && ! $+commands[pyenv] )); then
  return 1
fi

function _python-workon-cwd {
  # Check if this is a Git repo
  local GIT_REPO_ROOT=""
  local GIT_TOPLEVEL="$(git rev-parse --show-toplevel 2> /dev/null)"
  if [[ $? == 0 ]]; then
    GIT_REPO_ROOT="$GIT_TOPLEVEL"
  fi
  # Get absolute path, resolving symlinks
  local PROJECT_ROOT="${PWD:A}"
  while [[ "$PROJECT_ROOT" != "/" && ! -e "$PROJECT_ROOT/.venv" \
            && ! -d "$PROJECT_ROOT/.git"  && "$PROJECT_ROOT" != "$GIT_REPO_ROOT" ]]; do
    PROJECT_ROOT="${PROJECT_ROOT:h}"
  done
  if [[ "$PROJECT_ROOT" == "/" ]]; then
    PROJECT_ROOT="."
  fi
  # Check for virtualenv name override
  local ENV_NAME=""
  if [[ -f "$PROJECT_ROOT/.venv" ]]; then
    ENV_NAME="$(cat "$PROJECT_ROOT/.venv")"
  elif [[ -f "$PROJECT_ROOT/.venv/bin/activate" ]];then
    ENV_NAME="$PROJECT_ROOT/.venv"
  elif [[ "$PROJECT_ROOT" != "." ]]; then
    ENV_NAME="${PROJECT_ROOT:t}"
  fi
  if [[ -n $CD_VIRTUAL_ENV && -n $VIRTUAL_ENV ]]; then
    # We've just left the repo, deactivate the environment
    # Note: this only happens if the virtualenv was activated automatically
    deactivate && unset CD_VIRTUAL_ENV
  fi
  if [[ "$ENV_NAME" != "" ]]; then
    # Activate the environment only if it is not already active
    if [[ "$VIRTUAL_ENV" != "$WORKON_HOME/$ENV_NAME" ]]; then
      if [[ -e "$WORKON_HOME/$ENV_NAME/bin/activate" ]]; then
        workon "$ENV_NAME" && export CD_VIRTUAL_ENV="$ENV_NAME"
      elif [[ -e "$ENV_NAME/bin/activate" ]]; then
        source $ENV_NAME/bin/activate && export CD_VIRTUAL_ENV="$ENV_NAME"
      fi
    fi
  fi
}

# Load virtualenvwrapper into the shell session, unless requested not to
if zstyle -T ':prezto:module:python' skip-virtualenvwrapper-init; then
  # Set the directory where virtual environments are stored.
  export WORKON_HOME="${WORKON_HOME:-$HOME/.virtualenvs}"

  # Disable the virtualenv prompt.
  VIRTUAL_ENV_DISABLE_PROMPT=1

  if (( $+commands[pyenv-virtualenvwrapper] )); then
    pyenv virtualenvwrapper
  elif (( $+commands[pyenv-virtualenv-init] )); then
    eval "$(pyenv virtualenv-init -)"
  elif (( $+commands[virtualenvwrapper_lazy.sh] )); then
    source "$commands[virtualenvwrapper_lazy.sh]"
  elif (( $+commands[virtualenvwrapper.sh] )); then
    source "$commands[virtualenvwrapper.sh]"
  fi
fi

# Load PIP completion.
if (( $+commands[pip] )); then
  cache_file="${0:h}/cache.zsh"

  if [[ "$commands[pip]" -nt "$cache_file" || ! -s "$cache_file" ]]; then
    # pip is slow; cache its output. And also support 'pip2', 'pip3' variants
    pip completion --zsh | sed -e "s|compctl -K [-_[:alnum:]]* pip|& pip2 pip3|" >! "$cache_file" 2> /dev/null
  fi

  source "$cache_file"

  unset cache_file

  # Load auto workon cwd hook
  if zstyle -t ':prezto:module:python:virtualenv' auto-switch 'yes'; then
    # Auto workon when changing directory
    add-zsh-hook chpwd _python-workon-cwd
  fi
fi

#
# Aliases
#

alias py='python'
