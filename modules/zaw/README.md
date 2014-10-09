Zaw
===

Loads and configures Zaw from the [zaw][1] project.

Contributors
------------

New features and bug fixes should be submitted to the [zaw][1] project according
to its rules and regulations. This module will be synchronized against it.

Settings
--------

### Case Sensitivity

To enable case-sensitivity for this module only, add the following line to
*zpreztorc*:

    zstyle ':prezto:module:zaw' case-sensitive 'yes'

### Highlighting

If colors are enabled, *zaw* will automatically highlight positive results.

To enable highlighting for this module only, add the following line to
*zpreztorc*:

    zstyle ':prezto:module:zaw' color 'yes'

To change the error color, add the following line to *zpreztorc*:

    zstyle ':prezto:module:zaw:color' error 'bg=red,fg=white'

To change the marked item color, add the following line to *zpreztorc*:

    zstyle ':prezto:module:zaw:color' marked 'bg=blue,fg=white'

To change the matched item color, add the following line to *zpreztorc*:

    zstyle ':prezto:module:zaw:color' matched 'bg=magenta,fg=white'

To change the selected item color, add the following line to *zpreztorc*:

    zstyle ':prezto:module:zaw:color' selected 'standout'

To change the list title color, add the following line to *zpreztorc*:

    zstyle ':prezto:module:zaw:color' title 'fg=yellow'

# Search

To set the maximum number of items, add the following line to *zpreztorc*:

    zstyle ':prezto:module:zaw' max-lines 15

To rotate to the other side of the list when the cursor reaches the top or the
bottom, add the following line to *zpreztorc*:

    zstyle ':filter-select' rotate-list 'yes'

To use extended search operators, add the following line to *zpreztorc*:

    zstyle ':prezto:module:zaw' extended-search 'yes'

More details can be found in the [zaw][1] project's README.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/zsh-users/zaw
[2]: https://github.com/sorin-ionescu/prezto/issues

