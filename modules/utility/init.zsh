#
# Defines utility functions.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Suraj N. Kurapati <sunaku@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Serves a directory via HTTP.
alias http-serve='python -m SimpleHTTPServer'

# Makes a directory and changes to it.
function mkdcd {
  [[ -n "$1" ]] && mkdir -p "$1" && cd "$1"
}
compdef _mkdir mkdcd 2> /dev/null

# Changes to a directory and lists its contents.
function cdll {
  builtin cd "$1" && ll
}
compdef _cd cdll 2> /dev/null

# Pushes an entry onto the directory stack and lists its contents.
function pushdll {
  builtin pushd "$1" && ll
}
compdef _cd pushdll 2> /dev/null

# Pops an entry off the directory stack and lists its contents.
function popdll {
  builtin popd "$1" && ll
}
compdef _cd popdll 2> /dev/null

# Prints columns 1 2 3 ... n.
function slit {
  awk "{ print $(for n; do print -n "\$$n,"; done | sed 's/,$//') }"
}

# Displays user owned process status.
alias pmine='ps -U "$USER" -o pid,%cpu,%mem,command'

# Finds files and executes a command on them.
function find-exec {
  find . -type f -iname "*${1:-}*" -exec "${2:-file}" '{}' \;
}

