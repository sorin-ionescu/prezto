#
# Defines rsync aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Aliases
rsync_cmd='rsync --verbose --progress --human-readable --compress --archive --hard-links --one-file-system'

# Mac OS X and HFS+ Enhancements
# http://www.bombich.com/rsync.html
if [[ "$OSTYPE" == darwin* ]] && grep -q 'file-flags' <(rsync --help 2>&1); then
  rsync_cmd="${rsync_cmd} --crtimes --acls --xattrs --fileflags --protect-decmpfs --force-change"
fi

alias rsync-copy="${rsync_cmd}"
alias rsync-move="${rsync_cmd} --remove-source-files"
alias rsync-update="${rsync_cmd} --update"
alias rsync-synchronize="${rsync_cmd} --update --delete"

unset rsync_cmd

