#
# Browser-style directional directory navigation.
#
#   Alt+Left  — back to previous directory
#   Alt+Right — forward (undo back)
#   Alt+Up    — parent directory
#   Alt+Down  — first child directory (alphabetical)
#

pmodload 'editor'

typeset -ga _dir_nav_back _dir_nav_fwd
typeset -g  _dir_nav_busy=0

# Record cd's done outside the widgets so Alt+Left can rewind them.
_dir_nav_chpwd() {
  (( _dir_nav_busy )) && return
  _dir_nav_back+=("$OLDPWD")
  _dir_nav_fwd=()
}
autoload -Uz add-zsh-hook
add-zsh-hook chpwd _dir_nav_chpwd

dir-nav-back() {
  (( ${#_dir_nav_back} )) || return
  _dir_nav_fwd+=("$PWD")
  _dir_nav_busy=1; builtin cd -- "${_dir_nav_back[-1]}"; _dir_nav_busy=0
  _dir_nav_back[-1]=()
  zle reset-prompt
}

dir-nav-forward() {
  (( ${#_dir_nav_fwd} )) || return
  _dir_nav_back+=("$PWD")
  _dir_nav_busy=1; builtin cd -- "${_dir_nav_fwd[-1]}"; _dir_nav_busy=0
  _dir_nav_fwd[-1]=()
  zle reset-prompt
}

dir-nav-up() {
  [[ "$PWD" == "/" ]] && return
  _dir_nav_back+=("$PWD"); _dir_nav_fwd=()
  _dir_nav_busy=1; builtin cd ..; _dir_nav_busy=0
  zle reset-prompt
}

dir-nav-down() {
  local -a children=( *(/N) )
  (( ${#children} )) || return
  _dir_nav_back+=("$PWD"); _dir_nav_fwd=()
  _dir_nav_busy=1; builtin cd -- "${children[1]}"; _dir_nav_busy=0
  zle reset-prompt
}

zle -N dir-nav-back
zle -N dir-nav-forward
zle -N dir-nav-up
zle -N dir-nav-down

#
# Key bindings. Alt+Arrow is sent as either ESC-prefixed (ESC ESC [ X) or
# the CSI modifier form (ESC [ 1 ; 3 X); bind both for portability.
#

if [[ -n "$key_info" ]]; then
  for keymap in emacs viins; do
    bindkey -M "$keymap" "$key_info[Escape]$key_info[Left]"  dir-nav-back
    bindkey -M "$keymap" "$key_info[Escape]$key_info[Right]" dir-nav-forward
    bindkey -M "$keymap" "$key_info[Escape]$key_info[Up]"    dir-nav-up
    bindkey -M "$keymap" "$key_info[Escape]$key_info[Down]"  dir-nav-down

    bindkey -M "$keymap" '^[[1;3D' dir-nav-back
    bindkey -M "$keymap" '^[[1;3C' dir-nav-forward
    bindkey -M "$keymap" '^[[1;3A' dir-nav-up
    bindkey -M "$keymap" '^[[1;3B' dir-nav-down
  done
  unset keymap
fi
