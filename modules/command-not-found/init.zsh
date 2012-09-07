#
# Displays installation information for not found commands.
#
# Authors:
#   Joseph Jon Booker <joe@neoturbine.net>
#   neeee <ne.tetewi@gmail.com>
#

if [[ -r '/etc/zsh_command_not_found' ]]; then
    source '/etc/zsh_command_not_found'
elif [[ -r '/usr/share/doc/pkgfile/command-not-found.zsh' ]]  
    source '/usr/share/doc/pkgfile/command-not-found.zsh'
else
    # Return if requirements are not found.
    return 1
fi


