#
# Displays installation information for not found commands.
#
# Authors:
#   Joseph Jon Booker <joe@neoturbine.net>
#

# Return if requirements are not found.
if [[ -s '/etc/zsh_command_not_found' ]]; then
  source '/etc/zsh_command_not_found' # Debian-based distributions
elif [[ -s '/usr/share/doc/pkgfile/command-not-found.zsh' ]]; then
  source '/usr/share/doc/pkgfile/command-not-found.zsh' # Arch Linux
else
  return 1
fi
