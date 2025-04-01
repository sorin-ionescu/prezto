#
# Loads prompt themes.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load and execute the prompt theming system.
autoload -Uz promptinit && promptinit

# Load the prompt theme.
zstyle -a ':prezto:module:prompt' theme 'prompt_argv'
if [[ "$TERM" == (dumb|linux|*bsd*) ]] || (( $#prompt_argv < 1 )); then
  prompt 'off'
elif [[ "$prompt_argv[1]" == 'powerlevel9k' ]] ; then
  printf "'powerlevel9k' has been deprecated and unsupported by its author, "
  printf "consider migrating to 'powerlevel10k' instead.\n"
  printf "Switching to prezto default prompt...\n"
  prompt 'sorin'
else
  prompt "$prompt_argv[@]"
fi
unset prompt_argv
