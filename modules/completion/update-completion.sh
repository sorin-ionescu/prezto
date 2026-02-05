#!/bin/zsh

SCRIPT_DIR="${0:A:h}"
echo "SCRIPT_DIR: $SCRIPT_DIR"

echo "Updating Docker completion"
docker completion zsh >! "${SCRIPT_DIR}/src/_docker"


echo "Updating conda completion"
wget https://raw.githubusercontent.com/conda-incubator/conda-zsh-completion/master/_conda -qO "${SCRIPT_DIR}/src/_conda"

# check if rustup is installed before updating completions
if command -v rustup &> /dev/null; then
    echo "Updating rustup and cargo completions"
    rustup completions zsh >! "${SCRIPT_DIR}/src/_rustup"
    rustup completions zsh cargo >! "${SCRIPT_DIR}/src/_cargo"
fi

# check if procs is installed before updating completions
# if command -v procs &> /dev/null; then
#     echo "Updating procs completion"
#     procs --gen-completion-out zsh >! "${SCRIPT_DIR}/src/_procs"
# fi

# check if resticprofile is installed before updating completions
if command -v resticprofile &> /dev/null; then
    echo "Updating resticprofile completion"
    resticprofile generate --zsh-completion >! "${SCRIPT_DIR}/src/_resticprofile"
fi

# check if zellij is installed before updating completions
if command -v zellij &> /dev/null; then
    echo "Updating zellij completion"
    zellij setup --generate-completion zsh >! "${SCRIPT_DIR}/src/_zellij"
fi


echo "Deleting completion cache"
rm -rf ~/.zcompdump
rm -rf ~/.cache/prezto

autoload -Uz compinit
mkdir -p ~/.cache/prezto
compinit -C -d ~/.cache/prezto/zcompdump
zcompile ~/.cache/prezto/zcompdump