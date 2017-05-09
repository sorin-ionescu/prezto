Browser-Home-Profile (BHP)
======

Maintains web-browser home profile `$HOME/.{,cache/}PROFILE` on Unix
systems in a tmpfs (or zram backed filesystem) to get a very responsive browser,
with an optional tarball back up.

Using a compressor like lz4 or lzo(p) make compression/decompression seamless,
so no need to remove the autoload of the function. Additionally, the tarball
back up can be decompressed after set up by setting up an option.

Settings
--------

This module can guess a profile to maintain by looking at the previous directory,
by looking at the previous directory, however a user can set the following:

    zstyle ':prezto:module:BHP' browser 'BROWSER'
    zstyle ':prezto:module:BHP' profile 'abcd1234'
    zstyle ':prezto:module:BHP' compressor 'lzop -1'
    zstyle ':prezto:module:BHP' zsh-hook 'yes'

Selecting a compressor to be used instead of the default ('lz4 -1') can be set.
Second setting would select a specific profile, e.g. firefox specific one if many
profiles are available. Last one would add a function to zshexit hook,
so the profile will be saved or archived to be more precise before the shell exit.

Optimizations
-------

Just make sure to have at least `/tmp` or your system TMPDIR in a tmpfs for the
least to get any benefice with something like the following in fstab(5):

    tmp	/tmp tmpfs mode=1777,size=256M,noatime 0 0

This will ensure very low latency when browsing the intertubes and removing the
profile in the fly *really* remove any trace of your browsing history because
everything is in memory, but firing up a `bhp` command will nullify this effect.

### Auto-saving/Auto-start profile

Of course, one can save a profile at regular time interval using a cron job or
atd when need be. Lastly, a profile can be auto-started by setting:

    zstyle ':prezto:module:BHP' decompress 'yes'

Customizations
-------

This module may not be needed in specif use cases... no superuser, no tty or
console devices... if sharing the same configuration files with different
users. The following can be done in that case in *zpreztorc*.

    zpmodules=(environment editor prompt helper utility precompile)
    if [[ ${TTY/tty} == $TTY ]] && [[ $EUID != 0 ]] {
      zpmodules=($zpmodules browser-home-profile)
    }
    zstyle ':prezto:load' pmodule $zpmodules
    unset zpmodules

That snipet of code exlude console and *superuser* from having this module.

Authors
-------

  - [tokiclover](https://github.com/tokiclover)

