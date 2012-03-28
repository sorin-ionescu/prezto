#
# Defines helper functions.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Checks if a file can be autoloaded by trying to load it in a subshell.
function autoloadable {
  ( unfunction $1 ; autoload -U +X $1 ) &> /dev/null
}

# Loads Oh My Zsh modules.
function omodload {
  local omodule
  local OMZ="${funcsourcetrace[1]:h}"

  for omodule in "$argv[@]"; do
    if [[ ! -d "$OMZ/modules/$omodule" ]]; then
      print "omz: no such module: $omodule" >&2
      continue
    fi

    # Add functions and completetions to fpath.
    fpath=($OMZ/modules/$omodule/{functions,completions}(/FN) $fpath)

    # Autoload module functions.
    for func in $OMZ/modules/$omodule/functions/[^_.]*(N.:t); do
      autoload -Uz $func
    done

    if [[ -f "$OMZ/modules/$omodule/init.zsh" ]]; then
      source "$OMZ/modules/$omodule/init.zsh"
    fi

    if (( $? == 0 )); then
      zstyle ":omz:module:$omodule" enable 'yes'
    fi
  done
}

# Checks boolean variable for "true" (case insensitive "1", "y", "yes", "t", "true", "o", and "on").
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

# Trap signals were generated with 'kill -l'.
# DEBUG, EXIT, and ZERR are Zsh signals.
TRAP_SIGNALS=(
  ABRT ALRM BUS CHLD CONT EMT FPE HUP ILL INFO INT IO KILL PIPE PROF QUIT
  SEGV STOP SYS TERM TRAP TSTP TTIN TTOU URG USR1 USR2 VTALRM WINCH XCPU XFSZ
  DEBUG EXIT ZERR
)

# Adds a function to a list to be called when a trap is triggered.
function add-zsh-trap {
  if (( $# < 2 )); then
    print "usage: $0 type function" >&2
    return 1
  fi

  if [[ -z "$TRAP_SIGNALS[(r)$1]" ]]; then
    print "$0: unknown signal: $1" >&2
    return 1
  fi

  local trap_functions="TRAP${1}_FUNCTIONS"
  if (( ! ${(P)+trap_functions} )); then
    typeset -gaU "$trap_functions"
  fi
  eval "$trap_functions+="$2""

  if (( ! $+functions[TRAP${1}] )); then
    eval "
     function TRAP${1} {
        for trap_function in \"\$TRAP${1}_FUNCTIONS[@]\"; do
          if (( \$+functions[\$trap_function] )); then
            \"\$trap_function\" \"\$1\"
          fi
        done
        return \$(( 128 + \$1 ))
     }
    "
  fi
}

