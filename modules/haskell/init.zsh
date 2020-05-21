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

# Load dependencies.
pmodload 'helper'

# Prepend Cabal per user directories to PATH.
if is-darwin && [[  -d $HOME/Library/Haskell ]]; then
  path=($HOME/Library/Haskell/bin(/N) $path)
else
  path=($HOME/.cabal/bin(/N) $path)
fi
