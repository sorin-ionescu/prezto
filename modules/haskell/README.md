Haskell
=======

Enables per user Haskell package installation.

Per-user Package Installation
-----------------------------

[`cabal`][1], the Haskell package manager, can install packages into per user
directories.

This module prepends per user directories to the relevant path variables to
enable the execution of user installed executables and the reading of
documentation.

### Usage

Install packages into per user directories with `cabal install --user`.

Authors
-------

*The authors of this module should be contacted via the GitHub issue tracker.*

 - [Sebastian Wiesner](/lunaryorn)

[1]: http://www.haskell.org/cabal/
