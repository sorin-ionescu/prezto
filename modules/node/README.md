Node.js
=======

Provides utility functions for [Node.js][1], loads the Node Version Manager, and
enables [npm][2] completion.

nvm
---

[nvm][5] allows for managing multiple, isolated Node.js installations in the
home directory.

This will be loaded automatically if nvm is installed in `$NVM_DIR`,
`~/.nvm`, or nvm is installed with homebrew.

nodenv
------

[nodenv][6] does one thing well. nodenv is concerned solely with switching
Node versions. It's simple and predictable, Just Works, and is rock solid in
production. nodenv is forked from the popular [rbenv][7].

This will be loaded automatically if nodenv is installed in `$NODENV_ROOT`,
`~/.nodenv`, or `nodenv` is on the path.

Functions
---------

  - `node-doc` opens the Node.js online [API documentation][3] in the default
    browser.
  - `node-info` exposes information about the Node.js environment via the
    `$node_info` associative array.

Theming
-------

To display the version number of the current Node.js version, define the
following style inside the `prompt_name_setup` function.

```sh
# %v - Node.js version.
zstyle ':prezto:module:node:info:version' format 'version:%v'
```

Then add `$node_info[version]` to either `$PROMPT` or `$RPROMPT` and call
`node-info` in `prompt_name_preexec` hook function.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][4].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)
  - [Zeh Rizzatti](https://github.com/zehrizzatti)

[1]: http://nodejs.org
[2]: http://npmjs.org
[3]: http://nodejs.org/api
[4]: https://github.com/sorin-ionescu/prezto/issues
[5]: https://github.com/creationix/nvm
[6]: https://github.com/nodenv/nodenv
[7]: https://github.com/sstephenson/rbenv
