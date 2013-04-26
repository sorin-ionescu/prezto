GPG-Agent
=========

Provides for an easier use of [gpg-agent][1].

Settings
--------

### SSH-Agent Protocol Emulation

To enable SSH-Agent protocol emulation, add the following line to *zpreztorc*:

    zstyle ':prezto:module:gpg-agent' ssh-support 'yes'

Variables
---------

Please note that if you use this agent, the variables will only be visible to
other instances of zsh. Should you use a non-shell mail user agent such as
thunderbird, make sure it inherits the variables. For an example how to
achieve this, have a look at issue #419 in the [issue tracker][2].

Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Florian Walch](https://github.com/fwalch)
  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: http://linux.die.net/man/1/gpg-agent
[2]: https://github.com/sorin-ionescu/prezto/issues
