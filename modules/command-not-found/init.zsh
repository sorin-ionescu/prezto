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
# Load command-not-found on macOS when Homebrew tap is configured.
elif (( $+commands[brew] )) \
      && [[ -s ${hb_cnf_handler::="${HOMEBREW_REPOSITORY:-$commands[brew]:A:h:h}/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"} ]]; then
  source "$hb_cnf_handler"
  unset hb_cnf_handler
# Return if requirements are not found.
else
  return 1
fi
