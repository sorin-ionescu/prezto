#
# Integrates djui/alias-tips into Prezto.
#
# Authors:
#   Martin Zeman <martin.zeman@pm.me>
#

# Set default text.
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias tip: " # Variable needs to be exported first
zstyle -s ":prezto:module:alias-tips" text "ZSH_PLUGINS_ALIAS_TIPS_TEXT"

# Source module files.
source "${0:h}/external/alias-tips.plugin.zsh" || return 1
