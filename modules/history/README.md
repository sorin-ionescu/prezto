# History

Sets [history][1] options and defines history aliases.

**Note:** Default path of `HISTFILE` has changed from
_`${ZDOTDIR:-$HOME}/.zhistory`_ to _`${ZDOTDIR:-$HOME}/.zsh_history`_. The file
will be automatically renamed if possible (when the new one doesn't exist).
Otherwise, if you want to preserve previous history, you will need to move them
from _`${ZDOTDIR:-$HOME}/.zhistory`_ to _`${ZDOTDIR:-$HOME}/.zsh_history`_.

Alternately, you can set `HISTFILE` manually to _`${ZDOTDIR:-$HOME}/.zhistory`_.

## Options

- `BANG_HIST` treats the **!** character specially during expansion.
- `EXTENDED_HISTORY` writes the history file in the _:start:elapsed;command_
  format.
- `SHARE_HISTORY` shares history between all sessions. Note that
  `SHARE_HISTORY`, `INC_APPEND_HISTORY`, and `INC_APPEND_HISTORY_TIME` are
  mutually exclusive.
- `HIST_EXPIRE_DUPS_FIRST` expires a duplicate event first when trimming history.
- `HIST_IGNORE_DUPS` does not record an event that was just recorded again.
- `HIST_IGNORE_ALL_DUPS` deletes an old recorded event if a new event is a
  duplicate.
- `HIST_FIND_NO_DUPS` does not display a previously found event.
- `HIST_IGNORE_SPACE` does not record an event starting with a space.
- `HIST_SAVE_NO_DUPS` does not write a duplicate event to the history file.
- `HIST_VERIFY` does not execute immediately upon history expansion.
- `HIST_BEEP` beeps when accessing non-existent history.

## Variables

- `HISTFILE` stores the path to the history file.
- `HISTSIZE` stores the maximum number of events to save in the internal history.
- `SAVEHIST` stores the maximum number of events to save in the history file.

## Aliases

Aliases are enabled by default. To disable them, add the following to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_.

```sh
zstyle ':prezto:module:history:alias' skip 'yes'
```

- `history-stat` lists the ten most used commands

## Settings

### histfile

Can be configured either by setting HISTFILE manually before loading this
module or by using zstyle:

```sh
zstyle ':prezto:module:history' histfile "<file_name>"
```

defaults to "${ZDOTDIR:-$HOME}/.zsh_history".

### histsize

```sh
zstyle ':prezto:module:history' histsize <number>
```

defaults to 10000.

### savehist

```sh
zstyle ':prezto:module:history' savehist <number>
```

defaults to histsize

## Authors

_The authors of this module should be contacted via the [issue tracker][2]._

- [Robby Russell](https://github.com/robbyrussell)
- [Sorin Ionescu](https://github.com/sorin-ionescu)
- [Indrajit Raychaudhuri](https://github.com/indrajitr)

[1]: https://zsh.sourceforge.net/Guide/zshguide02.html#l16
[2]: https://github.com/sorin-ionescu/prezto/issues
