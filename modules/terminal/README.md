Terminal
========

Sets terminal window and tab titles.

Settings
--------

### Auto-Title

To auto set the terminal window and tab titles with the current command or
directory, add the following to *zpreztorc*:

    zstyle ':prezto:module:terminal' auto-title 'yes'

A user-defined prefix may be added to the title using the following
styles, which undergo prompt expansion:

    zstyle ':prezto:module:terminal' prefix '%n @ %m: '
    zstyle ':prezto:module:terminal' tabprefix '%n @ %m: '


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

