Environment
===========

Sets general shell options and defines environment variables.

This module must be loaded first.

Contributors
------------

This module **MUST NOT** rely on any command not built in Zsh.

Non-interactive environment variables should be defined in [`zshenv`][1].

Options
-------

### General

  - `COMBINING_CHARS` combine zero-length punctuation characters (accents) with
    the base character.
  - `INTERACTIVE_COMMENTS` enable comments in interactive shell.
  - `RC_QUOTES` allow 'Henry''s Garage' instead of 'Henry'\''s Garage'.
  - `MAIL_WARNING` don't print a warning message if a mail file has been accessed.

### Jobs

  - `LONG_LIST_JOBS` list jobs in the long format by default.
  - `AUTO_RESUME` attempt to resume existing job before creating a new process.
  - `NOTIFY` report status of background jobs immediately.
  - `BG_NICE` don't run all background jobs at a lower priority.
  - `HUP` don't kill jobs on shell exit.
  - `CHECK_JOBS` don't report on jobs when shell exit.

Variables
---------

### Termcap

  - `LESS_TERMCAP_mb` begins blinking.
  - `LESS_TERMCAP_md` begins bold.
  - `LESS_TERMCAP_me` ends mode.
  - `LESS_TERMCAP_se` ends standout-mode.
  - `LESS_TERMCAP_so` begins standout-mode.
  - `LESS_TERMCAP_ue` ends underline.
  - `LESS_TERMCAP_us` begins underline.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/sorin-ionescu/prezto/blob/master/runcoms/zshenv
[2]: https://github.com/sorin-ionescu/prezto/issues
