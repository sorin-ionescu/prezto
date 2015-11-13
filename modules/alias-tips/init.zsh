#
# Integrates alias-tips into Prezto.
#
# Authors:
#   Jonathan Dhan <hi@jonathan.is>
#

# Source module files.

# Options
zstyle -s ':prezto:module:alias-tips' text 'ZSH_PLUGINS_ALIAS_TIPS_TEXT' && \
  export 'ZSH_PLUGINS_ALIAS_TIPS_TEXT'

zstyle -s ':prezto:module:alias-tips' excludes 'ZSH_PLUGINS_ALIAS_TIPS_EXCLUDES' && \
  export ZSH_PLUGINS_ALIAS_TIPS_EXCLUDES

if zstyle -t ':prezto:module:alias-tips' expand; then
  export ZSH_PLUGINS_ALIAS_TIPS_EXPAND=1
fi

source "${0:h}/external/alias-tips.plugin.zsh" || return 1
