Pacman
======

Provides aliases and functions for the [Pacman][1] package manager and
frontends.

Settings
--------

It is possible to use a Pacman frontend with the pacman aliases provided by this
package as long as that frontend supports the same command line options (The
[AUR Helpers][2] page has a good comparison which lists if the command line
options are pacman compatible).

Please note that installing packages with an AUR Helper is not officially
supported by Archlinux. It is currently recommended to manually build AUR
packages using the [provided instructions][3]. The [aurutils][4] project has a
set of small utilities to make this easier.

To enable a Pacman frontend, add the following line to *zpreztorc*, substituting
`pacman_frontend` with the name of the frontent:

```sh
zstyle ':prezto:module:pacman' frontend 'pacman_frontend'
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

Functions
---------

  - `aurget` clone an aur package
  - `pacman-list-explicit` lists explicitly installed pacman packages.
  - `pacman-list-disowned` lists pacman disowned files.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][5].*

  - [Benjamin Boudreau](https://github.com/dreur)
  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: http://www.archlinux.org/pacman/
[2]: https://wiki.archlinux.org/index.php/AUR_helpers#Comparison_table
[3]: https://wiki.archlinux.org/index.php/Arch_User_Repository#Installing_packages
[4]: https://github.com/AladW/aurutils
[5]: https://github.com/sorin-ionescu/prezto/issues
