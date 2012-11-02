#
# Create aliases for hosts defined in ~/.ssh/config
#
# Authors:
#   Roey Darwish Dror <roey.ghost@gmail.com>
#

local x
for x in $(grep 'Host ' ~/.ssh/config | awk '{ print $2 }'); do
    alias $x="ssh $x"
done
