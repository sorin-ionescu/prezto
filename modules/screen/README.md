GNU Screen
==========

Defines [GNU Screen][1] aliases and provides for auto launching it at start-up.

Settings
--------

### Auto-Start

Starts a GNU Screen session automatically when Zsh is launched.

To enable this feature, add the following line to *zpreztorc*:

    zstyle ':prezto:module:screen' auto-start 'yes'

#### SSH and auto-start

To avoid having screen sessions inside screen sessions, auto-start is disabled for
SSH access.

It is possible to re-enable auto-start for SSH sessions with

    zstyle ':prezto:module:screen' remote 'yes'

Aliases
-------

  - `scr` is short for `screen`.
  - `scrl` lists sessions/socket directory.
  - `scrn` starts a new session.
  - `scrr` attaches to a session if one exists or start a new one.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: http://www.gnu.org/software/screen/
[2]: https://github.com/sorin-ionescu/prezto/issues

