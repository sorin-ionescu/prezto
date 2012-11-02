local x
for x in $(grep 'Host ' ~/.ssh/config | awk '{ print $2 }'); do
    alias $x="ssh $x"
done
