#
# Defines helper functions.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Checks boolean variable for "true".
# Case insensitive: "1", "y", "yes", "t", "true", "o", and "on".
function is-true {
  [[ -n "$1" && "$1" == (1|[Yy]([Ee][Ss]|)|[Tt]([Rr][Uu][Ee]|)|[Oo]([Nn]|)) ]]
}

# Prints the first non-empty string in the arguments array.
function coalesce {
  for arg in $argv; do
    print "$arg"
    return 0
  done
  return 1
}

# Checks if a file can be autoloaded by trying to load it in a subshell.
function autoloadable {
  ( unfunction $1 ; autoload -U +X $1 ) &> /dev/null
}

# Loads Oh My Zsh modules.
function omodload {
  local omodule
  local ofunction

  # Extended globbing is needed for autoloading of module functions.
  setopt EXTENDED_GLOB

  # Add functions to fpath.
  fpath=(${argv:+${OMZ}/modules/${^argv}/functions(/FN)} $fpath)

  # Load Oh My Zsh functions.
  for ofunction in \
    $OMZ/modules/${^argv}/functions/^([_.]*|prompt_*_setup|README*)(.N:t)
  do
    autoload -Uz "$ofunction"
  done

  # Extended globbing is no longer needed.
  unsetopt EXTENDED_GLOB

  for omodule in "$argv[@]"; do
    if zstyle -t ":omz:module:$omodule" loaded; then
      continue
    elif [[ ! -d "$OMZ/modules/$omodule" ]]; then
      print "$0: no such module: $omodule" >&2
      continue
    else
      if [[ -f "$OMZ/modules/$omodule/init.zsh" ]]; then
        source "$OMZ/modules/$omodule/init.zsh"
      fi

      if (( $? == 0 )); then
        zstyle ":omz:module:$omodule" loaded 'yes'
      else
        zstyle ":omz:module:$omodule" loaded 'no'
      fi
    fi
  done
}

