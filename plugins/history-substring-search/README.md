history-substring-search
========================

It implements the [Fish shell][1]'s history search feature, where the user can
type in any part of a previously entered command and press the `UP` and `DOWN`
arrow keys to cycle through matching commands.

Settings
--------

### Case Sensitivity

To enable case-sensitivity for this plugin only, add the following line to
*zshrc*:

    zstyle ':omz:plugin:history-substring-search' case-sensitive 'yes'

### Highlighting

If colors are enabled, _history-substring-search_ will automatically highlight
positive results.

To enable highlighting for this plugin only, and the following line to *zshrc*:

    zstyle -t ':omz:plugin:history-substring-search' color 'yes'

Authors
-------

*The authors of this plugin should be contacted via the GitHub issue tracker.*

 - [Sorin Ionescu](/sorin-ionescu)
 - [Suraj N. Kurapati](/sunaku)

[1]: http://fishshell.com

