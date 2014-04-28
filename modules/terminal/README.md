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

### Title formats

To format terminal window and tab titles, add the following to *zpreztorc*:

    zstyle ':prezto:module:terminal:window-title' format '%n@%m: %s'
    zstyle ':prezto:module:terminal:tab-title' format '%m: %s'

`%s` will be replaced with the current working directory path or the currently
executing program name.

For a list of sequences, see [Expansion of Prompt Sequences][1].

Users of terminal multiplexers like screen can choose which title format should
be used (`window-title` or `tab-title`).

    zstyle ':prezto:module:terminal' multiplexer-title 'window-title'

Functions
---------

- `set-tab-title` sets the terminal tab title.
- `set-window-title` sets the terminal or terminal multiplexer window title.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)
  - [Olaf Conradi](https://github.com/oohlaf)

[1]: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Expansion-of-Prompt-Sequences
[2]: https://github.com/sorin-ionescu/prezto/issues
