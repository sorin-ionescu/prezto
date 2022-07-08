# Syntax Highlighting

Integrates [zsh-syntax-highlighting][1] into Prezto.

This module must be loaded _before_ the _`prompt`_ module.

If this module is used in conjunction with the [_`history-substring-search`_][2]
module, this module must be loaded _before_ the _`history-substring-search`_
module.

Additionally, if this module is used in conjunction with the
[_`autosuggestions`_][3] module, this module must be loaded _before_ the
_`autosuggestions`_ module as well.

To elaborate, the relative order of loading the modules would be
_`syntax-highlighting`_, _`history-substring-search`_, _`autosuggestions`_ and
_`prompt`_.

## Contributors

New features and bug fixes should be submitted to the
[zsh-syntax-highlighting][1] project according to its rules and regulations.
This module will be synchronized against it.

## Settings

### Highlighting

To enable highlighting for this module only, add the following line to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_:

```sh
zstyle ':prezto:module:syntax-highlighting' color 'yes'
```

### Highlighters

Syntax highlighting is accomplished by pluggable [highlighters][4]. This module
only enables the _main_ highlighter by default.

To enable all highlighters, add the following to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_.

```sh
zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'line' \
  'cursor' \
  'root'
```

### Highlighting Styles

Each syntax highlighter defines styles used to highlight tokens.

To highlight, for example, builtins, commands, and functions in blue instead of
green, add the following to _`${ZDOTDIR:-$HOME}/.zpreztorc`_:

```sh
zstyle ':prezto:module:syntax-highlighting' styles \
  'builtin' 'bg=blue' \
  'command' 'bg=blue' \
  'function' 'bg=blue'
```

## Authors

_The authors of this module should be contacted via the [issue tracker][5]._

- [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/zsh-users/zsh-syntax-highlighting
[2]: ../history-substring-search#readme
[3]: ../autosuggestions#readme
[4]: https://github.com/zsh-users/zsh-syntax-highlighting/tree/master/highlighters
[5]: https://github.com/sorin-ionescu/prezto/issues
