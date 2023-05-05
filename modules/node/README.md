# Node.js

Provides utility functions for [Node.js][1], loads the Node Version Manager, and
enables [_npm_][2] completion.

This module must be loaded _before_ the _`completion`_ module so that the
provided completion definitions are loaded.

## nodenv

[_nodenv_][5] does one thing well - it is concerned solely with switching
Node versions. It is simple and predictable, Just Works, and is rock solid in
production. nodenv is forked from the popular [_rbenv_][6].

This will be loaded automatically if nodenv is installed in `$NODENV_ROOT`,
_`$XDG_CONFIG_HOME/nodenv`_, _`~/.nodenv`_, or `nodenv` is on the path.

## nvm

[_nvm_][7] allows for managing multiple, isolated Node.js installations in the
home directory.

This will be loaded automatically if nvm is installed in `$NVM_DIR`,
_`$XDG_CONFIG_HOME/nvm`_, _`~/.nvm`_, or is installed with homebrew.

## Variables

- `N_PREFIX` stores the path to [_n_][8] cache.

## Aliases

Aliases are enabled by default. To disable them, add the following to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_.

```sh
zstyle ':prezto:module:node:alias' skip 'yes'
```

### npm

- `npmi` install a package.
- `npml` list installed packages.
- `npmo` check for outdated packages.
- `npmp` publish a package.
- `npmP` remove extraneous packages.
- `npmr` run arbitrary package scripts.
- `npms` search for packages.
- `npmt` test a package.
- `npmu` update packages.
- `npmx` uninstalls a package.

- `npmci` install a project with a clean slate.
- `npmcit` install a project with a clean slate and run tests.
- `npmit` install package(s) and run tests.

## Functions

- `node-doc` opens the Node.js online [API documentation][3] in the default
  browser.
- `node-info` exposes information about the Node.js environment via the
  `$node_info` associative array.

## Theming

To display the version number of the current Node.js version, define the
following style inside the `prompt_name_setup` function.

```sh
# %v - Node.js version.
zstyle ':prezto:module:node:info:version' format 'version:%v'
```

Then add `$node_info[version]` to either `$PROMPT` or `$RPROMPT` and call
`node-info` in `prompt_name_preexec` hook function.

## Authors

_The authors of this module should be contacted via the [issue tracker][4]._

- [Sorin Ionescu](https://github.com/sorin-ionescu)
- [Zeh Rizzatti](https://github.com/zehrizzatti)
- [Indrajit Raychaudhuri](https://github.com/indrajitr)

[1]: http://nodejs.org
[2]: http://npmjs.org
[3]: http://nodejs.org/api
[4]: https://github.com/sorin-ionescu/prezto/issues
[5]: https://github.com/nodenv/nodenv
[6]: https://github.com/sstephenson/rbenv
[7]: https://github.com/nvm-sh/nvm
[8]: https://github.com/tj/n
