screen
======

Defines [GNU Screen][1] aliases and provides for auto launching it at start-up.

Aliases
-------

 - `sl`, List sessions/socket directory
 - `sn`, Start a new screen session
 - `sr`, Attach to a screen session if possible, otherwise start a new one

Settings
--------

### Auto-start

Start a screen session automatically when a Zsh session is opened.

To enable this feature, one line has to be added to the configuration file:

    zstyle ':omz:plugin:screen' auto-start 'yes'

Authors
-------

*The authors of this plugin should be contacted via the github bug tracker.*

 - [Sorin Ionescu](/sorin-ionescu)

[1]: http://www.gnu.org/software/screen/
