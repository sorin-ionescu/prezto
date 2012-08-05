Ruby
====

Configures [Ruby][1] local gem installation, loads version managers, and defines
aliases.

Local Gem Installation
----------------------

When a Ruby version manager is not detected, local gems are installed in
*~/Library/Ruby/Gems/1.8* on Mac OS X.

RVM
---

An alternative to the above is to use [The Ruby Version Manager (RVM)][2], which
allows for managing multiple, isolated Ruby installations and gem sets in the
home directory.

Since RVM is loaded into the shell and is known to override shell commands, it
may conflict with shell scripts.

rbenv
-----

An alternative RVM is to use [rbenv][3], which allows for switching between multiple,
isolated Ruby installations in the home directory.

While it is not as feature rich as RVM, it is not loaded into the shell and is
not known to cause conflicts with shell scripts.

Bundler
-------

Manage gems that are not meant to be used as commands, such as application
dependencies, with [Bundler][4].

Aliases
-------

### Bundler

  - `b` manages ruby dependencies (`bundle`).
  - `be` executes a script in the context of the current bundle.
  - `bi` installs the gems specified in the *Gemfile* in *vendor/bundle*.
  - `bI` installs the following:
    - gems specified in the *Gemfile* in *vendor/bundle*.
    - packages the gems into *vendor/cache*.
    - appends bundler directories to  *.gitignore*.
  - `bl` lists all gems in the current bundle.
  - `bo` opens an installed gem in the editor.
  - `bp` packages gem files into *vendor/cache*.
  - `bu` updates gems to their latest version.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][5].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: http://www.ruby-lang.org
[2]: https://rvm.io
[3]: https://github.com/sstephenson/rbenv
[4]: http://gembundler.com
[5]: https://github.com/sorin-ionescu/prezto/issues

