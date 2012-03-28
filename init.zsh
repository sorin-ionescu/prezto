#
# Initializes Oh My Zsh.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Check for the minimum supported version.
min_zsh_version='4.3.10'
if ! autoload -Uz is-at-least || ! is-at-least "$min_zsh_version"; then
  print "omz: old shell detected, minimum required: $min_zsh_version" >&2
fi
unset min_zsh_version

# Disable color and theme in dumb terminals.
if [[ "$TERM" == 'dumb' ]]; then
  zstyle ':omz:*:*' color 'no'
  zstyle ':omz:prompt' theme 'off'
fi

# Get enabled modules.
zstyle -a ':omz:load' module 'omodules'

# Add functions to fpath.
fpath=(
  ${0:h}/themes/*(/FN)
  ${omodules:+${0:h}/modules/${^omodules}/{functions,completions}(/FN)}
  ${0:h}/{functions,completions}(/FN)
  $fpath
)

# Load and initialize the completion system ignoring insecure directories.
autoload -Uz compinit && compinit -i

# Source files (the order matters).
source "${0:h}/helper.zsh"
source "${0:h}/environment.zsh"
source "${0:h}/terminal.zsh"
source "${0:h}/keyboard.zsh"
source "${0:h}/completion.zsh"
source "${0:h}/history.zsh"
source "${0:h}/directory.zsh"

# Autoload Zsh functions.
autoload -Uz age
autoload -Uz zargs
autoload -Uz zcalc
autoload -Uz zmv

# Source modules defined in ~/.zshrc.
for omodule in "$omodules[@]"; do
  if [[ ! -d "${0:h}/modules/$omodule" ]]; then
    print "omz: no such module: $omodule" >&2
  fi

  if [[ -f "${0:h}/modules/$omodule/init.zsh" ]]; then
    source "${0:h}/modules/$omodule/init.zsh"
  fi

  if (( $? == 0 )); then
    zstyle ":omz:module:$omodule" enable 'yes'
  fi
done
unset omodule omodules

# Autoload Oh My Zsh functions.
for fdir in "$fpath[@]"; do
  if [[ "$fdir" == ${0:h}/(|*/)functions ]]; then
    for func in $fdir/[^_.]*(N.:t); do
      autoload -Uz $func
    done
  fi
done
unset fdir func

# Set environment variables for launchd processes.
if [[ "$OSTYPE" == darwin* ]]; then
  for env_var in PATH MANPATH; do
    launchctl setenv "$env_var" "${(P)env_var}" &!
  done
  unset env_var
fi

# Load and run the prompt theming system.
autoload -Uz promptinit && promptinit

# Load the prompt theme.
zstyle -a ':omz:prompt' theme 'prompt_argv'
if (( $#prompt_argv > 0 )); then
  prompt "$prompt_argv[@]"
else
  prompt 'off'
fi
unset prompt_argv

# Compile the completion dump, to increase startup speed.
dump_file="$HOME/.zcompdump"
if [[ "$dump_file" -nt "${dump_file}.zwc" || ! -f "${dump_file}.zwc" ]]; then
  zcompile "$dump_file"
fi
unset dump_file

