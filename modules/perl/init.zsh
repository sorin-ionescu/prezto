#
# Enables local Perl module installation on Mac OS X and defines aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

if (( ! $+commands[perl] )); then
  return 1
fi

if [[ "$OSTYPE" == darwin* ]]; then
  # Perl is slow; cache its output.
  cache_file="${0:h}/cache.zsh"
  perl_path="$HOME/Library/Perl/5.12"
  if [[ -f "$perl_path/lib/perl5/local/lib.pm" ]]; then
    manpath=("$perl_path/man" $manpath)
    if [[ ! -s "$cache_file" ]]; then
      perl -I$perl_path/lib/perl5 -Mlocal::lib=$perl_path >! "$cache_file"
      source "$cache_file"
    else
      source "$cache_file"
    fi
  fi
  unset perl_path
  unset cache_file

  # Set environment variables for launchd processes.
  for env_var in PERL_LOCAL_LIB_ROOT PERL_MB_OPT PERL_MM_OPT PERL5LIB; do
    launchctl setenv "$env_var" "${(P)env_var}" &!
  done
  unset env_var
fi

# Aliases

# General
alias pd='perldoc'
alias pe='perl -wlne'

# Perlbrew
alias pb='perlbrew'
alias pba='perlbrew available'
alias pbi='perlbrew install'
alias pbl='perlbrew list'
alias pbo='perlbrew off'
alias pbO='perlbrew switch-off'
alias pbs='perlbrew switch'
alias pbu='perlbrew use'
alias pbx='perlbrew uninstall'

