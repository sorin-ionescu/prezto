# Emacs

Enables Emacs dependency management.

## Dependency management

[Carton][1] installs and manages Emacs packages for Emacs package development
and Emacs configuration.

This module prepends the Carton directory to the path variable to enable the
execution of `carton`.

## Aliases

Aliases are enabled by default. To disable them, add the following to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_.

```sh
zstyle ':prezto:module:emacs:alias' skip 'yes'
```

### Carton

- `cai` installs dependencies.
- `cau` updates dependencies.
- `caI` initializes the current directory for dependency management.
- `cae` executes a command which correct dependencies.

## Authors

_The authors of this module should be contacted via the [issue tracker][2]._

- [Sebastian Wiesner](https://github.com/lunaryorn)

[1]: https://github.com/rejeep/carton
[2]: https://github.com/sorin-ionescu/prezto/issues
