#
# Initializes Oh My Zsh.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Set the path to OMZ.
export OMZ="${0:h}"

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
  ${OMZ}/themes/*(/FN)
  ${plugins:+${OMZ}/plugins/${^plugins}/{functions,completions}(/FN)}
  ${OMZ}/{functions,completions}(/FN)
  $fpath
)

# Load and initialize the completion system ignoring insecure directories.
autoload -Uz compinit && compinit -i

# Source files (the order matters).
source "${OMZ}/helper.zsh"
source "${OMZ}/environment.zsh"
source "${OMZ}/terminal.zsh"
source "${OMZ}/keyboard.zsh"
source "${OMZ}/completion.zsh"
source "${OMZ}/history.zsh"
source "${OMZ}/directory.zsh"
source "${OMZ}/alias.zsh"
source "${OMZ}/spectrum.zsh"
source "${OMZ}/utility.zsh"

# Autoload Zsh functions.
autoload -Uz age
autoload -Uz zargs
autoload -Uz zcalc
autoload -Uz zmv

# Source plugins defined in ~/.zshrc.
for plugin in "$plugins[@]"; do
  zstyle ":omz:plugin:$plugin" enable 'yes'

  if [[ ! -d "${OMZ}/plugins/$plugin" ]]; then
    print "omz: no such plugin: $plugin" >&2
  fi

  if [[ -f "${OMZ}/plugins/$plugin/init.zsh" ]]; then
    source "${OMZ}/plugins/$plugin/init.zsh"
  fi
done
unset plugin plugins

# Autoload Oh My Zsh functions.
for fdir in "$fpath[@]"; do
  if [[ "$fdir" == ${OMZ}/(|*/)functions ]]; then
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
prompt "$prompt_argv[@]"
unset prompt_argv

# Auto-update Zsh every week.
omz_update="$HOME/.zomzupdate"
if zstyle -t ':omz:updater:auto' update; then
  # Initialize the update reminder.
  if [[ ! -f "$omz_update" ]]; then
    touch "$omz_update"
  fi

  # Check for update every 7 days.
  if [ "$omz_update"(Nm+7)  ]; then
    update-omz && touch "$omz_update"
  fi
fi
unset omz_update

# Compile the completion dump, to increase startup speed.
dump_file="$HOME/.zcompdump"
if [[ "$dump_file" -nt "${dump_file}.zwc" || ! -f "${dump_file}.zwc" ]]; then
  zcompile "$dump_file"
fi
unset dump_file

