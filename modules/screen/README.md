# GNU Screen

Defines [GNU Screen][1] aliases and provides for auto launching it at start-up.

## Settings

### Auto-Start

Starts a GNU Screen session automatically when Zsh is launched.

To enable this feature when launching Zsh in a local terminal, add the following
line to _`${ZDOTDIR:-$HOME}/.zpreztorc`_:

```sh
zstyle ':prezto:module:screen:auto-start' local 'yes'
```

To enable this feature when launching Zsh in a SSH connection, add the following
line to _`${ZDOTDIR:-$HOME}/.zpreztorc`_:

```sh
zstyle ':prezto:module:screen:auto-start' remote 'yes'
```

## Aliases

Aliases are enabled by default. To disable them, add the following to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_.

```sh
zstyle ':prezto:module:screen:alias' skip 'yes'
```

- `scr` is short for `screen`.
- `scrl` lists sessions/socket directory.
- `scrn` starts a new session.
- `scrr` attaches to a session if one exists or start a new one.

## Authors

_The authors of this module should be contacted via the [issue tracker][2]._

- [Sorin Ionescu](https://github.com/sorin-ionescu)
- [Georges Discry](https://github.com/gdiscry)

[1]: https://www.gnu.org/software/screen/
[2]: https://github.com/sorin-ionescu/prezto/issues
