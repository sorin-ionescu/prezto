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
# ~/Library/Python on Mac OS X and ~/.local elsewhere, to PATH.
else
  if [[ "$OSTYPE" == darwin* ]]; then
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

local venv_script=virtualenvwrapper
if zstyle -T ':prezto:module:python' lazy_venv; then
    venv_script+=_lazy
fi

# Load virtualenvwrapper into the shell session.
if (( $+commands[$venv_script.sh] )); then
  # Set the directory where virtual environments are stored.
  export WORKON_HOME="$HOME/.virtualenvs"

  # Disable the virtualenv prompt.
  VIRTUAL_ENV_DISABLE_PROMPT=1

  source "$commands[$venv_script.sh]"
fi

function autoenv {
  #Don't run in shell scripts etc.
  if [[ $ZSH_SUBSHELL -ne 0 ]]; then
    return
  fi

  #Don't run if currently in virtual env not set by autoenv
  if (( ($+VIRTUAL_ENV)  && !($+AUTOENV) )); then
    return
  fi

  local name=""
  if [[ -f .venv ]]; then
    #.venv file in current dir gets highest priority
    name=$(<.venv)
  elif is-true "$(git rev-parse --is-inside-work-tree 2> /dev/null)"; then
    local gitroot="$(git rev-parse --show-toplevel 2> /dev/null)"
    if [ -f "$gitroot/.venv" ]; then
      #If there is a .venv file in gitroot
      name=$(<$gitroot/.venv)
    else
      #Else use the name of the folder as venv name
      name=$gitroot:t
    fi
  fi


  local venv_name="$VIRTUAL_ENV:t"
  if [[ $name != $venv_name ]]; then
    if [[ -z $name ]]; then
      deactivate && unset AUTOENV
      return
    fi

    if [[ -d "$WORKON_HOME/$name" ]]; then
      workon $name && export AUTOENV=1
      return
    fi
  fi
}

if zstyle -T ':prezto:module:python' autoenv; then
    add-zsh-hook chpwd autoenv
fi
#
# Aliases
#

alias py='python'

