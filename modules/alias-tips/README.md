Alias Tips
==========

Integrates [alias-tips][1] into Prezto, which reminds you
whenever the command you just ran has an defined alias.

Settings
--------

### Text

To change the tip text prefix, add the following line to *zpreztorc*:

    zstyle ':prezto:module:alias-tips' text '💡 '

To exclude certain commands

    zstyle ':prezto:module:alias-tips' exclude '_ c'

To automatically expand the alias

    zstyle ':prezto:module:alias-tips' expand 'yes'


Contributors
------------

New features and bug fixes should be submitted to the
[alias-tips][1] project according to its rules and
regulations. This module will be synchronized against it.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Jonathan Dahan](https://github.com/jedahan)

[1]: https://github.com/djui/alias-tips
[2]: https://github.com/sorin-ionescu/prezto/issues
