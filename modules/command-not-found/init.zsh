#
# Displays installation information for not found commands.
#
# Authors:
#   Joseph Jon Booker <joe@neoturbine.net>
#   Indrajit Raychaudhuri <irc+code@indrajit.com>
#

# Load command-not-found on Debian-based distributions.
if [[ -s '/etc/zsh_command_not_found' ]]; then
  source '/etc/zsh_command_not_found'
# Load command-not-found on Arch Linux-based distributions.
elif [[ -s '/usr/share/doc/pkgfile/command-not-found.zsh' ]]; then
  source '/usr/share/doc/pkgfile/command-not-found.zsh'
# Load command-not-found on macOS when Homebrew tap is configured.
# To avoid performance penalty, we do not use Homebrew's ruby based command
# lookup mechanism (viz., `brew command command-not-found-init`) and instead
# `find` it ourselves from `TAP_DIRECTORY` defined internally in Homebrew.
elif (( $+commands[brew] )); then
  cnf_command=(
    "$(brew --repository 2> /dev/null)"/Library/Taps/*/*/cmd/brew-command-not-found-init(|.rb)(.N)
  )
  if (( $#cnf_command )); then
    cache_file="${TMPDIR:-/tmp}/prezto-brew-command-not-found-cache.$UID.zsh"

    if [[ "${${(@o)cnf_command}[1]}" -nt "$cache_file" \
          || "${ZDOTDIR:-$HOME}/.zpreztorc" -nt "$cache_file" \
          || ! -s "$cache_file" ]]; then
      # brew command-not-found-init is slow; cache its output.
      brew command-not-found-init >! "$cache_file" 2> /dev/null
    fi

    source "$cache_file"

    unset cache_file
  fi

  unset cnf_command
# Return if requirements are not found.
else
  return 1
fi
