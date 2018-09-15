Homebrew
========

Defines Homebrew specific shell environment variables and aliases.

Environment Variables
---------------------

Execute the following to list the environment variables loaded in the shell:

```sh
brew shellenv
```

Aliases
-------

### Homebrew

  - `brewc` cleans outdated brews and their cached archives.
  - `brewC` cleans outdated brews, including keg-only, and their cached archives.
  - `brewi` installs a formula.
  - `brewl` lists installed formulae.
  - `brewo` lists brews which have an update available.
  - `brews` searches for a formula.
  - `brewu` updates and upgrades Homebrew packages and formulae.
  - `brewx` uninstalls a formula.

### Homebrew Cask

  - `cask` is aliased to `brew cask`.
  - `caskc` cleans up old cached downloads.
  - `caskC` cleans up all cached downloads.
  - `caski` installs a cask.
  - `caskl` lists installed casks.
  - `casko` lists casks which have an update available.
  - `casks` searches for a cask.
  - `caskx` uninstalls a cask.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][1].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)
  - [Griffin Yourick](https://github.com/tough-griff)

[1]: https://github.com/sorin-ionescu/prezto/issues
