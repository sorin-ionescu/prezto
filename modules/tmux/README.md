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

In both cases the tmux server will be started and a background session
named _prezto_ will be created if a session doesn't already exist.

By default every shell shares a set of windows but has an independent
view. Detaching from one of these sessions removes the view but the
open windows persist. This is accomplished by setting the
`destroy-unattached` option to `on` for each session.

Some users prefer that all new shells share the same session so that
the view for each shell is in sync. This useful for advanced users
that create multiple sessions and want to manually navigate between
them. To accomplish this behavior set the `mode` option to `shared` in
*zpreztorc*,

    zstyle ':prezto:module:tmux:auto-start' mode shared

You can customize the background session by creating a new session in
your `.tmux.conf` file.


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
  - [Xavier Cambar](https://github.com/xcambar)

[1]: http://tmux.sourceforge.net
[2]: https://github.com/sorin-ionescu/prezto/issues/62
[3]: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
[4]: https://github.com/mxcl/homebrew
[5]: https://github.com/sorin-ionescu/prezto/issues

