# SSH

Provides for an easier use of [SSH][1] by setting up [_ssh-agent_][2].

## Settings

### Identities

To load multiple identities, add the following line to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_:

```sh
zstyle ':prezto:module:ssh:load' identities 'id_rsa' 'id_dsa' 'id_github'
```

## Authors

_The authors of this module should be contacted via the [issue tracker][3]._

[Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://www.openssh.com
[2]: https://www.openbsd.org/cgi-bin/man.cgi?query=ssh-agent&sektion=1
[3]: https://github.com/sorin-ionescu/prezto/issues
