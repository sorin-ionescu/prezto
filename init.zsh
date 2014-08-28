#
# Initializes Prezto.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Version Check
#

# Check for the minimum supported version.
min_zsh_version='4.3.11'
if ! autoload -Uz is-at-least || ! is-at-least "$min_zsh_version"; then
  print "prezto: old shell detected, minimum required: $min_zsh_version" >&2
  return 1
fi
unset min_zsh_version

#
# Module Loader
#

# Loads Prezto modules.
function pmodload {
  pmodload_path "${ZDOTDIR:-$HOME}/.zprezto/modules" "$argv[@]"
}

function pmodload_path {
  local -a pmodules
  local modules_path
  local pmodule
  local pfunction_glob='^([_.]*|prompt_*_setup|README*)(-.N:t)'

  modules_path="${argv[1]}"
  shift
  # $argv is overridden in the anonymous function.
  pmodules=("$argv[@]")

  # Add functions to $fpath.
  fpath=(${pmodules:+${modules_path}/${^pmodules}/functions(/FN)} $fpath)

  function {
    local pfunction

    # Extended globbing is needed for listing autoloadable function directories.
    setopt LOCAL_OPTIONS EXTENDED_GLOB

    # Load Prezto functions.
    for pfunction in ${modules_path}/${^pmodules}/functions/$~pfunction_glob; do
      autoload -Uz "$pfunction"
    done
  }

  # Load Prezto modules.
  for pmodule in "$pmodules[@]"; do
    if zstyle -t ":prezto:module:$pmodule" loaded 'yes' 'no'; then
      continue
    elif [[ ! -d "${modules_path}/$pmodule" ]]; then
      print "$0: no such module: $pmodule" >&2
      continue
    else
      if [[ -s "${modules_path}/$pmodule/init.zsh" ]]; then
        source "${modules_path}/$pmodule/init.zsh"
      fi

      if (( $? == 0 )); then
        zstyle ":prezto:module:$pmodule" loaded 'yes'
      else
        # Remove the $fpath entry.
        fpath[(r)${modules_path}/${pmodule}/functions]=()

        function {
          local pfunction

          # Extended globbing is needed for listing autoloadable function
          # directories.
          setopt LOCAL_OPTIONS EXTENDED_GLOB

          # Unload Prezto functions.
          for pfunction in ${modules_path}/$pmodule/functions/$~pfunction_glob; do
            unfunction "$pfunction"
          done
        }

        zstyle ":prezto:module:$pmodule" loaded 'no'
      fi
    fi
  done
}

#
# Prezto Initialization
#

# Source the Prezto configuration file.
if [[ -s "${ZDOTDIR:-$HOME}/.zpreztorc" ]]; then
  source "${ZDOTDIR:-$HOME}/.zpreztorc"
fi

# Disable color and theme in dumb terminals.
if [[ "$TERM" == 'dumb' ]]; then
  zstyle ':prezto:*:*' color 'no'
  zstyle ':prezto:module:prompt' theme 'off'
fi

# Load Zsh modules.
zstyle -a ':prezto:load' zmodule 'zmodules'
for zmodule ("$zmodules[@]") zmodload "zsh/${(z)zmodule}"
unset zmodule{s,}

# Autoload Zsh functions.
zstyle -a ':prezto:load' zfunction 'zfunctions'
for zfunction ("$zfunctions[@]") autoload -Uz "$zfunction"
unset zfunction{s,}

# Load Prezto modules.
zstyle -a ':prezto:load' pmodule 'pmodules'
pmodload "$pmodules[@]"
unset pmodules

