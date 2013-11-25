#
# Defines Ruby on Rails aliases.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Jake Bell <jake.b.bell@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[rails] )); then
  return 1
fi

#
# Aliases (Compatible with Rails 2)
#

alias ror='rails'
alias rorc='_rails-command console'
alias rordc='_rails-command dbconsole'
alias rordm='rake db:migrate'
alias rordM='rake db:migrate db:test:clone'
alias rordr='rake db:rollback'
alias rorg='_rails-command generate'
alias rorl='tail -f log/development.log'
alias rorlc='rake log:clear'
alias rorp='_rails-command plugin'
alias rorr='_rails-command runner'
alias rors='_rails-command server'
alias rorsd='_rails-command server --debugger'
alias rorx='_rails-command destroy'

#
# Functions
#

function _rails-command {
  local root_dir="$PWD"
  local rails_cmd

  while [[ "$root_dir" != '/' ]]; do
    if [[ -d "$root_dir/.bundle" ]]; then
      break
    fi
    root_dir="$root_dir:h"
  done

  if [[ -e "$root_dir/bin/rails" ]]; then
    rails_cmd='bin/rails'
  elif [[ -e "$root_dir/script/rails" ]]; then
    rails_cmd='script/rails'
  elif [[ -e "$root_dir/script/server" ]]; then
    rails_cmd='script/'
  else
    print "$0: not inside of a Rails application: $PWD" >&2
    return 1
  fi

  (cd "$root_dir" && ruby "$rails_cmd" "$@")
}

