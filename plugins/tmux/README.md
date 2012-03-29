tmux Plugin
===========

Plugin enhancing the [tmux](http://tmux.sourceforge.net/) multiplexer.

Aliases
-------

 - `ta`, Attach or switch to a tmux session 
 - `tl`, List sessions managed by the tmux server

Settings
--------

### Auto-start

Start a tmux session automatically when a Zsh session is opened.

To enable this feature, one line has to be added to the configuration file:

    zstyle -t ':omz:plugin:tmux' auto-start 'yes'

This will automatically create a background session named "#OMZ" and attach every new shell to it.

To avoid keeping open sessions, this plugin sets ``destroy-unattached off`` on the background session and ``destroy-unattached on`` on every other session (global setting).

Caveats
-------

For some reasons, tmux seems to cause kernel panics on Mac OS X.  
A discussion about this and OMZ has already been opened [here](http://git.io/jkPqHg).

Authors
-------

*The authors of this plugin should be contacted via the github bug tracker.*

 - [Sorin Ionescu](/sorin-ionescu)
 - [Colin Hebert](/ColinHebert)
