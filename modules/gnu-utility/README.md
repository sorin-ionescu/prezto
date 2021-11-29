# GNU Utility

Provides for the interactive use of GNU utilities on BSD systems.

Installing GNU utilities on non-GNU systems in `$PATH` without a prefix, i.e.,
`ls` instead of `gls`, is not recommended since scripts that target other
utilities will be broken.

This module wraps GNU utilities in functions without a prefix for interactive
use.

This module must be loaded _before_ the [_`utility`_][1] module so that GNU
utilities enabled in this module are available for configuration in _`utility`_
module.

## Settings

### Prefix

To use a different prefix, add the following to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_, and replace `'g'` with the desired prefix.

```sh
zstyle ':prezto:module:gnu-utility' prefix 'g'
```

## Authors

_The authors of this module should be contacted via the [issue tracker][2]._

- [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: ../utility#readme
[2]: https://github.com/sorin-ionescu/prezto/issues
