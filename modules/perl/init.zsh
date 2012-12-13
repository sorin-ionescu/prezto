#
# Enables local Perl module installation on Mac OS X and defines aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[perl] )); then
  return 1
fi

#
# Local Module Installation
#

if [[ "$OSTYPE" == darwin* ]]; then
  # Perl is slow; cache its output.
  # huy: use the user's home directory
  #cache_file="${0:h}/cache.zsh"
  cache_file="${_ZDOTDIR:-$HOME}/.zprezto.perl.cache.zsh"
  perl_path="$HOME/Library/Perl/5.12"

  if [[ -f "$perl_path/lib/perl5/local/lib.pm" ]]; then
    manpath=("$perl_path/man" $manpath)

    if [[ ! -s "$cache_file" ]]; then
      perl -I$perl_path/lib/perl5 -Mlocal::lib=$perl_path >! "$cache_file"
    fi

    source "$cache_file"
  fi

  unset perl_path
  unset cache_file

  # Set environment variables for launchd processes.
  for env_var in PERL_LOCAL_LIB_ROOT PERL_MB_OPT PERL_MM_OPT PERL5LIB; do
    launchctl setenv "$env_var" "${(P)env_var}" &!
  done
  unset env_var
fi

#
# Aliases
#

# General
alias pl='perl'
alias pld='perldoc'
alias ple='perl -wlne'

# Perlbrew
alias plb='perlbrew'
alias plba='perlbrew available'
alias plbi='perlbrew install'
alias plbl='perlbrew list'
alias plbo='perlbrew off'
alias plbO='perlbrew switch-off'
alias plbs='perlbrew switch'
alias plbu='perlbrew use'
alias plbx='perlbrew uninstall'

