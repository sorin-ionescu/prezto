Tmux
====

Defines [tmux][1] aliases and provides for auto launching it at start-up.

Settings
--------

### Auto-Start

Starts a tmux session automatically when Zsh is launched.

To enable this feature when launching Zsh in a local terminal, add the
following line to *zpreztorc*:

    zstyle ':prezto:module:tmux:auto-start' local 'yes'

To enable this feature when launching Zsh in a SSH connection, add the
following line to *zpreztorc*:

    zstyle ':prezto:module:tmux:auto-start' remote 'yes'

In both cases, it will create a background session named _#Prezto_ and attach
every new shell to it.

To avoid keeping open sessions, this module sets `destroy-unattached off` on
the background session and `destroy-unattached on` on every other session
(global setting).

Aliases
-------

  - `tmuxa` attaches or switches to a tmux session.
  - `tmuxl` lists sessions managed by the tmux server.

Caveats
-------

On Mac OS X, launching tmux can cause the error **launch_msg(...): Socket is not
connected** to be displayed, which can be fixed by installing
[reattach-to-user-namespace][3], available in [Homebrew][4], and adding the
following to *tmux.conf*:

   set-option -g default-command "reattach-to-user-namespace -l $SHELL -l"

Furthermore, tmux is known to cause **kernel panics** on Mac OS X. A discussion
about this and Prezto has already been [opened][2].

Authors
-------

*The authors of this module should be contacted via the [issue tracker][5].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)
  - [Colin Hebert](https://github.com/ColinHebert)
  - [Georges Discry](https://github.com/gdiscry)

[1]: http://tmux.sourceforge.net
[2]: https://github.com/sorin-ionescu/prezto/issues/62
[3]: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
[4]: https://github.com/mxcl/homebrew
[5]: https://github.com/sorin-ionescu/prezto/issues

