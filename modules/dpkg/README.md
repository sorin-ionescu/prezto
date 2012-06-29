Dpkg
====

Defines [dpkg][1] aliases and functions

Aliases
-------

### General

  - `as` searches for a package.
  - `ad` updates packages lists.
  - `au` upgrades packages.
  - `ai` installs package.
  - `ar` removes package.
  - `ap` prints pinning levels.
  - `av` shows package info.
  - `acs` searches for a package.
  - `ac` cleans cache.
  - `afs` finds a file's package.
  - `debi` installs all deb files in the current directory
  - `debc` creates a basic deb package
  - `kclean` removes ALL kernel images and headers EXCEPT the one in use.

Functions
---------

  - `apt-copy` generate a script that can duplicate and apt based system
  - `apt-history` displays dpkg history
  - `dbb-build` makes a dpkg linux kernel package

Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)
  - [Daniel Bolton](https://github.com/dbb)
  - [Benjamin Boudreau](https://github.com/dreur)

[1]: http://alioth.debian.org/projects/dpkg
[2]: https://github.com/sorin-ionescu/oh-my-zsh/issues

