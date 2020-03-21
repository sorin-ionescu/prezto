#
# Enables local Perl module installation on macOS and defines aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[perl] )); then
  return 1
fi

#
# Load Perlbrew or plenv
#

# Load Perlbrew into the shell session.
if [[ -s "${PERLBREW_ROOT:-$HOME/perl5/perlbrew}/etc/bashrc" ]]; then
  source "${PERLBREW_ROOT:-$HOME/perl5/perlbrew}/etc/bashrc"

  # Load Perlbrew completion.
  if [[ -s "${PERLBREW_ROOT:-$HOME/perl5/perlbrew}/etc/perlbrew-completion.bash" ]]; then
    source "${PERLBREW_ROOT:-$HOME/perl5/perlbrew}/etc/perlbrew-completion.bash"
  fi

# Load manually installed plenv into the shell session.
elif [[ -s "$HOME/.plenv/bin/plenv" ]]; then
  path=("$HOME/.plenv/bin" $path)
  eval "$(plenv init - --no-rehash zsh)"

# Load package manager installed plenv into the shell session.
elif (( $+commands[plenv] )); then
  eval "$(plenv init - --no-rehash zsh)"
fi

#
# Local Module Installation
#

if is-darwin; then
  # Perl is slow; cache its output.
  cache_file="${TMPDIR:-/tmp}/prezto-perl-cache.$UID.zsh"
  perl_path="$HOME/Library/Perl/5.12"

  if [[ -f "$perl_path/lib/perl5/local/lib.pm" ]]; then
    if [[ "${ZDOTDIR:-$HOME}/.zpreztorc" -nt "$cache_file" || ! -s "$cache_file" ]]; then
      perl -I$perl_path/lib/perl5 -Mlocal::lib=$perl_path >! "$cache_file"
    fi

    source "$cache_file"
  fi

  unset cache_file perl_path
fi

#
# Aliases
#

# General
alias pl='perl'
alias pld='perldoc'
alias ple='perl -wlne'

# Perlbrew
if (( $+commands[perlbrew] )); then
  alias plb='perlbrew'
  alias plba='perlbrew available'
  alias plbi='perlbrew install'
  alias plbl='perlbrew list'
  alias plbo='perlbrew off'
  alias plbO='perlbrew switch-off'
  alias plbs='perlbrew switch'
  alias plbu='perlbrew use'
  alias plbx='perlbrew uninstall'

elif (( $+commands[plenv] )); then
  alias plv='plenv'
  alias plvc='plenv commands'
  alias plvl='plenv local'
  alias plvg='plenv global'
  alias plvs='plenv shell'
  alias plvi='plenv install'
  alias plvu='plenv uninstall'
  alias plvr='plenv rehash'
  alias plvv='plenv version'
  alias plvV='plenv versions'
  alias plvw='plenv which'
  alias plvW='plenv whence'
  alias plvm='plenv list-modules'
  alias plvM='plenv migrate-modules'
  alias plvI='plenv install-cpanm'
fi
