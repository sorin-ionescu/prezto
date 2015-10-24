#
# Integrates the zsh clipboard with the system clipboard.
#
# Authors:
#   Nir Friedman <quicknir@gmail.com>
#

# If running Mac OS, set this to 1
local IS_MAC_OS=0

if [[ IS_MAC_OS -eq 0 ]]; then
  function cutbuffer() {
    zle .$WIDGET
    echo $CUTBUFFER | xclip -selection clipboard
  }
else
  function cutbuffer() {
    zle .$WIDGET
    echo $CUTBUFFER | pbcopy
  }
fi

zle_cut_widgets=(
  vi-backward-delete-char
  vi-change
  vi-change-eol
  vi-change-whole-line
  vi-delete
  vi-delete-char
  vi-kill-eol
  vi-substitute
  vi-yank
  vi-yank-eol
)

for widget in $zle_cut_widgets
do
  zle -N $widget cutbuffer
done


if [[ IS_MAC_OS -eq 0 ]]; then
  function putbuffer() {
    zle copy-region-as-kill "$(xclip -o -selection clipboard)"
    zle .$WIDGET
  }
else
  function putbuffer() {
    zle copy-region-as-kill "$(pbpaste)"
    zle .$WIDGET
  }
fi

zle_put_widgets=(
  vi-put-after
  vi-put-before
)

for widget in $zle_put_widgets
do
  zle -N $widget putbuffer
done
