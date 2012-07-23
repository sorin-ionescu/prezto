#
# Displays installation information for not found commands.
#
# Authors:
#   Joseph Jon Booker <joe@neoturbine.net>
#

# Return if requirements are not found.
if [[ ! -s '/etc/zsh_command_not_found' ]]; then
  return 1
fi

source '/etc/zsh_command_not_found'

