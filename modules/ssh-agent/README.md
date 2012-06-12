SSH-Agent
=========

Setup ssh-agent 

Settings
--------

### Agent Forwarding

To enable ssh-agent forwarding, add the following line to *zshrc*:

    zstyle ':omz:module:ssh-agent' forwarding 'yes'

### Identities

To load multiple identities, add the following line to *zshrc*:

    zstyle ':omz:module:ssh-agent' identities 'id_rsa' 'id_rsa2' 'id_github'

Authors
-------

*The authors of this module should be contacted via the [issue tracker][1].*

  - [Robby Russell](https://github.com/robbyrussell)
  - [Theodore Robert Campbell Jr](https://github.com/trcjr)
  - [Sorin Ionescu](https://github.com/sorin-ionescu)
  - [Joseph M. Reagle Jr.](https://github.com/reagle)
  - [Florent Thoumie](https://github.com/flz)
  - [Jonas Pfenniger](https://github.com/zimbatm)
  - [Gareth Owen](https://github.com/gwjo)

[1]: https://github.com/sorin-ionescu/oh-my-zsh/issues

