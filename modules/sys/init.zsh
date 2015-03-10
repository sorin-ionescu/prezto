#
# Provides System informations based on lsb_release and uname
#
# Authors:
#   Emmanuel Bouthenot <kolter@openics.org>
#

# Return if requirements are not found.
if (( ! $+commands[lsb_release] )) || (( ! $+commands[uname] )) ; then
  return 1
fi
