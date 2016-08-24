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

alias ror='bundle exec rails'
alias rorc='bundle exec rails console'
alias rord='bundle exec rails destroy'
alias rordb='bundle exec rails dbconsole'
alias rorg='bundle exec rails generate'
alias rorgm='bundle exec rails generate migration'
alias rorl='tail -f "$(ruby-app-root)/log/development.log"'
alias rorlc='bundle exec rake log:clear'
alias rorp='bundle exec rails plugin'
alias rorr='bundle exec rails runner'
alias rors='bundle exec rails server'
alias rorsd='bundle exec rails server --debugger'
alias rorx='bundle exec rails destroy'

# Rake-specific stuff
alias rdm='bundle exec rake db:migrate'
alias rdbr='rake db:rollback'
alias rdbc='rake db:create'
alias rdbs='rake db:seed'
alias rdbd='rake db:drop'
alias rdbrs='rake db:reset'
alias rdbtc='rake db:test:clone'
alias rdbtp='rake db:test:prepare'
alias rdbms='bundle exec rake db:migrate:status'
alias rdbmtc='rake db:migrate db:test:clone'
