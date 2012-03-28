#
# Defines Git information display styles.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# %s - Special action name (am, merge, rebase).
zstyle ':omz:module:git:prompt' action 'action:%s'

# %a - Indicator to notify of added files.
zstyle ':omz:module:git:prompt' added 'added:%a'

# %A - Indicator to notify of ahead branch.
zstyle ':omz:module:git:prompt' ahead 'ahead:%A'

# %B - Indicator to notify of behind branch.
zstyle ':omz:module:git:prompt' behind 'behind:%B'

# %b - Branch name.
zstyle ':omz:module:git:prompt' branch '%b'

# %c - SHA-1 hash.
zstyle ':omz:module:git:prompt' commit 'commit:%c'

# %d - Indicator to notify of deleted files.
zstyle ':omz:module:git:prompt' deleted 'deleted:%d'

# %D - Indicator to notify of dirty files.
zstyle ':omz:module:git:prompt' dirty 'dirty:%D'

# %m - Indicator to notify of modified files.
zstyle ':omz:module:git:prompt' modified 'modified:%m'

# %R - Remote name.
zstyle ':omz:module:git:prompt' remote '%R'

# %r - Indicator to notify of renamed files.
zstyle ':omz:module:git:prompt' renamed 'renamed:%r'

# %S - Indicator to notify of stashed files.
zstyle ':omz:module:git:prompt' stashed 'stashed:%S'

# %U - Indicator to notify of unmerged files.
zstyle ':omz:module:git:prompt' unmerged 'unmerged:%U'

# %u - Indicator to notify of untracked files.
zstyle ':omz:module:git:prompt' untracked 'untracked:%u'

# Left prompt.
zstyle ':omz:module:git:prompt' prompt ' git:(%b %D)'

# Right prompt.
zstyle ':omz:module:git:prompt' rprompt ''

# Ignore submodule.
zstyle ':omz:module:git:prompt:ignore' submodule 'no'

# Ignore submodule when it is 'dirty', 'untracked', 'all', or 'none'.
zstyle ':omz:module:git:prompt:ignore:submodule' when 'all'

