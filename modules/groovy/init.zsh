#
# Loads the Groovy enVironment Manager
#
# Authors:
#   Pavel Chernykh <pavel.v.chernykh@gmail.com>
#

#
# Load manually installed the Groovy enVironment Manager
#
if [[ -s "$HOME/.gvm/bin/gvm-init.sh" ]]; then
  source "$HOME/.gvm/bin/gvm-init.sh"
fi
