#
# Enables local Python package installation.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Sebastian Wiesner <lunaryorn@googlemail.com>
#

# Prepend PEP 370 per user site packages directory, which defaults to
# ~/Library/Python on Mac OS X and ~/.local elsewhere, to PATH/MANPATH.
if [[ "$OSTYPE" == darwin* ]]; then
  path=($HOME/Library/Python/*/bin(N) $path)
  manpath=($HOME/Library/Python/*/{,share/}man(N) $manpath)
  _brew_py="/usr/local/share/python"
  _brew_py3="/usr/local/share/python3"

  if [[ -s "$_brew_py" ]]; then
    path=("$_brew_py" $path)
  fi

  if [[ -s "$_brew_py3" ]]; then
    path=("$_brew_py3" $path)
  fi
else
  # This is subject to change.
  path=($HOME/.local/bin $path)
  manpath=($HOME/.local/{,share/}man(N) $manpath)
fi

# Load virtualenvwrapper into the shell session.
if [[ -n "$WORKON_HOME" ]] && (( $+commands[virtualenvwrapper.sh] )); then
  source "$commands[virtualenvwrapper.sh]"
fi

