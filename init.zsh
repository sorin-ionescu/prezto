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

# Get enabled plugins.
zstyle -a ':omz:load' plugin 'plugins'

# Add functions to fpath.
fpath=(
  ${0:h}/themes/*(/FN)
  ${plugins:+${0:h}/plugins/${^plugins}/{functions,completions}(/FN)}
  ${0:h}/{functions,completions}(/FN)
  $fpath
)

# Autoload Zsh modules.
zstyle -a ':omz:load' module 'zsh_modules'
for zsh_module in "$zsh_modules[@]"; do
  zmodload "${(z)zsh_module}"
done
unset zsh_modules zsh_module

# Autoload Zsh functions.
zstyle -a ':omz:load' function 'zsh_functions'
for zsh_function in "$zsh_functions[@]"; do
  autoload -Uz "$zsh_function"
done
unset zsh_functions zsh_function

# Load and initialize the completion system ignoring insecure directories.
autoload -Uz compinit && compinit -i

# Source files (the order matters).
source "${0:h}/helper.zsh"
source "${0:h}/environment.zsh"
source "${0:h}/terminal.zsh"
source "${0:h}/editor.zsh"
source "${0:h}/completion.zsh"
source "${0:h}/history.zsh"
source "${0:h}/directory.zsh"
source "${0:h}/spectrum.zsh"
source "${0:h}/alias.zsh"
source "${0:h}/utility.zsh"

# Source plugins defined in ~/.zshrc.
for plugin in "$plugins[@]"; do
  if [[ ! -d "${0:h}/plugins/$plugin" ]]; then
    print "omz: no such plugin: $plugin" >&2
  fi

  if [[ -f "${0:h}/plugins/$plugin/init.zsh" ]]; then
    source "${0:h}/plugins/$plugin/init.zsh"
  fi

  if (( $? == 0 )); then
    zstyle ":omz:plugin:$plugin" enable 'yes'
  fi
done
unset plugin plugins

# Autoload Oh My Zsh functions.
for fdir in "$fpath[@]"; do
  if [[ "$fdir" == ${0:h}/(|*/)functions ]]; then
    for omz_function in $fdir/[^_.]*(N.:t); do
      autoload -Uz "$omz_function"
    done
  fi
done
unset fdir omz_function

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

