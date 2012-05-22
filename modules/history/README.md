History
=======

Sets [history][1] options and defines history aliases.

VARIABLES
---------

  - `HISTFILE` the file to save the history in when an interactive shell exits.
  - `HISTSIZE` the maximum size of the history list.
  - `SAVEHIST` the maximum number of history events to save in the history file.

Options
-------

  - `BANG_HIST` treat the **!** character specially during expansion.
  - `EXTENDED_HISTORY` write the history file in the *:start:elapsed;command* format.
  - `INC_APPEND_HISTORY` write to the history file immediately, not when the shell exits.
  - `SHARE_HISTORY` share history between all sessions.
  - `HIST_EXPIRE_DUPS_FIRST` expire duplicate entries first when trimming history.
  - `HIST_IGNORE_DUPS` do not record an entry that was just recorded again.
  - `HIST_IGNORE_ALL_DUPS` delete old recorded entry if new entry is a duplicate.
  - `HIST_FIND_NO_DUPS` do not display a line previously found.
  - `HIST_IGNORE_SPACE` do not record an entry starting with a space.
  - `HIST_SAVE_NO_DUPS` do not write duplicate entries in the history file.
  - `HIST_REDUCE_BLANKS` remove superfluous blanks before recording entry.
  - `HIST_VERIFY` do not execute immediately upon history expansion.
  - `HIST_BEEP` beep when accessing non-existent history.

Aliases
-------

  - `history-stat` list the ten most used commands

Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Robby Russell](https://github.com/robbyrussell)
  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: http://zsh.sourceforge.net/Guide/zshguide02.html#l16
[2]: https://github.com/sorin-ionescu/oh-my-zsh/issues

