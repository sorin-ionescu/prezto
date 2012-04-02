#
# Provides for the interactive usage of GNU Coreutils on BSD systems.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Check for the presence of GNU Core Utilities.
if (( ! $+commands[gdircolors] )); then
  return 1
fi

function _gnu-utils-hash-commands {
  emulate -L zsh
  local gcmds
  local gcmd
  local cmd
  local prefix

  gcmds=(
    # Coreutils
    'g[' 'gbase64' 'gbasename' 'gcat' 'gchcon' 'gchgrp' 'gchmod' 'gchown'
    'gchroot' 'gcksum' 'gcomm' 'gcp' 'gcsplit' 'gcut' 'gdate' 'gdd' 'gdf'
    'gdir' 'gdircolors' 'gdirname' 'gdu' 'gecho' 'genv' 'gexpand' 'gexpr'
    'gfactor' 'gfalse' 'gfmt' 'gfold' 'ggroups' 'ghead' 'ghostid' 'gid'
    'ginstall' 'gjoin' 'gkill' 'glink' 'gln' 'glogname' 'gls' 'gmd5sum'
    'gmkdir' 'gmkfifo' 'gmknod' 'gmktemp' 'gmv' 'gnice' 'gnl' 'gnohup' 'gnproc'
    'god' 'gpaste' 'gpathchk' 'gpinee' 'gpr' 'gprintenv' 'gprintf' 'gptx'
    'gpwd' 'greadlink' 'grealpath' 'grm' 'grmdir' 'gruncon' 'gseq' 'gsha1sum'
    'gsha224sum' 'gsha256sum' 'gsha384sum' 'gsha512sum' 'gshred' 'gshuf'
    'gsleep' 'gsort' 'gsplit' 'gstat' 'gstty' 'gsum' 'gsync' 'gtac' 'gtail'
    'gtee' 'gtest' 'gtimeout' 'gtouch' 'gtr' 'gtrue' 'gtruncate' 'gtsort'
    'gtty' 'guname' 'gunexpand' 'guniq' 'gunlink' 'guptime' 'gusers' 'gvdir'
    'gwc' 'gwho' 'gwhoami' 'gyes'

    # The following are not part of Coreutils but installed separately.

    # Binutils
    'gaddr2line' 'gar' 'gc++filt' 'gelfedit' 'gnm' 'gobjcopy' 'gobjdump'
    'granlib' 'greadelf' 'gsize' 'gstrings' 'gstrip'

    # Findutils
    'gfind' 'glocate' 'goldfind' 'gupdatedb' 'gxargs'

    # Libtool
    'glibtool' 'glibtoolize'

    # Miscellaneous
    'ggetopt' 'ggrep' 'gindent' 'gsed' 'gtar' 'gtime' 'gunits' 'gwhich'
  )

  for gcmd in "$gcmds[@]"; do
    #
    # This method allows for builtin commands to be primary but it's
    # lost if hash -r or rehash -f is executed. Thus, those two
    # functions have to be wrapped.
    #
    if (( $+commands[$gcmd] )); then
      builtin hash "$gcmd[2,-1]"="$commands[$gcmd]"
    fi
  done

  return 0
}
_gnu-utils-hash-commands

function hash {
  if (( $+argv[(er)-r] )) || (( $+argv[(er)-f] )); then
    builtin hash "$@"
    _gnu-utils-hash-commands
  else
    builtin hash "$@"
  fi
}

function rehash {
  hash -r "$@"
}

# A sensible default for ls.
alias ls='ls --group-directories-first'

if zstyle -t ':omz:alias:ls' color; then
  if [[ -f "$HOME/.dir_colors" ]]; then
    eval "$(gdircolors "$HOME/.dir_colors")"
  else
    eval "$(gdircolors)"
  fi
  alias ls="$aliases[ls] --color=auto"
else
  alias ls="$aliases[ls] -F"
fi

