# Fasd

[Fasd][1] is a command-line productivity booster, inspired by tools like
[autojump][2], [z][3] and [v][4], it offers quick access to files and
directories by keeping track of files and directories that were previously
accessed.

For shell completion to work, this module must be loaded _after_ the
[_`completion`_][5] module.

The Prezto Fasd configuration differs from the default. The default aliases have
been disabled.

## Installation

`fasd` is bundled with prezto as a git submodule. Alternatively, you can
manually install `fasd`. If a manual installation is found, it will be used
instead of the bundled version.

## Aliases

Aliases are enabled by default. To disable them, add the following to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_.

```sh
zstyle ':prezto:module:fasd:alias' skip 'yes'
```

- `j` changes the current working directory interactively.

## Completion

Type `,`, `f,`, `d,` in front of a comma-separated query or type `,,`, `,,f`,
`,,d` at the end of a comma-separated query then hit <kbd>TAB</kbd>.

## Authors

_The authors of this module should be contacted via the [issue tracker][6]._

- [Wei Dai](https://github.com/clvv)
- [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/clvv/fasd
[2]: https://github.com/joelthelion/autojump
[3]: https://github.com/rupa/z
[4]: https://github.com/rupa/v
[5]: ../completion#readme
[6]: https://github.com/sorin-ionescu/prezto/issues
