# Configuration Files

Zsh has several system-wide and user-local configuration files.

Prezto has one user-local configuration file.

System-wide configuration files are installation-dependent but are installed
in *`/etc`* by default.

User-local configuration files have the same name as their global counterparts
but are prefixed with a dot (hidden). Zsh looks for these files in the path
stored in the `$ZDOTDIR` environment variable. However, if said variable is
not defined, Zsh will use the user's home directory.

## File Descriptions

The [configuration files][1] are read in the following order:

01. *`/etc/zshenv`*
02. *`${ZDOTDIR:-$HOME}/.zshenv`*
03. *`/etc/zprofile`*
04. *`${ZDOTDIR:-$HOME}/.zprofile`*
05. *`/etc/zshrc`*
06. *`${ZDOTDIR:-$HOME}/.zshrc`*
07. *`${ZDOTDIR:-$HOME}/.zpreztorc`*
08. *`/etc/zlogin`*
09. *`${ZDOTDIR:-$HOME}/.zlogin`*
10. *`${ZDOTDIR:-$HOME}/.zlogout`*
11. *`/etc/zlogout`*

### zshenv

This file is sourced by all instances of Zsh, and thus, it should be kept as
small as possible and should only define environment variables.

### zprofile

This file is similar to *zlogin*, but it is sourced before *zshrc*. It was added
for [KornShell][2] fans. See the description of *zlogin* below for what it may
contain.

*zprofile* and *zlogin* are not meant to be used together but can be done so.

### zshrc

This file is sourced by interactive shells. It should define aliases, functions,
shell options, and key bindings.

### zpreztorc

This file configures Prezto.

### zlogin

This file is sourced by login shells after *zshrc*. Thus, it should contain
commands that need to execute at login. It is usually used for messages such as
[*fortune*][3], [*msgs*][4], or for the creation of files.

This is not the file to define aliases, functions, shell options, and key
bindings. It should not change the shell environment.

### zlogout

This file is sourced by login shells during logout. It should be used for
displaying messages and for deletion of files.

## Authors

*The authors of these files should be contacted via the [issue tracker][5].*

- [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: http://zsh.sourceforge.net/Intro/intro_3.html#SEC3
[2]: https://www.kornshell.com
[3]: https://en.wikipedia.org/wiki/Fortune_(Unix)
[4]: https://www.manpagez.com/man/1/msgs
[5]: https://github.com/sorin-ionescu/prezto/issues
