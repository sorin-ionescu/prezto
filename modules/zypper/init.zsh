#
# Defines zypper aliases.
#
# Authors:
#   Simon <contact@saimon.org>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Andrea Ceccarelli <gltch2003@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[zypper] )); then
  return 1
fi

#
# Aliases
#

alias zypc='sudo zypper clean -a'                     # Cleans the cache.
alias zyph='zypper history'                           # Displays history.
alias zypi='sudo zypper install'                      # Installs package(s).
alias zypl='zypper clean'                             # Clean packages cache.
alias zypq='zypper info'                              # Displays package information.
alias zypr='sudo zypper remove'                       # Removes package(s).
alias zyps='zypper search'                            # Searches for a package.
alias zypv='sudo zypper ve'                           # Verifies dependencies.
alias zypu='sudo zypper up'                           # Updates packages.
alias zypU='sudo zypper dup'                          # Dist Upgrade.
alias zypUD='sudo zypper dup --download-only'         # Dist Upgrade download only.
alias zypUn='sudo zypper --no-refresh'                # Dist Upgrade no repository refresh.
alias zypR='sudo zypper ref'                          # Refresh repositories caches.