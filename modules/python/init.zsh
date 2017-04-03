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

# Load pyenv's virtualenvwrapper into the shell session.
if [[ $(pyenv commands) == *virtualenvwrapper* ]] 2&> /dev/null; then
  # Prefer pyenv over virtualenv.
  export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

  # Set the directory where virtual environments are stored.
  export WORKON_HOME="$HOME/.virtualenvs"

  # Disable the virtualenv prompt.
  VIRTUAL_ENV_DISABLE_PROMPT=1

  pyenv virtualenvwrapper

# Load pyenv's virtualenvs into the shell session.
elif [[ $(pyenv commands) == *virtualenv-init* ]] 2&> /dev/null; then
  # Disable the virtualenv prompt.
  VIRTUAL_ENV_DISABLE_PROMPT=1

  eval "$(pyenv virtualenv-init -)"

# Load virtualenvwrapper into the shell session.
elif (( $+commands[virtualenvwrapper.sh] )); then
  # Set the directory where virtual environments are stored.
  export WORKON_HOME="$HOME/.virtualenvs"

  # Disable the virtualenv prompt.
  VIRTUAL_ENV_DISABLE_PROMPT=1

  source "$commands[virtualenvwrapper.sh]"
fi

#
# Aliases
#

alias py='python'
