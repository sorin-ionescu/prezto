# Auto-update zsh if its over 6 hours old
# Jonathan Dahan <jonathan@jedahan.com>

# Take a look at the update-omz options in functions/

if [ -f ~/.omz-update ]; then
  # update if ~/.omz-update was modified over 6 hours ago
  if [ ~/.omz-update(Nmh+6) ]; then
    update-omz
  fi
else
  update-omz
fi
