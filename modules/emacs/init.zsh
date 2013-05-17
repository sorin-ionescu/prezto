#
# Configures Emacs dependency management.
#
# Authors: Sebastian Wiesner <lunaryorn@gmail.com>
#

# Enable Carton
if [[ -d "$HOME/.carton" ]]; then
    path=($HOME/.carton/bin $path)

    alias cai='carton install'
    alias cau='carton update'
    alias caI='carton init'
    alias cae='carton exec'

    local completion="$HOME/.carton/etc/carton_completion.zsh"
    if [[ -e "${completion}" ]]; then
      source "${completion}"
    fi
fi
