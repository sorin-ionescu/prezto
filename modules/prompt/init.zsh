#
# Loads prompt themes.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Usage:
#   To select a prompt theme, add the following to zshrc, and replace 'name'
#   with the name of the theme you wish to load. Setting it to random will load
#   a random theme.
#
#     zstyle ':omz:module:prompt' theme 'name'
#

# Load and run the prompt theming system.
autoload -Uz promptinit && promptinit

# Load the prompt theme.
zstyle -a ':omz:module:prompt' theme 'prompt_argv'
if (( $#prompt_argv > 0 )); then
  prompt "$prompt_argv[@]"
else
  prompt 'off'
fi
unset prompt_argv

