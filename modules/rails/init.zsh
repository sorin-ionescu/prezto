#
# Defines Ruby on Rails aliases.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Jake Bell <jake.b.bell@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
pmodload 'ruby'

# Return if requirements are not found.
if (( ! $+commands[bundle] )); then
  return 1
fi

function _rails_command {
  if [ -e "bin/rails" ]; then
    bin/rails $@
  elif type bundle &> /dev/null && [ -e "Gemfile" ]; then
    bundle exec rails $@
  else
    command rails $@
  fi
}

function _rake_command {
  if [ -e "bin/rake" ]; then
    bin/rake $@
  elif type bundle &> /dev/null && [ -e "Gemfile" ]; then
    bundle exec rake $@
  else
    command rake $@
  fi
}

#
# Aliases
#
alias -g RED='RAILS_ENV=development'
alias -g REP='RAILS_ENV=production'
alias -g RET='RAILS_ENV=test'

alias Rcop="rubocop --rails --format progress --format html -o rubocop.html"
alias Rdevlog='tail -f log/development.log'
alias Rprodlog='tail -f log/production.log'
alias Rtestlog='tail -f log/test.log'

alias rails='_rails_command'
compdef _rails_command=rails

alias rake='_rake_command'
compdef _rake_command=rake

alias ror='rails'
alias rorc='rails console'
alias rord='rails destroy'
alias rordb='rails dbconsole'
alias rorg='rails generate'
alias rorgm='rails generate migration'
alias rorl='tail -f "$(ruby-app-root)/log/development.log"'
alias rorlc='rake log:clear'
alias rorp='rails plugin'
alias rorr='rails runner'
alias rors='rails server'
alias rorsd='rails server --debugger'
alias rorx='rails destroy'

# Rake-specific stuff
alias rdm='rake db:migrate'
alias rdbr='rake db:rollback'
alias rdbc='rake db:create'
alias rdbs='rake db:seed'
alias rdbd='rake db:drop'
alias rdbrs='rake db:reset'
alias rdbtc='rake db:test:clone'
alias rdbtp='rake db:test:prepare'
alias rdbms='rake db:migrate:status'
alias rdbmtc='rake db:migrate db:test:clone'
