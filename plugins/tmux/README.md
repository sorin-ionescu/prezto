tmux
====

Defines [tmux][1] aliases and provides for auto launching it at start-up.

Aliases
-------

 - `ta`, Attach or switch to a tmux session 
 - `tl`, List sessions managed by the tmux server

Settings
--------

### Auto-start

Start a tmux session automatically when a Zsh session is opened.

To enable this feature, one line has to be added to the configuration file:

    zstyle ':omz:plugin:tmux' auto-start 'yes'

This will automatically create a background session named _#OMZ_ and attach
every new shell to it.

To avoid keeping open sessions, this plugin sets ``destroy-unattached off`` on
the background session and ``destroy-unattached on`` on every other session
(global setting).

Caveats
-------

For some reasons, tmux seems to cause kernel panics on Mac OS X.  
A discussion about this and OMZ has already been opened [here][2].

Authors
-------

*The authors of this plugin should be contacted via the github bug tracker.*

 - [Sorin Ionescu](/sorin-ionescu)
 - [Colin Hebert](/ColinHebert)

[1]: http://tmux.sourceforge.net/
[2]: http://git.io/jkPqHg
