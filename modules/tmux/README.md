tmux
====

Defines [tmux][1] aliases and provides for auto launching it at start-up.

Aliases
-------

 - `ta` attach or switch to a tmux session.
 - `tl` list sessions managed by the tmux server.

Settings
--------

### Auto-start

Start a tmux session automatically when Zsh is launched.

To enable this feature, add the following line to *zshrc*:

    zstyle ':omz:module:tmux' auto-start 'yes'

It will create a background session named _#OMZ_ and attach every new shell to
it.

To avoid keeping open sessions, this module sets `destroy-unattached off` on
the background session and `destroy-unattached on` on every other session
(global setting).

Caveats
-------

tmux is known to cause kernel panics on Mac OS X. A discussion about this and
OMZ has already been opened [here][2].

For Mac users, launching tmux can cause an error
(`launch_msg(...): Socket is not connected`). this can be easily fixed by
installing [reattach-to-user-namespace][3] (available on [homebrew][4]).

You then have to change your `~/.tmux.conf` to add :

    set-option -g default-command "reattach-to-user-namespace -l $SHELL -l"

Authors
-------

*The authors of this module should be contacted via the github bug tracker.*

 - [Sorin Ionescu](/sorin-ionescu)
 - [Colin Hebert](/ColinHebert)

[1]: http://tmux.sourceforge.net
[2]: http://git.io/jkPqHg
[3]: ChrisJohnsen/tmux-MacOSX-pasteboard
[4]: mxcl/homebrew
