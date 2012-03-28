gnu-utils
=========

Provides for the interactive use of [GNU Core Utilities][1] on non-GNU systems.

Installing the GNU Core Utilities on non-GNU systems in `$PATH` without
a prefix, i.e. `ls` instead of `gls`, is not recommended since scripts that
target other core utilities will be broken.

However, for interactive use, prefixed commands can be hashed to their
non-prefixed counterparts.

Settings
--------

### Prefix

To use a different prefix, add the following to *zshrc*, and replace 'g' with
the desired prefix:

    zstyle ':omz:module:gnu-utils' prefix 'g'

Authors
-------

*The authors of this module should be contacted via the GitHub issue tracker.*

 - [Sorin Ionescu](/sorin-ionescu)

[1]: http://www.gnu.org/software/coreutils/

