#
# Updates Prezto periodically.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

_updater_date_file="$HOME/.zupdate"
if zstyle -t ':prezto:module:update' auto-update; then
  zstyle -s ':prezto:module:update' frequency '_updater_check_frequency'

  # Initialize the update reminder.
  if [[ ! -f "$_updater_date_file" ]]; then
    touch "$_updater_date_file"
  fi

  # Check for update every 7 days.
  if [[ "$_updater_date_file"(Nm+$_updater_check_frequency)  ]]; then
    pupdate && touch "$_updater_date_file"
  fi
fi

unset _updater_{date_file,check_frequency}

