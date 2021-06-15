#
# Sets history options and defines history aliases.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Options
#

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing non-existent history.

#
# Variables
#

HISTFILE="${HISTFILE:-${ZDOTDIR:-$HOME}/.zsh_history}"  # The path to the history file.
HISTSIZE=10000                   # The maximum number of events to save in the internal history.
SAVEHIST=10000                   # The maximum number of events to save in the history file.

#
# Aliases
#

# Lists the ten most used commands.
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

if [[ -s "${OLD_HISTFILE::=${HISTFILE:h}/.zhistory}" ]]; then

  # New 'HISTFILE' doesn't exist yet, rename legacy one if available and notify.
  if [[ ! -s "$HISTFILE" ]]; then
    <<EON
NOTICE: Default path of 'HISTFILE' has changed from '${OLD_HISTFILE/#$HOME/~}'
        to '${HISTFILE/#$HOME/~}'.
        Attempting to rename the existing 'HISTFILE' ...
EON
    command mv -v "$OLD_HISTFILE" "$HISTFILE"

  # New 'HISTFILE' does exist and is older than legacy one, just warn.
  elif [[ "$OLD_HISTFILE" -nt "$HISTFILE" ]]; then
    <<EOW
WARNING: Default path of 'HISTFILE' has changed from '${OLD_HISTFILE/#$HOME/~}'
         to '${HISTFILE/#$HOME/~}'.
         Either set 'HISTFILE' in '${${0:h}/#$HOME/~}'
         or move previous history from '${OLD_HISTFILE/#$HOME/~}' to
         '${HISTFILE/#$HOME/~}'.
EOW
  fi

  unset OLD_HISTFILE
fi
