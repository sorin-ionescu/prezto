OSX
===

Defines [Mac OS X][1] aliases and functions.

Settings
--------

### Dash Keyword

To change the keyword used by `mand` to open man pages in [_Dash.app_][2] from
its default value of 'manpages', add the following line in *zpreztorc* and
replace the **keyword** with the one configured in [_Dash.app_][2].

```sh
zstyle ':prezto:module:osx:man' dash-keyword 'keyword'
```

Aliases
-------

  - `cdf` changes the current working director to the current _Finder_
    directory.
  - `pushdf` pushes the current working directory onto the directory queue and
    changes the current working director to the current _Finder_ directory.

Functions
---------

  - `mand` opens _man_ pages in [_Dash.app_][2].
  - `manp` opens _man_ pages in _Preview.app_.
  - `pfd` prints the current _Finder_ directory.
  - `pfs` prints the current _Finder_ selection.
  - `tab` creates a new tab (works in both _Terminal_ and [_iTerm_][3]).
  - `ql` previews files in Quick Look.
  - `osx-rm-dir-metadata` deletes .DS\_Store, \_\_MACOSX cruft.
  - `osx-ls-download-history` displays the Mac OS X download history.
  - `osx-rm-download-history` deletes the Mac OS X download history.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][4].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: http://www.apple.com/macosx/
[2]: http://kapeli.com/dash
[3]: http://www.iterm2.com/
[4]: https://github.com/sorin-ionescu/prezto/issues
