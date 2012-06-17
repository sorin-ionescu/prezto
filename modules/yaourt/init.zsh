#
# Defines yaourt aliases.
#
# Authors:
#   Benjamin Boudreau <dreurmail@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Yaourt Aliases
# Upgrade Arch Linux.
alias arch-upgrade='yaourt -Syu'

# Fix all configuration files with vimdiff.
alias yaconf='yaourt -C'

# Synchronize with repositories before upgrading packages that are out of date on the local system.
alias yaupg='yaourt -Syu'

# Install specific package(s) from the repositories.
alias yain='yaourt -S'

# Install specific package(s) not from the repositories but from a file.
alias yains='yaourt -U'

# Remove the specified package(s), retaining its configuration(s) and required dependencies.
alias yare='yaourt -R'

# Remove the specified package(s), its configuration(s) and unneeded dependencies.
alias yarem='yaourt -Rns'

# Display information about a given package in the repositories.
alias yarep='yaourt -Si'

# Search for package(s) in the repositories.
alias yareps='yaourt -Ss'

# Display information about a given package in the local database.
alias yaloc='yaourt -Qi'

# Search for package(s) in the local database.
alias yalocs='yaourt -Qs'

# Force refresh of all package lists after updating /etc/pacman.d/mirrorlist
alias yamir='yaourt -Syy'

# Install given package(s) as dependencies of another package
alias yainsd='yaourt -S --asdeps'

# Update and refresh the local package and ABS databases against repositories.
if (( $+commands[abs] )); then
	alias yaupd='yaourt -Sy && sudo abs'
else
	alias yaupd='yaourt -Sy'
fi
