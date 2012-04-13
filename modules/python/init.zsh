#
# Enables local Python package installation and virtualenvwrapper if installed.
#
# virtualenvwrapper is a utility to easily create, switch and manage Python
# virtualenvs. See http://www.doughellmann.com/projects/virtualenvwrapper/
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
else
  # This is subject to change.
  path=($HOME/.local/bin $path)
  manpath=($HOME/.local/{,share/}man(N) $manpath)
fi

# source virtualenvwrapper if available
if (( $+WORKON_HOME )); then
    if (( $+commands[virtualenvwrapper.sh] )); then
        source virtualenvwrapper.sh
    fi
fi
