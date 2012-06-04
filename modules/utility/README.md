Utility
=======

Defines general aliases and functions.

Settings
--------

### Highlighting

If you have enabled color globally in *zshrc*, you may disable it for certain
commands.

To disable `ls` color, add the following line to *zshrc*. If coloring is
disabled, type indicators (*, /, =>, @, |) will be appended to entries.

    zstyle ':omz:module:utility:ls' color 'no'

To disable `diff` highlighting, add the following line to *zshrc*:

    zstyle ':omz:module:utility:diff' color 'no'

To disable `wdiff` highlighting, add the following line to *zshrc*:

    zstyle ':omz:module:utility:wdiff' color 'no'

To disable `make` highlighting, add the following line to *zshrc*:

    zstyle ':omz:module:utility:make' color 'no'

Aliases
-------

### The ls Family

  - `ls` lists with directories grouped first (GNU only).
  - `l`  lists in one column, hidden files.
  - `ll` lists human readable sizes.
  - `lr` lists recursively.
  - `la` lists hidden files.
  - `lp` lists through pager.
  - `lx` lists sorted by extension (GNU only).
  - `lk` lists sorted by size, largest last.
  - `lt` lists sorted by date, most recent last.
  - `lc` lists sorted by date, most recent last, shows change time.
  - `lu` lists sorted by date, most recent last, shows access time.
  - `sl` is aliased to ls.

### General

  - `_` is aliased to sudo.
  - `b` opens the default web browser.
  - `e` opens the default editor.
  - `p` opens the default pager.
  - `po` removes a directory from the stack and changes to it.
  - `pu` adds the current directory to the stack and changes to a directory.
  - `type` displays all attribute values of a shell parameter.

### Spelling Correction Disabled

  - `ack`
  - `cd`
  - `cp`
  - `ebuild`
  - `gcc`
  - `gist`
  - `heroku`
  - `ln`
  - `man`
  - `mkdir`
  - `mv`
  - `mysql`
  - `rm`
  - `scp`

### File Globbing Disabled

  - `fc`
  - `find`
  - `history`
  - `locate`
  - `rake`

### Mac OS X

  - `o` is alised to `open` on Mac OS X and `xdg-open` on non Mac OS X.
  - `get` downloads a file using `curl` or `wget`.
  - `pbcopy` uses xclip or xsel on non Mac OS X.
  - `pbpaste` uses xclip or xsel on non Mac OS X.
  - `pbc` is alised to `pbcopy`.
  - `pbp` is alised to `pbpaste`.

### Resource Usage

  - `df` displays free disk space using human readable units.
  - `du` displays disk usage using human readable units.
  - `top` displays information about processes (alised to `htop`, if installed).
  - `topc` displays information about processes sorted by CPU usage (`htop` not
    installed).
  - `topm` dispalys information about processes sorted by RAM usage (`htop` not
    installed).

### Misecellaneous

  - `http-serve` serves a directory via HTTP.
  - `pmine` displays user owned processes status.

Functions
---------

### General

  - `slit` prints columns 1 2 3 ... n.

### Files and Directories

  - `cdls` changes to a directory and lists its contents.
  - `duh` displays human readable disk usage.
  - `find-exec` finds files and executes a command on them.
  - `mkdcd` makes a directory and changes to it.
  - `popdls` pops an entry off the directory stack and lists its contents.
  - `pushdls` pushes an entry onto the directory stack and lists its contents.

### Developer

  - `diff` highlights diff output (requires `colordiff` or `Git`).
  - `make` highlights make output (requires `colormake`).
  - `wdiff` highlights wdiff output (requires `wdiff `or `Git`).

Authors
-------

*The authors of this module should be contacted via the [issue tracker][1].*

  - [Robby Russell](https://github.com/robbyrussell)
  - [Suraj N. Kurapati](https://github.com/sunaku)
  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/sorin-ionescu/oh-my-zsh/issues

