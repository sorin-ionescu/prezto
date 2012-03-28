#
# Provides for the interactive usage of GNU Coreutils on BSD systems.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Get the prefix or use the default.
zstyle -s ':omz:module:gnu-utils' prefix '_gnu_utils_prefix' ||
  _gnu_utils_prefix='g'

# Check for the presence of GNU Core Utilities.
if (( ! $+commands[${_gnu_utils_prefix}dircolors] )); then
  return 1
fi

function _gnu-utils-hash-commands {
  emulate -L zsh

  local cmds
  local cmd
  local pcmd

  cmds=(
    # Coreutils
    '[' 'base64' 'basename' 'cat' 'chcon' 'chgrp' 'chmod' 'chown'
    'chroot' 'cksum' 'comm' 'cp' 'csplit' 'cut' 'date' 'dd' 'df'
    'dir' 'dircolors' 'dirname' 'du' 'echo' 'env' 'expand' 'expr'
    'factor' 'false' 'fmt' 'fold' 'groups' 'head' 'hostid' 'id'
    'install' 'join' 'kill' 'link' 'ln' 'logname' 'ls' 'md5sum'
    'mkdir' 'mkfifo' 'mknod' 'mktemp' 'mv' 'nice' 'nl' 'nohup' 'nproc'
    'od' 'paste' 'pathchk' 'pinee' 'pr' 'printenv' 'printf' 'ptx'
    'pwd' 'readlink' 'realpath' 'rm' 'rmdir' 'runcon' 'seq' 'sha1sum'
    'sha224sum' 'sha256sum' 'sha384sum' 'sha512sum' 'shred' 'shuf'
    'sleep' 'sort' 'split' 'stat' 'stty' 'sum' 'sync' 'tac' 'tail'
    'tee' 'test' 'timeout' 'touch' 'tr' 'true' 'truncate' 'tsort'
    'tty' 'uname' 'unexpand' 'uniq' 'unlink' 'uptime' 'users' 'vdir'
    'wc' 'who' 'whoami' 'yes'

    # The following are not part of Coreutils but installed separately.

    # Binutils
    'addr2line' 'ar' 'c++filt' 'elfedit' 'nm' 'objcopy' 'objdump'
    'ranlib' 'readelf' 'size' 'strings' 'strip'

    # Findutils
    'find' 'locate' 'oldfind' 'updatedb' 'xargs'

    # Libtool
    'libtool' 'libtoolize'

    # Miscellaneous
    'getopt' 'grep' 'indent' 'sed' 'tar' 'time' 'units' 'which'
  )

  for cmd in "$cmds[@]"; do
    #
    # This method allows for builtin commands to be primary but it's
    # lost if hash -r or rehash -f is executed. Thus, those two
    # functions have to be wrapped.
    #
    pcmd="${_gnu_utils_prefix}${cmd}"
    if (( $+commands[$pcmd] )); then
      builtin hash "$cmd"="$commands[$pcmd]"
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
    eval "$(dircolors "$HOME/.dir_colors")"
  else
    eval "$(dircolors)"
  fi
  alias ls="$aliases[ls] --color=auto"
else
  alias ls="$aliases[ls] -F"
fi

