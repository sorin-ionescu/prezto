Completion
==========

Loads and configures tab completion and provides additional completions from
the [zsh-completions][1] project.

This module must be loaded **after** the *utility* module.

Options
-------

  - `COMPLETE_IN_WORD` complete from both ends of a word.
  - `ALWAYS_TO_END` move cursor to the end of a completed word.
  - `PATH_DIRS` perform path search even on command names with slashes.
  - `AUTO_MENU` show completion menu on a successive tab press.
  - `AUTO_LIST` automatically list choices on ambiguous completion.
  - `AUTO_PARAM_SLASH` if completed parameter is a directory, add a trailing slash.
  - `EXTENDED_GLOB` needed for file modification glob modifiers with compinit.
  - `MENU_COMPLETE` do not autoselect the first completion entry.
  - `FLOW_CONTROL` disable start/stop characters in shell editor.

Settings
--------

### Ignore */etc/hosts* Entries

To ignore certain entries from static */etc/hosts* for host completion, add the
following lines in *zpreztorc* with the IP addresses of the hosts as they
appear in */etc/hosts*. Both IP address and the corresponding hostname will be
ignored during host completion. However, some of the entries ignored from
*/etc/hosts* still might appear during completion because of their presence in
*ssh* configuration or history).

```sh
zstyle ':prezto:module:completion:*:hosts' etc-host-ignores \
  '0.0.0.0' '127.0.0.1'
```

Contributors
------------

Completions should be submitted to the [zsh-completions][1] project according
to its rules and regulations. This module will be synchronized against it.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/zsh-users/zsh-completions
[2]: https://github.com/sorin-ionescu/prezto/issues
