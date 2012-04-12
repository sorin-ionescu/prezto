#
# Maintains a frequently used directory list for fast directory changes.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

_z_prefixes=(
  ''
  '/usr/local'
  '/opt/local'
  "$(brew --prefix 2> /dev/null)"
)

for _z_prefix in "$_z_prefixes[@]"; do
  _z_sh="${_z_prefix}/etc/profile.d/z.sh"

  if [[ -f "$_z_sh" ]]; then
    source "$_z_sh"
    break
  fi
done

unset _z_prefix{es,} _z_sh

if (( $+functions[_z] )); then
  alias z='nocorrect _z 2>&1'
  alias j='z'
  function z-precmd {
    z --add "$(pwd -P)"
  }
  autoload -Uz add-zsh-hook
  add-zsh-hook precmd z-precmd
fi

