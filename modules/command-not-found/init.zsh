#
# Displays installation information for not found commands.
#
# Authors:
#   Joseph Jon Booker <joe@neoturbine.net>
#   Alex Gray <alex@mrgray.com> (Mac Support)
#

# Load command-not-found on Debian-based distributions.
if [[ -s '/etc/zsh_command_not_found' ]]; then
  source '/etc/zsh_command_not_found'
# Load command-not-found on Arch Linux-based distributions.
elif [[ -s '/usr/share/doc/pkgfile/command-not-found.zsh' ]]; then
  source '/usr/share/doc/pkgfile/command-not-found.zsh'
# Load command-not-found on Mac OS X with https://github.com/bfontaine/homebrew-command-not-found installed
elif (( $+commands[brew] )) && [[ -s "$(brew --prefix)/Library/Taps/bfontaine/homebrew-command-not-found/handler.sh" ]]; then
  source "$(brew --prefix)/Library/Taps/bfontaine/homebrew-command-not-found/handler.sh"
# Return if requirements are not found.
else
  return 1
fi
