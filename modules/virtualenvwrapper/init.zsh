#
# Enables virtualenvwrapper if available.
#
# virtualenvwrapper is a utility to easily create, switch and manage Python
# virtualenvs. See http://www.doughellmann.com/projects/virtualenvwrapper/
#
# Authors:
#   Sebastian Wiesner <lunaryorn@googlemail.com>
#

if (( $+commands[virtualenvwrapper.sh] )); then
    source virtualenvwrapper.sh
fi
