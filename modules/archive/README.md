Archive
=======

Provides functions to create, list, and extract archives.

Functions
---------

  - `archive` creates an archive based on the provided archive name.
  - `lsarchive` lists the contents of one or more archives.
  - `unarchive` extracts the contents of one or more archives.

Supported Formats
-----------------

The following archive formats are supported when the required utilities are
installed:

  - *.tar.gz*, *.tgz* require `tar` (optionally `pigz`).
  - *.tar.bz2*, *.tbz* require `tar` (optionally `pbzip2`).
  - *.tar.xz*, *.txz* require `tar` with *xz* support.
  - *.tar.zma*, *.tlz* require `tar` with *lzma* support.
  - *.tar* requires `tar`.
  - *.gz* requires `gunzip`.
  - *.bz2* requires `bunzip2`.
  - *.xz* requires `unxz`.
  - *.lzma* requires `unlzma`.
  - *.Z* requires `uncompress`.
  - *.zip*, *.jar* requires `unzip`.
  - *.rar* requires `rar` (needed for `archive` support), `unrar` or `lsar` and `unar`.
  - *.7z* requires `7za`.
  - *.deb* requires `ar`, `tar`.

Additionally, if `pigz` and/or `pbzip2` are installed, `archive` will use them
over their traditional counterparts, `gzip` and `bzip2` respectively, to take
full advantage of all available CPU cores for compression.

Alternatives
------------

Specifically on macOS, [The Unarchiver][1] provides a similar command line tool
which doesn't depend on a number of other programs being installed.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][1].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)
  - [Matt Hamilton](https://github.com/Eriner)

[1]: https://theunarchiver.com/command-line
