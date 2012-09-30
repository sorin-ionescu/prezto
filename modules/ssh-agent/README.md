SSH-Agent
=========

Provides for an easier use of [ssh-agent][1].

Settings
--------

### Agent Forwarding

To enable SSH-Agent forwarding, add the following line to *zpreztorc*:

    zstyle ':prezto:module:ssh-agent' forwarding 'yes'

### Identities

To load multiple identities, add the following line to *zpreztorc*:

    zstyle ':prezto:module:ssh-agent' identities 'id_rsa' 'id_rsa2' 'id_github'

Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Robby Russell](https://github.com/robbyrussell)
  - [Theodore Robert Campbell Jr](https://github.com/trcjr)
  - [Joseph M. Reagle Jr.](https://github.com/reagle)
  - [Florent Thoumie](https://github.com/flz)
  - [Jonas Pfenniger](https://github.com/zimbatm)
  - [Gareth Owen](https://github.com/gwjo)
  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: http://www.openbsd.org/cgi-bin/man.cgi?query=ssh-agent&sektion=1
[2]: https://github.com/sorin-ionescu/prezto/issues

