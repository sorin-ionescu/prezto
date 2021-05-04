# OSX

Defines [macOS][1] aliases and functions.

## Settings

### Dash Keyword

To change the keyword used by `mand` to open man pages in [*Dash.app*][2] from
its default value of 'manpages', add the following line in *~/.zpreztorc* and
replace the **keyword** with the one configured in [*Dash.app*][2].

```sh
zstyle ':prezto:module:osx:man' dash-keyword 'keyword'
```

## Aliases

- `cdf` changes the current working director to the current *Finder* directory.
- `pushdf` pushes the current working directory onto the directory queue and
  changes the current working director to the current *Finder* directory.

## Functions

- `mand` opens _man_ pages in [*Dash.app*][2].
- `manp` opens _man_ pages in *Preview.app*.
- `pfd` prints the current *Finder* directory.
- `pfs` prints the current *Finder* selection.
- `tab` creates a new tab (works in both _Terminal_ and [*iTerm.app*][3]).
- `ql` previews files in Quick Look.
- `osx-rm-dir-metadata` deletes *.DS_Store*, *__MACOSX* cruft.
- `osx-ls-download-history` displays the macOS download history.
- `osx-rm-download-history` deletes the macOS download history.

## Authors

*The authors of this module should be contacted via the [issue tracker][4].*

- [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://www.apple.com/macos/
[2]: https://kapeli.com/dash
[3]: https://www.iterm2.com/
[4]: https://github.com/sorin-ionescu/prezto/issues
