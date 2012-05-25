Archive
=======

Provides functions to inspect and extract various archive files.

Functions
---------

### `ls-archive`

`ls-archive` inspects one or more archive files:

    ls-archive [-v] [file ...]

Options:

- `-v`, `--verbose`: List archives verbosely

### `extract`

`extract` extracts the contents of one or more archive files into the current
directory:

    extract [-r] [file ...]

Options:

- `-r`, `--remove`: Remove the archive file after extraction

Supported archive formats
-------------------------

Both functions support the following archive formats, if the corresponding
utilities are available:

- `.tar.gz`, `.tgz` (needs `tar` and `gunzip`)
- `.tar.gz2`, `.tbz` (needs `tar` and `bunzip2`)
- `.tar.zma`, `.tlz` (needs `tar` and `unlzma`)
- `.tar` (needs `tar`)
- `.gz` (needs `gunzip`)
- `.bz2` (needs `bunzip2`)
- `.xz` (needs `unxz`)
- `.lzma (needs `unlzma`)
- `.Z` (needs `uncompress`)
- `.zip` (needs `unzip`)
- `.rar` (needs `unrar`)
- `.7z` (needs `7za`)
- `.deb` (needs `ar`, `tar` and `gunzip`)

Authors
-------

*The authors of this module should be contacted via the [issue tracker][1].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/sorin-ionescu/oh-my-zsh/issues
