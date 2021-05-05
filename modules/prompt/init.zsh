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
  <<EOW
WARNING: Prezto does not support 'powerlevel9k' anymore as it has
         been deprecated and is not supported by its author.
         Consider migrating to 'powerlevel10k' instead by setting:
         zstyle ':prezto:module:prompt' theme 'powerlevel10k'
         in ${${ZDOTDIR:-$HOME}/#$HOME/~}/.zpreztorc.
         Switching to prezto default prompt 'sorin'..."
EOW
  prompt 'sorin'
else
  prompt "$prompt_argv[@]"
fi
unset prompt_argv
