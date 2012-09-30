FASD
====

[Fasd][1] is a command-line productivity booster. Fasd offers quick access to
files and directories. It is inspired by tools like [autojump][2], [z][3] and
[v][4]. Fasd keeps track of files and directories you have accessed, so that
you can quickly reference them in the command line.

You should define your own aliases to utilize the full power of fasd. For more
information please see `man fasd` or visit [fasd][1].

For completion to work, this module should be loaded **after** the *completion*
module.

Aliases
-------

  - `a`  return most *frecent* match
  - `s`  interactive selection
  - `d`  return most *frecent* directory
  - `f`  return most *frecent* file
  - `sd` interactive directory selection
  - `sf` interactive file selection
  - `z`  changes the directory to most *frecent* match.
  - `zz` interactive z
  - `j`  the same as `z` for [autojump][2] converts.
  - `v`  open recently vim-edited files

Note: loading `fasd` module will override alias `d` defined in `directory`
module.

Completion
----------

You can do tab completion on any fasd command (d, f, z, v, etc.).

You can type a comma-separated query on *any command* and use the following key
combination:

  - Ctrl-x Ctrl-a to complete files and directories
  - Ctrl-x Ctrl-d to complete directories
  - Ctrl-x Ctrl-f to complete files

Alternatively, you can type extra `f,`, `d,` `,` in front of your
comma-separated query, or type extra `,,f`, `,,d`, `,,` at the end of your
comma-separated query. Such formated command-line arguments will be tab
completed via fasd.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][5].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)
  - [Wei Dai](https://github.com/clvv)

[1]: https://github.com/clvv/fasd
[2]: https://github.com/joelthelion/autojump
[3]: https://github.com/rupa/z
[4]: https://github.com/rupa/v
[5]: https://github.com/sorin-ionescu/oh-my-zsh/issues

