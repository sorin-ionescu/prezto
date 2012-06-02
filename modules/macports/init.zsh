#
# Defines MacPorts aliases.
#
# Authors:
#   Matt Cable <wozz@wookie.net>
#

if [[ "$OSTYPE" != darwin* ]]; then
    return 1
fi

# Aliases
alias pc="sudo port clean --all installed"
alias pi="sudo port install $1"
alias psu="sudo port selfupdate"
alias puni="sudo port uninstall inactive"
alias puo="sudo port upgrade outdated"
alias pup="psu && puo"

path=(
    /opt/local/{bin,sbin}
$path
)
