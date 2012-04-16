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
  zstyle ':omz:module:prompt' theme 'off'
fi

# Load Zsh modules.
zstyle -a ':omz:load' zmodule 'zmodules'
for zmodule ("$zmodules[@]") zmodload "zsh/${(z)zmodule}"
unset zmodule{s,}

# Autoload Zsh functions.
zstyle -a ':omz:load' zfunction 'zfunctions'
for zfunction ("$zfunctions[@]") autoload -Uz "$zfunction"
unset zfunction{s,}

# Source files (the order matters).
source "${0:h}/helper.zsh"

# Source modules defined in ~/.zshrc.
zstyle -a ':omz:load' omodule 'omodules'
omodload "$omodules[@]"
unset omodules

# Set environment variables for launchd processes.
if [[ "$OSTYPE" == darwin* ]]; then
  for env_var in PATH MANPATH; do
    launchctl setenv "$env_var" "${(P)env_var}" &!
  done
  unset env_var
fi

# Compile the completion dump, to increase startup speed.
dump_file="$HOME/.zcompdump"
if [[ "$dump_file" -nt "${dump_file}.zwc" || ! -s "${dump_file}.zwc" ]]; then
  zcompile "$dump_file"
fi
unset dump_file

