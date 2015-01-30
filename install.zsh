#
# Install Prezto by creating a bunch of symlinks.
#
# Authors:
#   Adrien Bak <adrien.bak@gmail.com>
#

#get the folder containing this script
install_folder=${0:a:h}

setopt EXTENDED_GLOB

if [[ $1 == "--dry-run" ]]; then
	dryrun=true
	echo 'Dry-Run'
else
	dryrun=false
fi

for rcfile in "${install_folder}"/runcoms/^README.md(.N); do
	target="$rcfile"
	symlink="${ZDOTDIR:-$HOME}/.${rcfile:t}"

	if $dryrun ; then
		echo "${symlink} --> ${target}"
	else
		ln -s ${target} ${symlink}
	fi

done

