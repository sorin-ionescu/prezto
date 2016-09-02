Node.js
=======

Provides utility functions for [Node.js][1], loads the Node Version Manager, and
enables [npm][2] completion.

nvm
---

[nvm][5] allows for managing multiple, isolated Node.js installations in the
home directory.

Functions
---------

  - `node-doc` opens the Node.js online [API documentation][3] in the default
    browser.
  - `node-info` exposes information about the Node.js environment via the
    `$node_info` associative array.

Theming
-------

To display the version number or fork of the current Node.js or io.js version, define the
following style inside the `prompt_name_setup` function.

    # %v - Node.js version.
    # %f - Node.js fork (either node or iojs).
    zstyle ':prezto:module:node:info:version' format 'version:%v'
    zstyle ':prezto:module:node:info:fork' format 'fork:%f'

Then add `$node_info[version]` and/or `$node_info[fork]` to either `$PROMPT` or `$RPROMPT` and call
`node-info` in `prompt_name_preexec` hook function.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][4].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)
  - [Zeh Rizzatti](https://github.com/zehrizzatti)
  - [Robbie Trencheny](https://github.com/robbiet480)

[1]: http://nodejs.org
[2]: http://npmjs.org
[3]: http://nodejs.org/api
[4]: https://github.com/sorin-ionescu/prezto/issues
[5]: https://github.com/creationix/nvm
