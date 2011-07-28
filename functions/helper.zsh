# Checks if a file can be autoloaded by trying to load it in a subshell.
function autoloadable() {
  ( unfunction $1 ; autoload -U +X $1 ) &>/dev/null
}

# Checks boolean variable for "true" (case insensitive "1", "y", "yes", "t", and "true").
function check-bool {
  [[ -n "$1" && "$1" == (1|[Yy]([Ee][Ss]|)|[Tt]([Rr][Uu][Ee]|)) ]]
}

