# Command-Not-Found

When you try to use a command that is not available locally, searches the
package manager for a package offering that command and suggests the proper
install command.

Debian and Arch Linux based distributions use the [`command-not-found`][1] tool.

macOS uses Homebrew's [`command-not-found` clone][2]. Note that unless you have
a recent version of Homebrew installed, you might also need to tap the
`command-not-found` Homebrew repository [following the instructions][3].

## Authors

_The authors of this module should be contacted via the [issue tracker][4]._

- [Joseph Booker](https://github.com/sargas)
- [Indrajit Raychaudhuri](https://github.com/indrajitr)

[1]: https://code.launchpad.net/command-not-found
[2]: https://github.com/Homebrew/homebrew-command-not-found
[3]: https://github.com/Homebrew/homebrew-command-not-found#install
[4]: https://github.com/sorin-ionescu/prezto/issues
