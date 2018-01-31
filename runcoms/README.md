Configuration Files
===================

Zsh has several system-wide and user-local configuration files.

Prezto has one user-local configuration file.

System-wide configuration files are installation-dependent but are installed
in */etc* by default.

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

#pro tip! set $ZDOTDIR on /etc/zshenv to ~/.zconf to have all runcoms live there instead of cluttering ~ =)
```
the above  is the same as:  `source ${ZDOTDIR:-$HOME}/.zshenv` is equivalent to:


Sourcing of these confguration files depends mostly on 2 things:

1. Whether you are running a *login shell*
2. Whether the `RCS` and `GLOBAL_RCS` options are set. They are usually
   set by default


File Descriptions
-----------------


| always runs      | when `GLOBAL_RCS` is set                | when `RCS` is set                 | Purpose                                                                                                                                                                                                  | stuff that usually goes there, and notes                                                                                                                                                                                         |
|------------------|-----------------------------------------|-----------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `/etc/zshenv`    |                                         |                                   | system provided minimal environment                                                                                                                                                                      | Always runs! should be minimal  set ZDOTDIR, minimal environment. system paths
|                  |                                         | `${ZDOTDIR:-$HOME}/.zshenv`       | user environment overrides non-interactive, non-login shells (when invoked via shebang in a script or via `zsh -c [script]` or when invoked by `make`                                                    | personal environment overrides, such as `MANPATH`, `TERM`, `fpath`  *non interactive scripts should have their environment completly set up here* )
|                  | `/etc/zshprofile`                       |                                   | system profile for login shells (`zsh -ls  zsh - or via _ssh forced command_`)                                                                                                                           | minimal system paths for remote interaction,  site `fpath`,  site `$LOCALE`, lang.
|                  |                                         | `${ZDOTDIR:-$HOME}/.zshprofile`   | personal preferences for interactive login shells                                                                                                                                                        | your preferred `$LOCALE`, `$LANG`,  `readlne` config, `cdpath`, session managers, additional `fpath` ) login shells (but non necessarily **ineractive** as when invoked via _ssh remote cmd_ ) will read config up to this point
|                  | `/etc/zshrc`                            |                                   | system provided startup script, for interactive shells, (local shells that live in an `XTerm`, `URxvt`, `gnome-terminal`) or subshells (like running `xterm` from the command prompt of a _login xterm_, | site login accounting, security monitors, site command logging policy
|                  |                                         | `${ZDOTDIR:-$HOME}/.zshrc`        | user customization of their *interactive* environment for terminals                                                                                                                                      | sourcing custom completions (`gcloud.comp.inc`), custom user frameworks (zprezto is invoked here), additional path required by custom software installed in `/opt/*`
|                  | `/etc/zshlogin`                         |                                   | additional customization for interactive **login** shells, such as those accessed via ssh                                                                                                                | tmux attach to existing session
|                  |                                         | `${ZDOTDIR:-$HOME}/.zshlogin`     | user script for *login shell startup* (this shell is a session leader, and allocates a `ptty`                                                                                                            | aliases, keybindings, personal startup programs, time tracking apps, session managers, quote of the day, fortunes
| ..               | ... your shell session happens here ... |
|                  |                                         | `${ZDOTDIR:-$HOME}/.zshlogout`    | personal cleanup tasks                                                                                                                                                                                   | setting personal `crontabs` or `at` tasks, logging checout to your time tracking software, fortune to say goodbye.
| `/etc/zshlogout` |                                         |                                   | site cleanup tasks                                                                                                                                                                                       | site command logging policy stop, login accounting records, security context spindown, etcThe configuration files are read in the following order:

Discussion
----------

There are several places to add personal configuration and preferences in 
the files already provided for startup, it’s just a matter of placing them  
in the appropriate place. Most of them should probably go in 
`${ZDOTDIR:-$HOME}/.zshrc` **before** invoking zprezto init, to choose 
the modules that should get loaded, and using the appropriate `zstyle` 
calls form preferences (`zstyle` is a kind of _registry_ for shell configuration
native to `zsh`)


Any tweaks to prezto’s behavior should go **after** invoking zprezto init 
in `zshrc` or, in `${ZDOTDIR:-$HOME}/.zlogin` . Note however that the
`zlogin` (sysem or user) files will be sourced **only for login shells**. 

That means, when logging in to a remote system via ssh for example or 
when calling say, `XTerm` or your favorite emulator by specifying you 
want a **login** shell (by calling `zsh -ls` instead of plain `zsh`). 
Otherwise, the `zlogin` files are ignored. 

Also, note that another difference between interactive login shells and 
plain interactive shells, is that, besides sourcing `zlogin` files, 
interactive login shells also allocate a pseudo-tty (you can see them when
invoking `w`. Login shells have a pty assigned, while interactive non-login
shells don't.)

Why is this designed this way? because login shells are assumed to be 
the main point of interaction with a user  while non login shells would 
be spawned as _sub-shells_ of a *login shell* , when executing scripts 
that call `zsh` as a command interpreter, for example, when the *shebang* is 
`#!/usr/bin/env zsh` or equivalent. 

When launching a new terminal within an *X11* session, it is safe to 
assume that you are *already logged in* so any terminal emulator will 
launch an *interactive-non-login* shell. Which is, _per specification_ 
the correct behavior, but not the behavior most users *expect*.


There is a reason for this _specified_ behaviour:  `zlogin` files should 
be used for *interaction oriented settings* such as custom completion, 
keybindings, `tmux` session setup, and most `alias`es.

The advantage of grouping all interaction oriented settings in 
`.zlogin` is that non-interactive shells (executing scripts via 
`zsh -c [script]`, the *shebang*, subshells or `make` invoked shells, 
for example) will not be burdened by additional config settings making 
them faster and more responsive, as _keybindings_ and _aliases_ are not 
even loaded at startup, after all, an _executable non-interactive script_, 
should never call on keybindings or aliases (assuming they were  properly
written to be portable)


Finally, it is a common source of frustration amongst graphical environment 
users, to spend some time adding their customizations to `.zlogin` only 
to see them ignored when launching a new `XTerm` or `tmux` pane. 

This can be solved by calling (or aliasing) your terminal emulator with 
the required option to invoke a *login* shell, for `XTerm`, for example 
you would call `xterm -e zsh -ls` on tmux you may add one of the following 
lines to your `.tmux.conf`:

```config
#tmux.conf:

        set -g default-command 'exec /usr/bin/zsh -ls' #this will make zsh a login shell AND a session leader
        set -g default-shell '/usr/bin/zsh -ls'
```

Here is an examplefor *i3wm* on ubuntu
```bash

#i3wm.conf:
        ...
        set $XTERM_CMD='xterm -e zsh -ls`
        bind $mod+x $XTERM_CMD
        ...
```
if you want to replace your non-login shell on your emulator with a brand-new 
shiny *login* shell you can issue `exec zsh -ls` at your command prompt. 
Doing this, however **will not write that terminal’s history to file** unless
`INC_APPEND_HISTORY` was set when you strted the shell 

`INC_APPEND_HISTORY` makes `zsh` append history entries as soon as the 
command is finished. *zprezto* helpfuly sets `INC_APPEND_HISTORY`, 
`INC_APPEND_HISTORY_TIME`, and `SHARE_HISTORY` which makes your history 
available immediately from different terminals on command completion, 
and records execution time on the history file. Pretty neat, huh?)

You could tack-on all interactive customizations on `zshrc` but you will
end up with bloated shells on non-interactive environments. Perhaps desktop 
workstation users will not notice any difference, but in resource-constrained 
environments it may be significant in terms of execution time and energy 
consumption (v.gr when running a Raspberry PI on batteries or on a cell 
phone environment such as `termux`)

You may be thinking... why is `zpreztorc` not invoked on `.zlogin` instead 
of `.zshrc`? I believe it was a wise design decision, in order to 
eliminate complexity by having the whole of *prezto* configured and 
launched from a single point, as some of the modules need to be sourced 
early in the startup process, `editor` and `gnu-utls` come to mind. 
If invoked later on the startup, such as would be the case in `.zlogin` 
would makee it easier to conflict with stuff users may add on `zshrc`. 
Also, it avoids **not being loaded** and causing user frustration if 
the user launches *non-login shells* from graphical environments, as 
discussed above.

## Conclusion

For customization of your environment, use your `.zshrc` after zprezto 
has been invoked, or before to remove or activate packages via `zstyle` 
calls 
 
 or

use `.zshlogin` to override or tweak zprezto behavior. there is also
`.zpreztorc` but you may want to leave that one alone.

In any case, this question is often brought up by users that use the 
distributed *runcoms* **as is** which is a terrible idea, since doing
`git pull` to update your distribution will clobber your customizations.

it’s a better idea to *copy* the distributed *runcoms* to your `$ZDOTDIR` a
nd merge any changes an update may bring, if any (they are usually 
confined to `.zpreztorc`) 



Troubleshooting
---------------

1. if prezto and some of your settings are loaded, but others are not;
make sure you are running an *interactive login shell* (you should have
a tty allocated, visible on the `w` list) and the `$TTY` variable should 
be set, if that is not the case, check the above discussion, you can 
'replace' your shell _in situ_ by issuing the command `exec zsh -l`


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

[1]: http://www.kornshell.com
[2]: http://en.wikipedia.org/wiki/Fortune_(Unix)
[3]: http://www.manpagez.com/man/1/msgs
[4]: https://github.com/sorin-ionescu/prezto/issues
