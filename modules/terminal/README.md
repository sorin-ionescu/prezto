Terminal
========

Sets terminal window and tab titles.

Settings
--------

### Auto-Title

To auto set the terminal window and tab titles with the current command or
directory, add the following to *zpreztorc*:

    zstyle ':prezto:module:terminal' auto-title 'yes'

Auto titling is disabled inside terminal multiplexers, except inside dvtm, since
it interferes with window names defined in configuration files and profile
managers.

Functions
---------

- `set-tab-title` sets the terminal tab title.
- `set-window-title` sets the terminal or terminal multiplexer window title.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][1].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/sorin-ionescu/prezto/issues

