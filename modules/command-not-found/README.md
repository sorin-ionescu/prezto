# Command-Not-Found

When you try to use a command that is not available locally, searches the
package manager for a package offering that command and suggests the proper
install command.

Debian and Arch Linux based distributions use the [`command-not-found`][1] tool.

macOS uses Homebrew's [`command-not-found` clone][2]. This module will
automatically load it without needing to manually source `handler.sh` from
`.zshrc` per the [instructions][3].

Note: Prior to [Homebrew 4.6.12][4], you may have also needed to tap the
[`command-not-found` Homebrew repository][5]. This will still work as a
fallback when the `command-not-found` handler can't be detected in Homebrew
core, but the repository has been deprecated and may print a warning. After
upgrading Homebrew, it can be untapped.

## Authors

_The authors of this module should be contacted via the [issue tracker][6]._

- [Joseph Booker](https://github.com/sargas)
- [Indrajit Raychaudhuri](https://github.com/indrajitr)

[1]: https://code.launchpad.net/command-not-found
[2]: https://docs.brew.sh/Command-Not-Found
[3]: https://docs.brew.sh/Command-Not-Found#install
[4]: https://github.com/Homebrew/brew/releases/tag/4.6.12
[5]: https://github.com/Homebrew/homebrew-command-not-found
[6]: https://github.com/sorin-ionescu/prezto/issues
