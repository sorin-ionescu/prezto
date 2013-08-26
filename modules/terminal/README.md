Terminal
========

Sets terminal window and tab titles.

Settings
--------

### Auto-Title

To auto set the terminal emulator window and tab titles with the current command
or directory, add the following to *zpreztorc*:

    zstyle ':prezto:module:terminal:auto-title' emulator 'yes'

To auto set the terminal multiplexer window title with the current command or
directory, add the following to *zpreztorc*:

    zstyle ':prezto:module:terminal:auto-title' multiplexer 'yes'

Functions
---------

- `set-screen-window-title` sets the screen title.
- `set-terminal-tab-title` sets the terminal tab title.
- `set-terminal-window-title` sets the terminal window title.
- `set-titles-with-command` sets the screen and terminal titles with
  a given command.
- `set-titles-with-path` sets the screen and terminal titles with a given path.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][1].*

  - [James Cox](https://github.com/imajes)
  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/sorin-ionescu/prezto/issues

