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

# Aliases (Compatible with Rails 2)
alias rc='_rails-command console'
alias rdc='_rails-command dbconsole'
alias rdm='rake db:migrate'
alias rdM='rake db:migrate db:test:clone'
alias rdr='rake db:rollback'
alias rg='_rails-command generate'
alias rl='tail -f log/development.log'
alias rlc='rake log:clear'
alias rp='_rails-command plugin'
alias rr='_rails-command runner'
alias rs='_rails-command server'
alias rsd='_rails-command server --debugger'
alias rx='_rails-command destroy'

# Functions
function _rails-command {
  if [[ -e "script/server" ]]; then
    ruby script/"$@"
  else
    ruby script/rails "$@"
  fi
}

