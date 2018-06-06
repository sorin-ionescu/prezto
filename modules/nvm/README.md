NVM
====

Configures [Node][1] local gem installation, loads version managers, and defines
aliases.

NVM
---

[The Node Version Manager (NVM)][2], allows for managing multiple, isolated
Node installations and node_modules sets in the home directory.

#### Auto-Switch

To enable auto switching the Node version on directory change based on the
.nvmrc file, add the following line to *zpreztorc*:

    zstyle ':prezto:module:node:nvm' auto-switch 'yes'


Authors
-------

*The authors of this module should be contacted via the [issue tracker][5].*

  - [Jim Ray](https://github.com/jimiray)

[1]: https://nodejs.org/en/
[2]: https://github.com/creationix/nvm
