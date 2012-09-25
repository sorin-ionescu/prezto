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
fi

# Return if requirements are not found.
if (( ! $+commands[python] && ! $+commands[pythonz] )); then
  return 1
fi

# Prepend PEP 370 per user site packages directory, which defaults to
# ~/Library/Python on Mac OS X and ~/.local elsewhere, to PATH/MANPATH.
if [[ "$OSTYPE" == darwin* ]]; then
  path=($HOME/Library/Python/*/bin(N) $path)
  manpath=($HOME/Library/Python/*/{,share/}man(N) $manpath)
else
  # This is subject to change.
  path=($HOME/.local/bin $path)
  manpath=($HOME/.local/{,share/}man(N) $manpath)
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

