# Quick, dirty, and at least a little Prezto flavored.

source ${ZDOTDIR:-$HOME}/.zprezto/modules/k/external/k.sh

# Check for g/numfmt and enable -h by default since I am a human
if [[ $(whence gnumfmt numfmt) ]]; then
  alias k='k -h'
fi

alias ka='k -a'
