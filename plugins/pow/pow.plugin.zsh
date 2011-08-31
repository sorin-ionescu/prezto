# Christopher Sexton
# https://gist.github.com/1019777
#
# Restart a rack app running under pow.
# http://pow.cx/
#
# Adds a kapow command that will restart an app.
#
#   $ kapow myapp
#
# Supports command completion.
#
# If you are not already using completion, you might need to enable it.
#
#    autoload -U compinit compinit
#
# Changes:
#
# Defaults to the current application and will walk up the tree to find
# a config.ru file and restart the corresponding app.
#
# Will detect if a app does not exist in pow and print a (slightly) helpful
# error message.

function _pow-rack-root-detect() {
  setopt chaselinks
  local orgdir="$PWD"
  local basedir="$PWD"

  while [[ "$basedir" != '/' ]]; do
    [[ -f "${basedir}/config.ru" ]] && break
    builtin cd ".." 2> /dev/null
    basedir="$PWD"
  done

  builtin cd "$orgdir" 2>/dev/null
  [[ "${basedir}" == "/" ]] && return 1
  echo `basename "$basedir" | sed -E "s/.(com|net|org)//"`
}

function kapow() {
  local vhost="$1"
  [[ ! -n "$vhost" ]] && vhost="$(_pow-rack-root-detect)"
  if [[ ! -h "${HOME}/.pow/${vhost}" ]]; then
    echo "pow: This domain isn’t set up yet. Symlink your application to ${vhost} first."
    return 1
  fi

  [[ ! -d "${HOME}/.pow/${vhost}/tmp" ]] && mkdir -p "${HOME}/.pow/${vhost}/tmp"
  if touch "${HOME}/.pow/${vhost}/tmp/restart.txt"; then
    echo "pow: restarting ${vhost}.dev"
  fi
}
compctl -W ~/.pow -/ kapow

# Aliases
alias kaput="tail -f ${HOME}/Library/Logs/Pow/apps/*" # View the standard out (puts) from any pow app.

