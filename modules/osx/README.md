# OSX

Defines [macOS][1] aliases and functions.

This module must be loaded _before_ the [_`completion`_][2] module so that the
provided completion definitions are loaded automatically by _`completion`_
module.

## Settings

### Dash Keyword

To change the keyword used by `mand` to open man pages in [_Dash.app_][3] from
its default value of 'manpages', add the following line in
_`${ZDOTDIR:-$HOME}/.zpreztorc`_ and replace the **keyword** with the one
configured in [_Dash.app_][3].

```sh
zstyle ':prezto:module:osx:man' dash-keyword 'keyword'
```

## Aliases

- `cdf` changes the current working director to the current _Finder_ directory.
- `pushdf` pushes the current working directory onto the directory queue and
  changes the current working director to the current _Finder_ directory.

## Functions

- `mand` opens _man_ pages in [_Dash.app_][3].
- `manp` opens _man_ pages in _Preview.app_.
- `pfd` prints the current _Finder_ directory.
- `pfs` prints the current _Finder_ selection.
- `tab` creates a new tab (works in both _Terminal_ and [_iTerm.app_][4]).
- `ql` previews files in Quick Look.
- `osx-rm-dir-metadata` deletes _`.DS_Store`_, _`__MACOSX`_ cruft.
- `osx-ls-download-history` displays the macOS download history.
- `osx-rm-download-history` deletes the macOS download history.

## Authors

_The authors of this module should be contacted via the [issue tracker][5]._

- [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://www.apple.com/macos/
[2]: ../completion#readme
[3]: https://kapeli.com/dash
[4]: https://www.iterm2.com/
[5]: https://github.com/sorin-ionescu/prezto/issues
