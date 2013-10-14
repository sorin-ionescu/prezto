#
# Configures Ocaml package management
#
# Authors: Sebastian Wiesner <lunaryorn@gmail.com>
#

if (( ! $+commands[opam] )); then
  return 1
fi

eval `opam config env`
