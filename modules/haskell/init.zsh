#
# Enables user installation of haskell packages
#
# Authors:
#   Sebastian Wiesner <lunaryorn@googlemail.com>
#

# Prepend cabal per user directories to PATH/MANPATH
if [[ "$OSTYPE" == darwin* ]]; then
  path=($HOME/Library/Haskell/bin $path)
  manpath=($HOME/Library/Haskell/man $manpath)
else
  path=($HOME/.cabal/bin $path)
  manpath=($HOME/.cabal/man $path)
fi
