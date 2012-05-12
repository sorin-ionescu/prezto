#
# Enables local Haskell package installation.
#
# Authors:
#   Sebastian Wiesner <lunaryorn@googlemail.com>
#

# Prepend Cabal per user directories to PATH/MANPATH.
if [[ "$OSTYPE" == darwin* ]]; then
  path=($HOME/Library/Haskell/bin(/N) $path)
  manpath=($HOME/Library/Haskell/man(/N) $manpath)
else
  path=($HOME/.cabal/bin(/N) $path)
  manpath=($HOME/.cabal/man(/N) $path)
fi

