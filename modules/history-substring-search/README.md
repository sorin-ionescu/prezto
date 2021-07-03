# History Substring Search

Integrates [`zsh-history-substring-search`][1] into Prezto, which implements the
[Fish shell][2]'s history search feature, where the user can type in any part of
a previously entered command and press up and down to cycle through matching
commands.

If this module is used in conjunction with the [_`syntax-highlighting`_][3]
module, this module must be loaded _after_ the _`syntax-highlighting`_ module.

Additionally, if this module is used in conjunction with the
[_`autosuggestions`_][4] module, this module must be loaded _before_ the
_`autosuggestions`_ module.

To elaborate, the relative order of loading the modules would be
_`syntax-highlighting`_, _`history-substring-search`_ and _`autosuggestions`_.

## Contributors

New features and bug fixes should be submitted to the
[`zsh-history-substring-search`][1] project according to its rules and
regulations. This module will be synchronized against it.

## Settings

### Case Sensitivity

To enable case-sensitivity for this module only, add the following line to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_:

```sh
zstyle ':prezto:module:history-substring-search' case-sensitive 'yes'
```

### Highlighting

If colors are enabled, _history-substring-search_ will automatically highlight
positive results.

To disable highlighting for this module only, add the following line to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_:

```sh
zstyle ':prezto:module:history-substring-search' color 'no'
```

To set the query found color, add the following line to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_:

```sh
zstyle ':prezto:module:history-substring-search:color' found ''
```

To set the query not found color, add the following line to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_:

```sh
zstyle ':prezto:module:history-substring-search:color' not-found ''
```

To set the search globbing flags, add the following line to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_:

```sh
zstyle ':prezto:module:history-substring-search' globbing-flags ''
```

## Authors

_The authors of this module should be contacted via the [issue tracker][5]._

- [Suraj N. Kurapati](https://github.com/sunaku)
- [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/zsh-users/zsh-history-substring-search
[2]: https://fishshell.com
[3]: ../syntax-highlighting#readme
[4]: ../autosuggestions#readme
[5]: https://github.com/sorin-ionescu/prezto/issues
