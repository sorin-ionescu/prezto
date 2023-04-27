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

zstyle -s ':prezto:module:history' histfile '_pmh_histfile' || _pmh_histfile="${HISTFILE:-${ZDOTDIR:-$HOME}/.zsh_history}"
zstyle -s ':prezto:module:history' histsize '_pmh_histsize' || _pmh_histsize=10000
zstyle -s ':prezto:module:history' savehist '_pmh_savehist' || _pmh_savehist=${_pmh_histsize}
HISTFILE="${_pmh_histfile}"  # The path to the history file.
HISTSIZE="${_pmh_histsize}"  # The maximum number of events to save in the internal history.
SAVEHIST="${_pmh_savehist}"  # The maximum number of events to save in the history file.
unset _pmh_{hist{file,size},savehist}

#
# Aliases
#

if ! zstyle -t ':prezto:module:history:alias' skip; then
  # Lists the ten most used commands.
  alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"
fi
