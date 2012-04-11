# https://github.com/clvv/fasd

omodload 'completion'

if (( ! $+commands[fasd] )); then
  return 1
fi

eval "$(fasd --init-zsh)"

alias a='fasd -a' # any
alias s='fasd -s' # show / search / select
alias d='fasd -d' # directory
alias f='fasd -f' # file
alias z='fasd_cd -d' # cd, same functionality as j in autojump

alias j='z'             # Quickly cd into directories.
alias m='f -e mplayer'        # Quickly open files with mplayer.
alias o="a -e $aliases[o]"    # Quickly open files with open.
alias v='f -e vim -b viminfo' # Quickly open files with vim.

for keymap in 'emacs' 'viins'; do
  bindkey -M "$keymap" "$key_info[Control]X$key_info[Control]A" fasd-complete    # C-x C-a (files and directories)
  bindkey -M "$keymap" "$key_info[Control]X$key_info[Control]D" fasd-complete-d  # C-x C-d (directories)
  bindkey -M "$keymap" "$key_info[Control]X$key_info[Control]F" fasd-complete-f  # C-x C-f (files)
done

