# Helper

Provides helper functions for developing modules.

## Functions

- `add-zsh-trap` adds a function name to a list to be called when a trap is
  triggered.
- `is-autoloadable` checks if a file can be autoloaded by trying to load it in
  a subshell.
- `is-callable` checks if a name is a command, function, or alias.
- `is-true` checks a boolean variable for "true".
- `coalesce` prints the first non-empty string in the arguments array.
- `is-darwin` checks if running on macOS Darwin.
- `is-linux` checks if running on Linux.
- `is-bsd` checks if running on BSD.
- `is-cygwin` checks if running on Cygwin (Windows).
- `is-termux` checks if running on Termux (Android).

## Authors

_The authors of this module should be contacted via the [issue tracker][1]._

- [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/sorin-ionescu/prezto/issues
