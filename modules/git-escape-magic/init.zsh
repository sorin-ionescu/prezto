# Add git-escape-magic to $fpath
fpath=("${0:h}/external" $fpath)

autoload -Uz git-escape-magic && git-escape-magic
