#
# Integrates history-substring-search into Prezto.
#
# Authors:
#   Suraj N. Kurapati <sunaku@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
pmodload 'editor'

# Source module files.
source "${0:h}/external/zsh-history-substring-search.zsh" || return 1
source "${0:h}/configure.zsh" || return 1
