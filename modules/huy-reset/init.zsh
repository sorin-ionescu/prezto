# This file is to undo or reset some of the bad defaults in Prezto

# Undo terrible bindings in 'completion' module
# https://github.com/sorin-ionescu/prezto/issues/338
bindkey -M viins -r "jk"
bindkey -M viins -r "kj"

# People will do -h if they want to
alias df='df -k'
alias du='du -k'
