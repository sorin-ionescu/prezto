#
# Defines Git information display styles.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# %s - Special action name (am, merge, rebase).
zstyle ':omz:module:git' action 'action:%s'

# %a - Indicator to notify of added files.
zstyle ':omz:module:git' added 'added:%a'

# %A - Indicator to notify of ahead branch.
zstyle ':omz:module:git' ahead 'ahead:%A'

# %B - Indicator to notify of behind branch.
zstyle ':omz:module:git' behind 'behind:%B'

# %b - Branch name.
zstyle ':omz:module:git' branch 'branch:%b'

# %c - SHA-1 hash.
zstyle ':omz:module:git' commit 'commit:%c'

# %d - Indicator to notify of deleted files.
zstyle ':omz:module:git' deleted 'deleted:%d'

# %D - Indicator to notify of dirty files.
zstyle ':omz:module:git' dirty 'dirty:%D'

# %m - Indicator to notify of modified files.
zstyle ':omz:module:git' modified 'modified:%m'

# %p - HEAD position in relation to the nearest branch, remote, tag.
zstyle ':omz:module:git:prompt' position 'position:%p'

# %R - Remote name.
zstyle ':omz:module:git' remote 'remote:%R'

# %r - Indicator to notify of renamed files.
zstyle ':omz:module:git' renamed 'renamed:%r'

# %S - Indicator to notify of stashed files.
zstyle ':omz:module:git' stashed 'stashed:%S'

# %U - Indicator to notify of unmerged files.
zstyle ':omz:module:git' unmerged 'unmerged:%U'

# %u - Indicator to notify of untracked files.
zstyle ':omz:module:git' untracked 'untracked:%u'

# Left prompt.
zstyle ':omz:module:git' prompt ' git:(%b %D)'

# Right prompt.
zstyle ':omz:module:git' rprompt ''

# Ignore submodule.
zstyle ':omz:module:git:ignore' submodule 'no'

# Ignore submodule when it is 'dirty', 'untracked', 'all', or 'none'.
zstyle ':omz:module:git:ignore:submodule' when 'all'

