# MacPorts

Defines MacPorts aliases and adds MacPorts directories to path variables.

## Aliases

Aliases are enabled by default. To disable them, add the following to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_.

```sh
zstyle ':prezto:module:macports:alias' skip 'yes'
```

- `portc` cleans the files used to build ports.
- `porti` installs a port.
- `ports` searches for a port.
- `portu` upgrades a port.
- `portU` upgrades MacPorts, the ports collection, and outdated ports.
- `portx` uninstalls a port.
- `portX` uninstalls inactive ports.

## Authors

_The authors of this module should be contacted via the [issue tracker][1]._

- [Matt Cable](https://github.com/curiousstranger)
- [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/sorin-ionescu/prezto/issues
