Cowbuilder
==========

Start interactive cowbuilder session for debugging purposes.
It allows for easy entering and saving changes in the chroots.

The shell function `cb-shell` is based on the notes from the
[Debian packaging symposium][1].

Cowbuilder is started using sudo with the option to preserve the
environment. This allows one to configure cowbuilder and pbuilder
using *~/.pbuilderrc*.

Aliases
-------

- `cb-shell-save` start `cb-shell` and saves changes on exit.

Functions
---------

- `cb-shell` start shell inside cowbuilder chroot.

Examples
--------

Start cowbuilder for distribution jessie.
When environment variable `DIST` is present, the `-d` argument can be
omitted.

    $ cb-shell -d jessie
    $ DIST=jessie cb-shell

To make changes persistent start the cowbuilder shell with
option `-s` or use the alias `cb-shell-save`.

    $ cb-shell -d jessie -s
    $ cb-shell-save -d jessie

Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Olaf Conradi](https://github.com/oohlaf)

[1]: http://jpvanoosten.nl/blog/2012/12/22/notes-from-the-debian-packaging-symposium/
[2]: https://github.com/sorin-ionescu/prezto/issues
