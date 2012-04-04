history-substring-search
========================

This is a clean-room implementation of the [Fish shell][1]'s history search
feature, where you can type in any part of any previously entered command
and press the `UP` and `DOWN` arrow keys to cycle through the matching commands.

Settings
--------

### Case sensitivity

To enable case-sensitive search, add this line to the configuration file:

    zstyle ':omz:plugin:history-substring-search' case-sensitive 'yes'

### Highlighting

If colours are enabled, _history-substring-search_ will automatically highlight
positive results.

To enable highlighting for this plugin only:

    zstyle -t ':omz:plugin:history-substring-search' color 'yes'

Authors
-------

*The authors of this plugin should be contacted via the github bug tracker.*

 - [Sorin Ionescu](/sorin-ionescu)
 - [Suraj N. Kurapati](/sunaku)

[1]: http://fishshell.com
