# Completion

Loads and configures <kbd>TAB</kbd> completion and provides additional
completions from the [zsh-completions][1] project.

This module must be loaded late _after_ the _`utility`_ module and all other
modules that provide completion definitions.

## Options

- `COMPLETE_IN_WORD` complete from both ends of a word.
- `ALWAYS_TO_END` move cursor to the end of a completed word.
- `PATH_DIRS` perform path search even on command names with slashes.
- `AUTO_MENU` show completion menu on a successive <kbd>TAB</kbd> press.
- `AUTO_LIST` automatically list choices on ambiguous completion.
- `AUTO_PARAM_SLASH` if completed parameter is a directory, add a trailing
  slash (`/`).
- `EXTENDED_GLOB` needed for file modification glob modifiers with _compinit_.
- `MENU_COMPLETE` do not autoselect the first completion entry.
- `FLOW_CONTROL` disable start/stop characters in shell editor.

## Variables

- `LS_COLORS` used by default for Zsh [standard style][2] 'list-colors'.

## Settings

### Ignore _`/etc/hosts`_ Entries

To ignore certain entries from static _`/etc/hosts`_ for host completion, add
the following lines in _`${ZDOTDIR:-$HOME}/.zpreztorc`_ with the IP addresses of
the hosts as they appear in _`/etc/hosts`_. Both IP address and the associated
hostname(s) will be ignored during host completion. However, some of the entries
ignored from _`/etc/hosts`_ still might appear during completion because of
their presence in _ssh_ configuration or history).

```sh
zstyle ':prezto:module:completion:*:hosts' etc-host-ignores \
    '0.0.0.0' '127.0.0.1'
```

## Contributors

Completions should be submitted to the [zsh-completions][1] project according to
its rules and regulations. This module will be synchronized against it.

## Authors

_The authors of this module should be contacted via the [issue tracker][3]._

- [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/zsh-users/zsh-completions
[2]: https://zsh.sourceforge.net/Doc/Release/Completion-System.html#Standard-Styles
[3]: https://github.com/sorin-ionescu/prezto/issues
