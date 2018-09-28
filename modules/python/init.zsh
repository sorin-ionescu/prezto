#
# Enables local Python package installation.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Sebastian Wiesner <lunaryorn@googlemail.com>
#   Patrick Bos <egpbos@gmail.com>
#

# Load manually installed pyenv into the path
if [[ -n "$PYENV_ROOT" && -s "$PYENV_ROOT/bin/pyenv" ]]; then
  path=("$PYENV_ROOT/bin" $path)
elif [[ -s "$HOME/.pyenv/bin/pyenv" ]]; then
  path=("$HOME/.pyenv/bin" $path)
fi

# Load pyenv into the current python session
if (( $+commands[pyenv] )); then
  if [[ -z "$PYENV_ROOT" ]]; then
    export PYENV_ROOT=$(pyenv root)
  fi
  eval "$(pyenv init - --no-rehash zsh)"

# Prepend PEP 370 per user site packages directory, which defaults to
# ~/Library/Python on macOS and ~/.local elsewhere, to PATH. The
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
  elif [[ -f "$PROJECT_ROOT/.venv/bin/activate" ]]; then
    ENV_NAME="$PROJECT_ROOT/.venv"
  elif [[ "$PROJECT_ROOT" != "." ]]; then
    ENV_NAME="${PROJECT_ROOT:t}"
  fi
  if [[ -n $CD_VIRTUAL_ENV && "$ENV_NAME" != "$CD_VIRTUAL_ENV" ]]; then
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

# Load auto workon cwd hook
if zstyle -t ':prezto:module:python:virtualenv' auto-switch 'yes'; then
  # Auto workon when changing directory
  autoload -Uz add-zsh-hook
  add-zsh-hook chpwd _python-workon-cwd
fi

# Load virtualenvwrapper into the shell session, if pre-requisites are met
# and unless explicitly requested not to
if (( $+VIRTUALENVWRAPPER_VIRTUALENV || $+commands[virtualenv] )) && \
  zstyle -T ':prezto:module:python:virtualenv' initialize ; then
  # Set the directory where virtual environments are stored.
  export WORKON_HOME="${WORKON_HOME:-$HOME/.virtualenvs}"

  # Disable the virtualenv prompt. Note that we use the magic value used by the
  # pure prompt because there's some additional logic in that prompt which tries
  # to figure out if a user set this variable and disable the python portion of
  # that prompt based on it which is the exact opposite of what we want to do.
  export VIRTUAL_ENV_DISABLE_PROMPT=12

  # Create a sorted array of available virtualenv related 'pyenv' commands to
  # look for plugins of interest. Scanning shell '$path' isn't enough as they
  # can exist in 'pyenv' synthesized paths (e.g., '~/.pyenv/plugins') instead.
  local -a pyenv_plugins
  if (( $+commands[pyenv] )); then
    pyenv_plugins=(${(@oM)${(f)"$(pyenv commands --no-sh 2>/dev/null)"}:#virtualenv*})
  fi

  if (( $pyenv_plugins[(i)virtualenv-init] <= $#pyenv_plugins )); then
    # Enable 'virtualenv' with 'pyenv'.
    eval "$(pyenv virtualenv-init - zsh)"

    # Optionally activate 'virtualenvwrapper' plugin when available.
    if (( $pyenv_plugins[(i)virtualenvwrapper(_lazy|)] <= $#pyenv_plugins )); then
      pyenv "$pyenv_plugins[(R)virtualenvwrapper(_lazy|)]"
    fi
  else
    # Fallback to 'virtualenvwrapper' without 'pyenv' wrapper if available
    # in '$path' or in an alternative location on a Debian based system.
    #
    # If homebrew is installed and the python location wasn't overridden via
    # environment variable we fall back to python3 then python2 in that order.
    # This is needed to fix an issue with virtualenvwrapper as homebrew no
    # longer shadows the system python.
    if [[ -z "$VIRTUALENVWRAPPER_PYTHON" ]] && (( $+commands[brew] )); then
      if (( $+commands[python3] )); then
        export VIRTUALENVWRAPPER_PYTHON=$commands[python3]
      elif (( $+commands[python2] )); then
        export VIRTUALENVWRAPPER_PYTHON=$commands[python2]
      fi
    fi

    virtenv_sources=(
      ${(@Ov)commands[(I)virtualenvwrapper(_lazy|).sh]}
      /usr/share/virtualenvwrapper/virtualenvwrapper(_lazy|).sh(OnN)
    )
    if (( $#virtenv_sources )); then
      source "${virtenv_sources[1]}"
    fi

    unset virtenv_sources
  fi

  unset pyenv_plugins
fi

# Load PIP completion.
if (( $#commands[(i)pip(|[23])] )); then
  cache_file="${TMPDIR:-/tmp}/prezto-python-cache.$UID.zsh"

  # Detect and use one available from among 'pip', 'pip2', 'pip3' variants
  pip_command="$commands[(i)pip(|[23])]"

  if [[ "$pip_command" -nt "$cache_file" \
        || "${ZDOTDIR:-$HOME}/.zpreztorc" -nt "$cache_file" \
        || ! -s "$cache_file" ]]; then
    # pip is slow; cache its output. And also support 'pip2', 'pip3' variants
    $pip_command completion --zsh \
      | sed -e "s|compctl -K [-_[:alnum:]]* pip|& pip2 pip3|" >! "$cache_file" 2> /dev/null
  fi

  source "$cache_file"
  unset cache_file pip_command
fi

# Load conda into the shell session, if requested
zstyle -T ':prezto:module:python' conda-init
if (( $? && $+commands[conda] )); then
  if (( $(conda ..changeps1) )); then
    echo "To make sure Conda doesn't change your prompt (should do that in the prompt module) run:\n  conda config --set changeps1 false"
    # TODO:
    # We could just run this ourselves. In an exit hook
    # (add zsh-hook zshexit [(anonymous) function]) we could then set it back
    # to the way it was before we changed it. However, I'm not sure if this is
    # exception safe, so left it like this for now.
  fi
fi

#
# Aliases
#

alias py='python'
alias py2='python2'
alias py3='python3'
