#
# Enables local Python package installation.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Sebastian Wiesner <lunaryorn@googlemail.com>
#

# Load pythonz into the shell session.
if [[ -s $HOME/.pythonz/bin/pythonz ]]; then
  path=($HOME/.pythonz/bin $path)

# Load manually installed pyenv into the shell session.
elif [[ -s "$HOME/.pyenv/bin/pyenv" ]]; then
  path=("$HOME/.pyenv/bin" $path)
  eval "$(pyenv init -)"

# Load package manager installed pyenv into the shell session.
elif (( $+commands[pyenv] )); then
  eval "$(pyenv init -)"

fi

# Return if requirements are not found.
if (( ! $+commands[python] && ! ( $+commands[pythonz] || $+commands[pyenv] ) )); then
  return 1
fi

# Prepend PEP 370 per user site packages directory, which defaults to
# ~/Library/Python on Mac OS X and ~/.local elsewhere, to PATH.
if [[ "$OSTYPE" == darwin* ]]; then
  path=($HOME/Library/Python/*/bin(N) $path)
else
  # This is subject to change.
  path=($HOME/.local/bin $path)
fi

# Load virtualenvwrapper into the shell session.
if (( $+commands[virtualenvwrapper_lazy.sh] )); then
  # Set the directory where virtual environments are stored.
  export WORKON_HOME=$HOME/.virtualenvs

  # Disable the virtualenv prompt.
  VIRTUAL_ENV_DISABLE_PROMPT=1

  source "$commands[virtualenvwrapper_lazy.sh]"
fi

#
# Aliases
#

alias py='python'

# pythonz
if (( $+commands[pythonz] )); then
  alias pyz='pythonz'
  alias pyzc='pythonz cleanup'
  alias pyzi='pythonz install'
  alias pyzl='pythonz list'
  alias pyzL='pythonz list -a'
  alias pyzu='pythonz update'
  alias pyzx='pythonz uninstall'
fi

