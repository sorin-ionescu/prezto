# Archive

Provides functions to create, list, and extract archives.

This module must be loaded _before_ the [_`completion`_][1] module so that the
provided completion definitions are loaded automatically by _`completion`_
module.

## Functions

- `archive` creates an archive based on the provided archive name.
- `lsarchive` lists the contents of one or more archives.
- `unarchive` extracts the contents of one or more archives.

## Supported Formats

The following archive formats are supported when the required utilities are
installed:

- _.tar.gz_, _.tgz_ require `tar` (optionally `pigz`).
- _.tar.bz2_, _.tbz_ require `tar` (optionally `pbzip2`).
- _.tar.xz_, _.txz_ require `tar` with _xz_ support.
- _.tar.zma_, _.tlz_ require `tar` with _lzma_ support.
- _.tar_ requires `tar`.
- _.gz_ requires `gunzip`.
- _.bz2_ requires `bunzip2`.
- _.xz_ requires `unxz`.
- _.lzma_ requires `unlzma`.
- _.Z_ requires `uncompress`.
- _.zip_, _.jar_ requires `unzip`.
- _.rar_ requires `rar` (needed for `archive` support), `unrar` or `lsar` and `unar`.
- _.7z_ requires `7za`.
- _.deb_ requires `ar`, `tar`.

Additionally, if `pigz` and/or `pbzip2` are installed, `archive` will use them
over their traditional counterparts, `gzip` and `bzip2` respectively, to take
full advantage of all available CPU cores for compression.

## Alternatives

Specifically on macOS, [The Unarchiver][2] provides a similar command line tool
which doesn't depend on a number of other programs being installed.

## Authors

_The authors of this module should be contacted via the [issue tracker][3]._

- [Sorin Ionescu](https://github.com/sorin-ionescu)
- [Matt Hamilton](https://github.com/Eriner)

[1]: ../completion#readme
[2]: https://theunarchiver.com/command-line
[3]: https://github.com/sorin-ionescu/prezto/issues
