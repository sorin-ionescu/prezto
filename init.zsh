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
for zmodule in "$zmodules[@]"; do
  zmodload "zsh/${(z)zmodule}"
done
unset zmodule{s,}

# Autoload Zsh functions.
zstyle -a ':omz:load' zfunction 'zfunctions'
for zfunction in "$zfunctions[@]"; do
  autoload -Uz "$zfunction"
done
unset zfunction{s,}

# Source files (the order matters).
source "${0:h}/helper.zsh"

# Source modules defined in ~/.zshrc.
zstyle -a ':omz:load' omodule 'omodules'
omodload "$omodules[@]"
unset omodules

# Add themes to fpath.
fpath=(${0:h}/themes/*(/FN) $fpath)

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

# Set environment variables for launchd processes.
if [[ "$OSTYPE" == darwin* ]]; then
  for env_var in PATH MANPATH; do
    launchctl setenv "$env_var" "${(P)env_var}" &!
  done
  unset env_var
fi

# Compile the completion dump, to increase startup speed.
dump_file="$HOME/.zcompdump"
if [[ "$dump_file" -nt "${dump_file}.zwc" || ! -f "${dump_file}.zwc" ]]; then
  zcompile "$dump_file"
fi
unset dump_file

