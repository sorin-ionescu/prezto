History
=======

Sets [history][1] options.

Options
-------

 - `HISTFILE`, The file to save the history in when an interactive shell exits.
 - `HISTSIZE`, The maximum size of the history list.
 - `SAVEHIST`, The maximum number of history events to save in the history file.
 - `BANG_HIST`, Treat the `!` character specially during expansion.
 - `EXTENDED_HISTORY`, Write the history file in the `:start:elapsed;command`
format.
 - `INC_APPEND_HISTORY`, Write to the history file immediately, not when the
shell exits.
 - `SHARE_HISTORY`, Share history between all sessions.
 - `HIST_EXPIRE_DUPS_FIRST`, Expire duplicate entries first when trimming
history.
 - `HIST_IGNORE_DUPS`, Don't record an entry that was just recorded again.
 - `HIST_IGNORE_ALL_DUPS`, Delete old recorded entry if new entry is a
duplicate.
 - `HIST_FIND_NO_DUPS`, Do not display a line previously found.
 - `HIST_IGNORE_SPACE`, Don't record an entry starting with a space.
 - `HIST_SAVE_NO_DUPS`, Don't write duplicate entries in the history file.
 - `HIST_REDUCE_BLANKS`, Remove superfluous blanks before recording entry.
 - `HIST_VERIFY`, Don't execute immediately upon history expansion.
 - `HIST_BEEP`, Beep when accessing nonexistent history.

Aliases
-------

 - `history-stat`, Lists the ten most used commands

Authors
-------

*The authors of this module should be contacted via the github bug tracker.*

 - [Robby Russell](/robbyrussell)
 - [Sorin Ionescu](/sorin-ionescu)

[1]: http://zsh.sourceforge.net/Guide/zshguide02.html#l16
