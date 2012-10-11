#
# Enables local Haskell package installation.
#
# Authors:
#   Sebastian Wiesner <lunaryorn@googlemail.com>
#

# Return if requirements are not found.
if (( ! $+commands[ghc] )); then
  return 1
fi

# Prepend Cabal per user directories to PATH/MANPATH.
if [[ "$OSTYPE" == darwin* && -d $HOME/Library/Haskell ]]; then
  path=($HOME/Library/Haskell/bin(/N) $path)
  manpath=($HOME/Library/Haskell/man(/N) $manpath)
else
  path=($HOME/.cabal/bin(/N) $path)
  manpath=($HOME/.cabal/man(/N) $manpath)
fi
