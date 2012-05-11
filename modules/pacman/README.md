Pacman
======

Provides aliases and utility functions for package management on Arch Linux with
`pacman` and `yaourt`.

Aliases
-------

This module defines some useful aliases to work with `pacman` and `yaourt`.
These aliases use `sudo` whenever a command needs privileges.

- `arch-upgrade`: Upgrade the whole system with `yaourt`, if installed, or with
  `pacman` otherwise.

### Aliases for `yaourt`

These aliases use the `yaourt` command, and are thus only available, if
[`yaourt`][1] is installed.

- `yaconf`: Fix all configuration files with `vimdiff`.
- `yaupg`: Synchronize repositories and upgrade packages that are out of date.
- `yain`: Install specific package(s) from the *repositories*.
- `yainsd`: Install a specific package(s) from the *repositories* as
  *dependency* of another package.
- `yains`: Install specific packages(s) from *local file(s)*.
- `yare`: Remove specified package(s), *retaining* its configuration(s) and
  dependencies.
- `yarem`: Remove the specified package(s), *including* its configuration(s) and
  unneeded dependencies.
- `yarep`: Display information about a given package in the *repositories*.
- `yaloc`: Display information about a given package in the *local database*.
- `yareps`: Search for package(s) in the *repositories*.
- `yalocs`: Search for package(s) in the *local database*.
- `yamir`: Force refresh of all package lists after updating
  `/etc/pacman.d/mirrorlist`.
- `yaupd`: Update and refresh the local package and ABS (if `abs` is installed)
  databases against the repositories.

### Aliases for `pacman`

These aliases use the `pacman` command.

- `pacupg`: Synchronize repositories and upgrade packages that are out of date.
- `pacin`: Install specific package(s) from the *repositories*.
- `pacinsd`: Install a specific package(s) from the *repositories* as
  *dependency* of another package.
- `pacins`: Install specific packages(s) from *local file(s)*.
- `pacre`: Remove specified package(s), *retaining* its configuration(s) and
  dependencies.
- `pacrem`: Remove the specified package(s), *including* its configuration(s)
  and unneeded dependencies.
- `pacrep`: Display information about a given package in the *repositories*.
- `pacloc`: Display information about a given package in the *local database*.
- `pacreps`: Search for package(s) in the *repositories*.
- `paclocs`: Search for package(s) in the *local database*.
- `pacmir`: Force refresh of all package lists after updating
  `/etc/pacman.d/mirrorlist`.
- `pacupg`: Update and refresh the local package and ABS (if `abs` is installed)
  databases against the repositories.
- `paclsorphans`: List orphan package(s).
- `pacrmorphans`: Remove orphan package(s).

Functions
---------

This module defines the following functions:

- `paclist`: List explicitly installed pacman packages.
- `pacdisowned`: List pacman disowned files.

Authors
-------

*The authors of this module should be contacted via the Github issue tracker.*

- [Sorin Ionescu](/sorin-ionescu)

[1]: http://archlinux.fr/yaourt-en

