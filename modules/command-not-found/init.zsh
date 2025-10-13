#
# Displays installation information for not found commands.
#
# Authors:
#   Joseph Jon Booker <joe@neoturbine.net>
#   Indrajit Raychaudhuri <irc+code@indrajit.com>
#

# Load command-not-found on Debian-based distributions.
if [[ -s /etc/zsh_command_not_found ]]; then
  source /etc/zsh_command_not_found
# Load command-not-found on Arch Linux-based distributions.
elif [[ -s /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
  source /usr/share/doc/pkgfile/command-not-found.zsh
# Load command-not-found on macOS when Homebrew is present. Check explicitly
# for MacOS, since homebrew can be installed on Linux as a supplementary PM
elif [[ "$OSTYPE" =~ ^darwin ]] && (( $+commands[brew] )); then
  homebrew_repo=${HOMEBREW_REPOSITORY:-$commands[brew]:A:h:h/Library}
  # Look for handler in Homebrew core (as of >=4.6.12), then in Taps (< 4.6.12)
  for hb_cnf_handler in "$homebrew_repo"/{Homebrew/command-not-found/handler.sh,Taps/homebrew/homebrew-command-not-found/handler.sh}; do
    if [ -f "$hb_cnf_handler" ]; then
      source "$hb_cnf_handler"
      unset hb_cnf_handler homebrew_repo
      break
    fi
  done
  if [ -n "$hb_cnf_handler" ]; then
    unset hb_cnf_handler homebrew_repo
    return 1
  fi
# Return if requirements are not found.
else
  return 1
fi
