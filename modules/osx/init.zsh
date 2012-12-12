#
# Defines Mac OS X aliases and functions.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# Functions
#

# Open files in Quick Look.
function ql {
  (( $# > 0 )) && qlmanage -p "$@" &> /dev/null
}

# Delete .DS_Store and __MACOSX directories.
function rm-osx-cruft {
  find "${@:-$PWD}" \( \
    -type f -name '.DS_Store' -o \
    -type d -name '__MACOSX' \
  \) -print0 | xargs -0 rm -rf
}

#
# Aliases
#

# Return if conditions are unsatistied
if ! zstyle -t ':prezto:alias' pmodule all osx; then
  return 0
fi

# Change directory to the current Finder directory.
alias cdf='cd "$(pfd)"'

# Push directory to the current Finder directory.
alias pushdf='pushd "$(pfd)"'

