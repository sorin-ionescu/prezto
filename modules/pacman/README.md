Pacman
======

Provides aliases and functions for the [Pacman][1] package manager and
frontends.

Settings
--------

It is possible to use a Pacman frontend with the pacman aliases provided by this
package as long as that frontend supports the same command line options (Such as
[Pacaur][2] or [Yaourt][3]).

To enable a Pacman frontend, for example, [Pacaur][2], add the following line to
*zpreztorc*:

```sh
zstyle ':prezto:module:pacman' frontend 'pacaur'
```

If you have enabled color globally in *zpreztorc*, you may disable it for certain
commands.

To disable `yaourt` highlighting, add the following line to *zpreztorc*:

```sh
zstyle ':prezto:module:pacman:yaourt' color 'no'
```

Aliases
-------

### Pacman

  - `pac` is short for `pacman`.
  - `paci` installs packages from repositories.
  - `pacI` installs packages from files.
  - `pacx` removes packages and unneeded dependencies.
  - `pacX` removes packages, their configuration, and unneeded dependencies.
  - `pacq` displays information about a package from the repositories.
  - `pacQ` displays information about a package from the local database.
  - `pacs` searches for packages in the repositories.
  - `pacS` searches for packages in the local database.
  - `pacu` synchronizes the local package and Arch Build System (requires `abs`)
    databases against the repositories.
  - `pacU` synchronizes the local package database against the repositories then
    upgrades outdated packages.
  - `pacman-list-orphans` lists orphan packages.
  - `pacman-remove-orphans` removes orphan packages.

### Frontends

#### Yaourt

Note that there are currently potential security concerns relating to yaourt, so
other frontends are recommended.

  - `pacc` manages *.pac\** files.

Functions
---------

  - `pacman-list-explicit` lists explicitly installed pacman packages.
  - `pacman-list-disowned` lists pacman disowned files.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][4].*

  - [Benjamin Boudreau](https://github.com/dreur)
  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: http://www.archlinux.org/pacman/
[2]: https://github.com/rmarquis/pacaur
[3]: http://archlinux.fr/yaourt-en
[4]: https://github.com/sorin-ionescu/prezto/issues
