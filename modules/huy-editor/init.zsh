# Huy's enhancement of Prezto's bindings
#
# In VI insert mode, these control-keys are still available.
#   (Plus all the escape command such as \eM)
# ^Y
# ^N (not a useful binding right now)

# These bindings depend on and work in conjunction with prezto's 'editor' module.
pmodload 'editor'

#
# ZLE Widgets
#

#zle -N insert-nth-last-word
function insert-next-to-last-word() { zle insert-last-word -- -1 -2 }
zle -N insert-next-to-last-word
function insert-more-recent-last-word() { zle insert-last-word -- 1 -1 }
zle -N insert-more-recent-last-word
function insert-more-recent-next-to-last-word() { zle insert-last-word -- 1 -2 }
zle -N insert-more-recent-next-to-last-word
zle -C hist-complete complete-word _generic
zstyle ':completion:hist-complete:*' completer _history

#
# Reset prezto's annoying bindings
#

# Undo terrible bindings in 'completion' module
# https://github.com/sorin-ionescu/prezto/issues/338
bindkey -M viins -r "jk"
bindkey -M viins -r "kj"

# Undo prezto's zsh-history-substring-search bindings
bindkey -M vicmd 'k' up-line-or-history
bindkey -M vicmd 'j' down-line-or-history

#
# Some Emacs Key Bindings
# Copied from 'editor' module.
# NOTE: we can't take the ones that are ambiguous: ESC k  could mean
# "go to cmd mode and go up" and this ambiguity slows down vi mode.
#

# Edit command in an external editor.
bindkey -M viins "$key_info[Control]X$key_info[Control]E" edit-command-line

if (( $+widgets[history-incremental-pattern-search-backward] )); then
  bindkey -M viins "$key_info[Control]R" \
    history-incremental-pattern-search-backward
  bindkey -M viins "$key_info[Control]S" \
    history-incremental-pattern-search-forward
fi

#
# Some Emacs and Vi Key Bindings (but for Vi command mode)
# Copied from 'editor' module.
#

for keymap in 'vicmd'; do
  # Complete in the middle of word.
  bindkey -M "$keymap" "$key_info[Control]I" expand-or-complete

  # Use a more flexible push-line.
  for key in "$key_info[Control]Q"
    bindkey -M "$keymap" "$key" push-line-or-edit
done

#
# Custom bindings
#

# Just as with emacs
bindkey -M viins "$key_info[Control]T" transpose-chars
bindkey -M viins "$key_info[Escape]t" transpose-words

# Cancel the current completion (undo the <TAB> completion)
bindkey -M viins "$key_info[Control]Y" undo

# To be more like vim
bindkey -M vicmd 'J'  vi-join
bindkey -M vicmd ':'  execute-named-cmd
bindkey -M vicmd '_'  execute-last-named-cmd

# Expand things
bindkey -M viins "$key_info[Control]P" hist-complete

# Pick out arguments from previous lines (in both directions)
bindkey -M viins "$key_info[Control]O" insert-last-word
bindkey -M viins "$key_info[Control]K" insert-more-recent-last-word
bindkey -M viins "$key_info[Control]E" insert-next-to-last-word
bindkey -M viins "$key_info[Control]A" insert-more-recent-next-to-last-word

# Complete on line-wise prefixes
bindkey -M viins "$key_info[Control]B" history-beginning-search-backward
bindkey -M vicmd "$key_info[Control]B" history-beginning-search-backward
bindkey -M viins "$key_info[Control]F" history-beginning-search-forward
bindkey -M vicmd "$key_info[Control]F" history-beginning-search-forward

# This allows you to edit your $PWD with the zle
for keymap in viins emacs
  bindkey -M "$keymap" -s '^Z' $'cd $PWD\t'

#
# Marginally-useful bindigns
#

# Search in the history list for a line matching the current one and fetch
# the event following
bindkey    '^N' infer-next-history  # not very useful

unset key{map,}
