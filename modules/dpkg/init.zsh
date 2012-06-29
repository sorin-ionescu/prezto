#
# Defines dpkg aliases.
#
# Authors:
#   Daniel Bolton <dbb@9y.com>
#   Benjamin Boudreau <boudreau.benjamin@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

if (( ! $+commands[dpkg] )); then
  return 1
fi

# Aliases
alias as="aptitude -F \"* %p -> %d \n(%v/%V)\" --no-gui --disable-columns search" # Searches for a package.
alias ad="sudo apt-get update"                                                    # Updates packages lists.
alias au="sudo apt-get update && sudo apt-get dselect-upgrade"                    # Upgrades packages.
alias ai="sudo apt-get install"                                                   # Installs package.
alias ar="sudo apt-get remove --purge && sudo apt-get autoremove --purge"         # Removes package.
alias ap="apt-cache policy"                                                       # Prints pinning levels.
alias av="apt-cache show"                                                         # Shows package info.
alias acs="apt-cache search"                                                      # Searches for a package.
alias ac="sudo apt-get clean && sudo apt-get autoclean"                           # Cleans cache.
alias afs='apt-file search --regexp'                                              # Finds a file's packake.

# Installs all .deb files in the current directory.
# WARNING: You will need to put the glob in single quotes if you use GLOB_SUBST.
alias debi='su -c "dpkg -i ./*.deb"'

# Creates a basic .deb package.
alias debc='time dpkg-buildpackage -rfakeroot -us -uc'

# Removes ALL kernel images and headers EXCEPT the one in use.
alias kclean='su -c '\''aptitude remove -P ?and(~i~nlinux-(ima|hea) ?not(~n`uname -r`))'\'' root'

