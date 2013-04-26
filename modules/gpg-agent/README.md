GPG-Agent
=========

Provides for an easier use of [gpg-agent][1].

Settings
--------

### SSH-Agent Protocol Emulation

To enable SSH-Agent protocol emulation, add the following line to *zpreztorc*:

    zstyle ':prezto:module:gpg-agent' ssh-support 'yes'

Exported Variables
------------------

Please note that if you use this agent, the variables it will create and 
export (`GPG_AGENT_INFO`, `GPG_TTY`, and if you have `ssh-support` enabled, 
also `SSH_AUTH_SOCK` and `SSH_AGENT_PID`) will only be visible to other 
instances of zsh. Should you use a non-shell mail user agent such as 
thunderbird, make sure it inherits the variables. For an example of how to 
achieve this, have a look at issue #419 in the [issue tracker][2].

Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Florian Walch](https://github.com/fwalch)
  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: http://linux.die.net/man/1/gpg-agent
[2]: https://github.com/sorin-ionescu/prezto/issues
