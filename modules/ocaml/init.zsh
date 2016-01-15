#
# Initializes OCaml package management.
#
# Authors:
#   Sebastian Wiesner <lunaryorn@gmail.com>
#

# Set $OPAMROOT
if [[ -z "$OPAMROOT" ]]; then
    export OPAMROOT="${HOME}/.opam"
fi

# Return if requirements are not found.
if [[ ! -f "$OPAMROOT/opam-init/init.zsh" ]]; then
  return 1
fi

# Initialize OPAM.
source "$OPAMROOT/opam-init/init.zsh"
