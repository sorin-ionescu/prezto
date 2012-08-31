#
# Maintains a frequently used directory list for fast directory changes.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Set the directory changing command.
_Z_CMD='j'

# Prevent symbolic link resolution.
_Z_NO_RESOLVE_SYMLINKS=1

# Source module files.
source "${0:h}/external/z.sh"

# Cleanup.
unset _Z_{CMD,NO_RESOLVE_SYMLINKS}

