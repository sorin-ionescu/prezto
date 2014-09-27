Firefox home profile (fhp)
======

Maintains firefox home profile '$HOME/.mozilla/firefox/abcd1234.default' on Unix
systems in a tmpfs or zram backed filesystem to get a very responsive browser,
with a tarball back up saved in '$HOME/.mozilla/firefox'.

Using a compressor like lz4 or lzo(p) make compression/decompression seamless,
so no need to remove the autoload of the function. Although, it can be commented
out to have a empty profile to start with, a 'fhp' command at the prompt will
decompress the tarball instantenously with lz4/lzo(p).

Settings
--------

This module can guess a profile to maintain by looking at the previous directory,
by looking at the previous directory, however a user can set the following:

    zstyle ':prezto:module:firefox-profile' profile 'abcd1234'
    zstyle ':prezto:module:firefox-profile' compressor 'lzop -1'
    zstyle ':prezto:module:firefox-profile' zsh-hook 'yes'

The second setting select a compressor to be used instead of default is 'lz4 -1'.

The last setting add fhp function to zsh-exit-hook, so the profile will be saved
or archived to be more precise before the shell exit.

Optimizations
-------

Just make sure to have at least '/tmp' or your system TMPDIR in a tmpfs for the
least to get any benefice of this script with something like:

    /etc/fstab: tmp	/tmp tmpfs mode=1777,size=256M,noatime 0 0

This will ensure very low latency when browsing the intertubes and removing the
profile in the fly *really* remove any trace of your browsing history because
everything is memory because firing up a 'fhp' command.

### Zram baccked File System

Aleternatively, one can pass a root directory in zram backed filesystem:

    zstyle ':prezto:module:firefox-profile' zramdir 'directory'

### Auto-saving/Auto-start profile

Of course, one can save a profile at regular time interval using a cron job or
something similar.

A profile can be auto-started by setting:

    zstyle ':prezto:module:firefox-profile' start-profile 'yes'

Customizations
-------

This module may not be needed in specif use cases... no superuser, no tty or
console devices... if sharing the same configuration files with different
users. The following can be done in that case in *zpreztorc*.

    zpmodules=(precompile environment editor prompt helper utility)
    if [[ ${TTY/tty} == $TTY ]] && [[ $EUID != 0 ]] {
      zpmodules=($zpmodules firefox-profile)
    }
    zstyle ':prezto:load' pmodule ${(qq)zpmodules}
    unset zpmodules

That snipet of code exlude console and *superuser* from having this module.

Authors
-------

  - [tokiclover](https://github.com/tokiclover)

