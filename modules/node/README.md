Node.js
=======

Provides utility functions for [Node.js][1] and loads [npm][2] completion.

nvm
---

Loads [nvm][5], which allows for managing multiple, isolated node.js
installations in the home directory.

Functions
---------

  - `node-doc` opens the Node.js online [API documentation][3] in the default
    browser.
  - `node-info` exposes information about the node.js environment via the
    `$node_info` associative array.

Theming
-------

To display the version number of the current node.js instance (when nvm is
setup), define the following style inside the `prompt_name_setup` function.

    # %v - node.js version
    zstyle ':prezto:module:node:info:version' format 'version:%v'

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

