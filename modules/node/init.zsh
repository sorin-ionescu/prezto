#
# Completes npm.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

if (( ! $+commands[npm] )); then
  return 1
fi

cache_file="${0:h}/cache.zsh"

if [[ "$commands[npm]" -nt "$cache_file" || ! -s "$cache_file" ]]; then
  # npm is slow; cache its output.
  npm completion >! "$cache_file" 2> /dev/null
fi

source "$cache_file"

unset cache_file

