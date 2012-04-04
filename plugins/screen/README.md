screen
======

Defines [GNU Screen][1] aliases and provides for auto launching it at start-up.

Aliases
-------

 - `sl` list sessions/socket directory.
 - `sn` start a new session.
 - `sr` attach to a session if one exists or start a new one.

Settings
--------

### Auto-start

Start a Screen session automatically when Zsh is launched.

To enable this feature, add the following line to *zshrc*:

    zstyle ':omz:plugin:screen' auto-start 'yes'

Authors
-------

*The authors of this plugin should be contacted via the GitHub issue tracker.*

 - [Sorin Ionescu](/sorin-ionescu)

[1]: http://www.gnu.org/software/screen/

