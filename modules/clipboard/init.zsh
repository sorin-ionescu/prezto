#
# Integrates the zsh clipboard with the system clipboard.
#
# Authors:
#   Nir Friedman <quicknir@gmail.com>
#

function cutbuffer {
  zle .$WIDGET
  if [[ "$OSTYPE" == darwin* ]]; then
    echo $CUTBUFFER | pbcopy
  elif [[ "$OSTYPE" == cygwin* ]]; then
    echo $CUTBUFFER | tee > /dev/clipboard
  elif (( $+commands[xclip] )); then
    echo $CUTBUFFER | xclip -selection clipboard
  elif (( $+commands[xsel] )); then
    echo $CUTBUFFER | xsel --clipboard --input
  fi
}

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

for widget in $zle_cut_widgets; do
  zle -N $widget cutbuffer
done

function putbuffer {
  if [[ "$OSTYPE" == darwin* ]]; then
    zle copy-region-as-kill "$(pbcopy)"
  elif [[ "$OSTYPE" == cygwin* ]]; then
    zle copy-region-as-kill "$(cat /dev/clipboard)"
  elif (( $+commands[xclip] )); then
    zle copy-region-as-kill "$(xclip -o -selection clipboard)"
  elif (( $+commands[xsel] )); then
    zle copy-region-as-kill "$(xsel --clipboard --output)"
  fi
  zle .$WIDGET
}

zle_put_widgets=(
  vi-put-after
  vi-put-before
)

for widget in $zle_put_widgets; do
  zle -N $widget putbuffer
done
