SSH Envoy
=========

Provides for an easier use of [SSH][1] by setting up [ssh-agent][2], using the [envoy][3] service for systemd.

Settings
--------

### Identities

To load multiple identities, add the following line to *zpreztorc*:

    zstyle ':prezto:module:ssh-envoy:load' identities 'id_rsa' 'id_dsa' 'id_github'

If new identities are added while the agent is running, they will be added on your next login/source.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][4].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)
  - [Viktor Jackson](https://github.com/xlator)

[1]: http://www.openssh.com
[2]: http://www.openbsd.org/cgi-bin/man.cgi?query=ssh-agent&sektion=1
[3]: https://github.com/vodik/envoy
[4]: https://github.com/sorin-ionescu/prezto/issues
