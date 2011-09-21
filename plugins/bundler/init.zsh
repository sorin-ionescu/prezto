# Aliases
alias be="bundle exec"
alias bi="bundle install"
alias bl="bundle list"
alias bo="bundle open"
alias bp="bundle package"
alias bu="bundle update"

# The following is based on https://github.com/gma/bundler-exec
bundled_commands=(
  cap
  capify
  cucumber
  guard
  heroku
  rackup
  rails
  rake
  rspec
  ruby
  shotgun
  spec
  spork
  thin
  unicorn
  unicorn_rails
)

# Functions
function _bundler-installed() {
  which bundle > /dev/null 2>&1
}

function _bundler-within-bundled-project() {
  local check_dir=$PWD
  while [[ "$(dirname $check_dir)" != "/" ]]; do
    [[ -f "$check_dir/Gemfile" ]] && return
    check_dir="$(dirname $check_dir)"
  done
  false
}

function _bundler-run() {
  if _bundler-installed && _bundler-within-bundled-project; then
    bundle exec $@
  else
    $@
  fi
}

for cmd in $bundled_commands; do
  alias $cmd="_bundler-run $cmd"
done

unset bundled_commands

