# source environment as set by fish (~/.config/fish/config.fish)
tmp=`mktemp`
fish --login -c "/bin/sh -c 'export -p' > $tmp"
. $tmp
