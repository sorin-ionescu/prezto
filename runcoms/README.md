Configuration Files
===================

Zsh has several system-wide and user-local configuration files.

Prezto has one user-local configuration file: `.zpreztorc`

System-wide configuration files are installation-dependent but are installed
in `/etc` by default.

User-local configuration files have the same name as their global counterparts
but are prefixed with a dot (hidden). Zsh looks for these files in the path
stored in the `$ZDOTDIR` environment variable. However, if said variable is
not defined, Zsh will use the user's home directory. This is found on the
config scripts as `${ZDOTDIR:-$HOME}` and is a `zsh` idiomatic way of doing
something like this:


```bash
if [[ -n $ZDOTDIR ]]; then
   DOTFILES_PATH=$ZDOTDIR
else
  DOTFILES_PATH=$HOME
fi
source $DOTFILES_PATH/.zshenv

# pro tip! set $ZDOTDIR on /etc/zshenv to ~/.zconf to have all runcoms 
# in ~./.zconf instead of cluttering your $HOME! =) (mkdir ~/.zconf first!)
```
the above  is the same as:  `source ${ZDOTDIR:-$HOME}/.zshenv` 


File Descriptions
-----------------


| system/site config </br> (`/etc/zsh/**`) [2] | User configuration </br>(`${ZDOTDIR:-$HOME}`) [3] | Purpose                                                                                                                                                                                                    | stuff that usually goes there, and notes                                                                                                                                                                                                       |
|----------------------------------------------|---------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `/zshenv` [1]                                |                                                   | system provided minimal environment                                                                                                                                                                        | Should be minimal set ZDOTDIR, minimal environment. system paths                                                                                                                                                                               |
|                                              | `.zshenv`                                         | user environment overrides non-interactive, non-login shells (when invoked via _shebang_ in a script or via `zsh -c [script]` or when invoked by `make`                                                    | Personal environment overrides, such as `MANPATH`, `TERM`, `fpath`  (*non interactive scripts should have their environment completly set up here* )                                                                                           |
| `/zprofile`                                  |                                                   | system profile for login shells (`zsh -lsi`  `zsh -`` or via _ssh forced command_ )                                                                                                                        | Required system paths for remote interaction,  site `fpath`,  site `$LOCALE`, `$LANG.`                                                                                                                                                         |
|                                              | `.zprofile`                                       | personal preferences for interactive login shells                                                                                                                                                          | your preferred `$LOCALE`, `$LANG`,  `readlne` config, `cdpath`, session managers, additional `fpath` user functions, login shells (but non necessarily **ineractive** as when invoked via _ssh remote cmd_ ) will read config up to this point |
| `/zshrc`                                     |                                                   | system provided startup script, for interactive shells, (local shells that live in an `XTerm`, `URxvt`, `gnome-terminal`) or subshells (like running `xterm` from the command prompt of a _login xterm_,   | site login accounting, security monitors, site command logging policy                                                                                                                                                                          |
|                                              | `.zshrc`                                          | user customization of their *interactive* environment for terminals                                                                                                                                        | sourcing custom shell additions (`gcloud.comp.inc`), custom user frameworks (**zprezto** is invoked here), additional path required by custom software installed in `/opt/`                                                                    |
| `/zlogin`                                    |                                                   | additional customization for interactive **login** shells, such as those accessed via ssh                                                                                                                  | `tmux attach` to existing session                                                                                                                                                                                                              |
|                                              | `.zlogin`                                         | user script for *login shell startup* (this shell is a session leader, and allocates a `ptty`)                                                                                                             | aliases, keybindings, personal startup programs, time tracking apps, session managers, quote of the day, fortunes                                                                                                                              |
| ... your shell..                             | ..session...                                      | ..happens...                                                                                                                                                                                               | ..here ...                                                                                                                                                                                                                                     |
|                                              | `.zlogout`                                        | personal cleanup tasks                                                                                                                                                                                     | unmounting your *fuse* personal fylesystems, async encryption of sensitive directoriesm backup kickoff, setting personal `crontabs` or `at` tasks, logging checout to your time tracking software, fortune to say goodbye.                     |
| `/zlogout` [1]                               |                                                   | site cleanup tasks                                                                                                                                                                                         | site command logging policy stop, login accounting records, security context spindown, etc,                                                                                                                                                    |


[1]: These files are always triggered, regardless of settings
[2]: These are provided by your distribution and/or modified by your site
admin. they will run only if `GLOBAL_RCS` is set (std) 
[3]: Here is where you add your preferences for different kinds of shells,
will run only if `RCS` is set (std)

## Make Prezto your own: Configuration and personal preferences

That is quite a few files to configure a shell. Why so many? Mostly to
accomodate different roles for shell software. Automated Shell scripts
probably don't need aliases or keybindings, but a human user will certainly
appreciate it, as shortcuts can make you more productive. When Logging via an
XTerminal or remotely logging in using ssh may look like similar tasks, but
resource and configuration-wise they are worlds appart. So, so far we already
have 4 possible scenarios that require very different configuration on your
shell. doing it manually is cumbersome, time consuming  and error prone, Enter
_Prezto_: Instantly awesome `zsh` ready to use no matter how you connect or
use your computer. It even offers _feature parity_ between different OSs, as
long as they run `zsh`

So, depending on the way you are connected or using yor computer, you'd need
different sets of configuration, Since each kind of session will only read up
to a certain point in the `runcoms` chain, it is important to place the
correct configuration directves on the appropriate files, this way we can have
speedy shells that don't waste a lot of energy, or can have all kinds of user
optimization such as aliases and keymaps

Prezto leverages these good design decisions to provide a great, fast,
featureful user experience, and to avoid consuming any more resources than
necessary. So, with this in mind you have the flexibility to adapt the `zsh`
features that prezto surfaces to your workload and tastes, ranging from the
prompt theme, shortcut keys, favorite editor and pager, aliases and even
syntax highlighting.! **Prezto is designed in such a way to allow you to
configure other aspects of your shell in the appropriate files wthout breaking
the framework** or forcing you to write your preferences in a particular
plugin structure. In the end, its a matter of editing one ofthe files
mentioned above.

That being said, you can use the runcoms files _as-is_, replacing your old
files with prezto's baseline, or you can merge your customizations with
prezto's runcoms.!

When you update your distribution with `git`, be careful not to clobber your
changes if you decided to use the files as-is. Another way of maintaining your
configuration is to copy prezto's runcoms instead of symlinking them, and keep
track of them independently of the core prezto distribution. If you're just
starting with `zsh`, the first approach is faster and easier to get you going,
while copying and merging the runcoms independently gives you *maximum
flexibility for advanced use* cases.

For a more detailed discussion on the zsh startup process and how prezto
integrates with it, see *further reading* below.


## Common pitfalls:

1. if prezto and some of your settings are loaded, but others are not;
make sure you are running an *interactive login shell* (you should have
a `tty` allocated, visible on the `w` list) and the `$TTY` variable should 
be set, if that is not the case, check the above discussion, you can 
'replace' your shell _in situ_ by issuing the command `exec zsh -l`

you can configure your graphical environment or `tmux` to lauch nteractive
login sessions by default: here are some examples:

```sh
#tmux.conf:
set -g default-command 'exec /usr/bin/zsh -ls' # make zsh a login shell
set -g default-shell '/usr/bin/zsh -ls'        # USE ONLY ONE OF THESE TWO 
                                               # LINES! or you may end up 
                                               # with nested shells
```
Here is an examplefor *i3wm* on ubuntu

```sh
#i3wm.conf:
set $XTERM_CMD='xterm -e zsh -ls`
bind $mod+x $XTERM_CMD

2. if you notice that none of your settings are loaded, check that 
`/etc/zshenv` does not disable them. In any case

```bash
setopt global_rcs
setopt rcs
```

in `/etc/zshenv` should set them both. This issue would be extremely rare.



Authors
-------

*The authors of these files should be contacted via the [issue tracker][4].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

Further reading
----------------

[1]: http://www.kornshell.com
[2]: http://en.wikipedia.org/wiki/Fortune_(Unix)
[3]: http://www.manpagez.com/man/1/msgs
[4]: https://github.com/sorin-ionescu/prezto/issues

