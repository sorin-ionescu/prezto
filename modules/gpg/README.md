# GPG

Provides for an easier use of [GPG][1] by setting up [gpg-agent][2].

## Settings

### SSH

To enable OpenSSH Agent protocol emulation, and make `gpg-agent` a drop-in
replacement for `ssh-agent`, add the following line to
_`$GNUPGHOME/gpg-agent.conf`_ or _`$$HOME/.gnupg/gpg-agent.conf`_:

```conf
enable-ssh-support
```

When OpenSSH Agent protocol emulation is enabled, this module will load the SSH
module for additional processing.

## Authors

_The authors of this module should be contacted via the [issue tracker][3]._

- [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://www.gnupg.org
[2]: https://linux.die.net/man/1/gpg-agent
[3]: https://github.com/sorin-ionescu/prezto/issues
