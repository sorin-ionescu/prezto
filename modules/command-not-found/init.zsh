#
# Displays installation information for not found commands.
#
# Authors:
#   Joseph Jon Booker <joe@neoturbine.net>
#   Indrajit Raychaudhuri <irc+code@indrajit.com>
#

# Load command-not-found on Debian-based distributions.
if [[ -s '/etc/zsh_command_not_found' ]]; then
  source '/etc/zsh_command_not_found'
# Load command-not-found on Arch Linux-based distributions.
elif [[ -s '/usr/share/doc/pkgfile/command-not-found.zsh' ]]; then
  source '/usr/share/doc/pkgfile/command-not-found.zsh'
# Load command-not-found on macOS when homebrew tap is configured.
elif (( $+commands[brew] )) && brew command command-not-found-init > /dev/null 2>&1; then
  eval "$(brew command-not-found-init)"
# Return if requirements are not found.
else
  return 1
fi
