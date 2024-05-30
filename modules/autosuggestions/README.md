# Autosuggestions

Integrates [zsh-autosuggestions][1] into Prezto, which implements the
[Fish shell][2]'s autosuggestions feature, where the user can type in any part
of a previously entered command and Zsh suggests commands as you type based on
history and completions.

If this module is used in conjunction with the [_`syntax-highlighting`_][3]
module, this module must be loaded _after_ the _`syntax-highlighting`_ module.

Additionally, if this module is used in conjunction with the
[_`history-substring-search`_][4] module, this module must be loaded _after_ the
_`history-substring-search`_ module as well.

To elaborate, the relative order of loading the modules would be
_`syntax-highlighting`_, _`history-substring-search`_ and _`autosuggestions`_.

## Contributors

New features and bug fixes should be submitted to the [zsh-autosuggestions][1]
project according to its rules and regulations. This module will be synchronized
against it.

## Settings

### Highlighting

If colors are enabled, _autosuggestions_ will automatically highlight
positive results.

To enable highlighting for this module only, add the following line to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_:

```sh
zstyle ':prezto:module:autosuggestions' color 'yes'
```

To set the query found color, add the following line to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_:

```sh
zstyle ':prezto:module:autosuggestions:color' found ''
```

## Troubleshooting

### Autosuggestions from previous sessions don't show up

For autosuggestions from previous shell sessions to work, please make sure you
also have the `history` module enabled.

## Authors

_The authors of this module should be contacted via the [issue tracker][5]._

- [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/tarruda/zsh-autosuggestions
[2]: https://fishshell.com
[3]: ../syntax-highlighting#readme
[4]: ../history-substring-search#readme
[5]: https://github.com/sorin-ionescu/prezto/issues
