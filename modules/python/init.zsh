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
fi

#
# Aliases
#

alias py='python'
