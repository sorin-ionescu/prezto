Utility
=======

Defines general aliases and functions.

Settings
--------

### Highlighting

If you have enabled color globally in *zpreztorc*, you may disable it for certain
commands.

To disable `ls` color, add the following line to *zpreztorc*; when coloring is
disabled, type indicators (\*, /, =>, @, =, |, %) will be appended to entries.

```sh
zstyle ':prezto:module:utility:ls' color 'no'
```

To disable `diff` highlighting, add the following line to *zpreztorc*:

```sh
zstyle ':prezto:module:utility:diff' color 'no'
```

To disable `wdiff` highlighting, add the following line to *zpreztorc*:

```sh
zstyle ':prezto:module:utility:wdiff' color 'no'
```

To disable `make` highlighting, add the following line to *zpreztorc*:

```sh
zstyle ':prezto:module:utility:make' color 'no'
```

Aliases
-------

### Disabled Spelling Correction

  - `ack`
  - `cd`
  - `cp`
  - `ebuild`
  - `gcc`
  - `gist`
  - `grep`
  - `heroku`
  - `ln`
  - `man`
  - `mkdir`
  - `mv`
  - `mysql`
  - `rm`

### Disabled File Globbing

  - `bower`
  - `fc`
  - `find`
  - `ftp`
  - `history`
  - `locate`
  - `rake`
  - `rsync` (selectively enabled for local files)
  - `scp` (selectively enabled for local files)
  - `sftp`

### General

  - `_` executes a command as another user (`sudo`).
  - `b` opens the default web browser.
  - `diffu` shorthand for `diff --unified`
  - `e` opens the default editor.
  - `mkdir` creates directories, including intermediary directories.
  - `p` opens the default pager.
  - `po` removes a directory from the stack and changes to it (`popd`).
  - `pu` changes the directory and pushes the old directory onto the stack
    (`pushd`).
  - `sa` search aliases for a word.
  - `type` displays all the attribute values of a shell parameter.

### Files and Directories

  - `ls` lists with directories grouped first (GNU only).
  - `l`  lists in one column, hidden files.
  - `ll` lists human readable sizes.
  - `lr` lists human readable sizes, recursively.
  - `la` lists human readable sizes, hidden files.
  - `lm` lists human readable sizes, hidden files through pager.
  - `lx` lists sorted by extension (GNU only).
  - `lk` lists sorted by size, largest last.
  - `lt` lists sorted by date, most recent last.
  - `lc` lists sorted by date, most recent last, shows change time.
  - `lu` lists sorted by date, most recent last, shows access time.
  - `sl` lists directory contents (`ls`).

### macOS Everywhere

  - `o` opens files and directories (`open` or `xdg-open`).
  - `get` downloads files (`curl` or `wget`).
  - `pbcopy` copies to the pasteboard (`pbcopy`, `xclip` or `xsel`).
  - `pbpaste` pastes from the pasteboard (`pbcopy`, `xclip` or `xsel`).
  - `pbc` copies to the pasteboard (`pbcopy`).
  - `pbp` pastes from the pasteboard (`pbpaste`).

### Resource Usage

  - `df` displays free disk space using human readable units (aliases to `pydf`, if installed).
  - `du` displays disk usage using human readable units.
  - `top` displays information about processes.
  - `topc` displays information about processes sorted by CPU usage.
  - `topm` displays information about processes sorted by RAM usage.

### Safe ops

By default, `cp`,`ln`, `mv` and `rm` are aliased to their interactive variants.
If this is not desired, it can be disabled by adding the following line to
*zpreztorc*:

    zstyle ':prezto:module:utility' safe-ops 'no'.

In addition, the following aliases have been added:

  - `cpi` copies files and directories interactively.
  - `lni` links files and directories interactively.
  - `mvi` moves files and directories interactively.
  - `rmi` removes files and directories interactively.

### Miscellaneous

  - `http-serve` serves a directory via HTTP.

Functions
---------

### General

  - `slit` prints columns *1, 2, 3 ... n*.

### Files and Directories

  - `cdls` changes to a directory and lists its contents.
  - `dut` displays the grand total disk usage using human readable units.
  - `find-exec` finds files and executes a command on them.
  - `mkdcd` makes a directory and changes to it.
  - `popdls` pops an entry off the directory stack and lists its contents.
  - `pushdls` pushes an entry onto the directory stack and lists its contents.
  - `noremoteglob` enable local path globbing but disable remote path globbing.

### Developer

  - `diff` highlights diff output (requires `colordiff`).
  - `make` highlights make output (requires `colormake`).
  - `wdiff` highlights wdiff output (requires `wdiff `or `Git`).

### Resource usage

  - `psu` displays user owned processes status.

### Search and Replace

  - `prep` provides a grep-like pattern search.
  - `psub` provides a sed-like pattern substitution.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][1].*

  - [Robby Russell](https://github.com/robbyrussell)
  - [Suraj N. Kurapati](https://github.com/sunaku)
  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/sorin-ionescu/prezto/issues
