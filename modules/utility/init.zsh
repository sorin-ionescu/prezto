#
# Defines general aliases and functions.
#
# Authors:
#   Robby Russell <robby@planetargon.com>
#   Suraj N. Kurapati <sunaku@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
omodload 'spectrum'

# Correct commands.
setopt CORRECT

# Aliases

# The 'ls' Family
if is-callable 'dircolors'; then
  # GNU core utilities.
  alias ls='ls --group-directories-first'

  if zstyle -t ':omz:module:utility:ls' color; then
    if [[ -s "$HOME/.dir_colors" ]]; then
      eval "$(dircolors "$HOME/.dir_colors")"
    else
      eval "$(dircolors)"
    fi
    alias ls="$aliases[ls] --color=auto"
  else
    alias ls="$aliases[ls] -F"
  fi
else
  # BSD core utilities.
  if zstyle -t ':omz:module:utility:ls' color; then
    export LSCOLORS="exfxcxdxbxegedabagacad"
    alias ls="ls -G"
  else
    alias ls='ls -F'
  fi
fi

alias l='ls -1A'         # List in one column.
alias ll='ls -lh'        # List human readable sizes.
alias lr='ll -R'         # List recursively.
alias la='ll -A'         # List hidden files.
alias lp='la | "$PAGER"' # List through pager.
alias lx='ll -XB'        # List sorted by extension.
alias lk='ll -Sr'        # List sorted by size, largest last.
alias lt='ll -tr'        # List sorted by date, most recent last.
alias lc='lt -c'         # List sorted by date, most recent last, show change time.
alias lu='lt -u'         # List sorted by date, most recent last, show access time.
alias sl='ls'            # I often screw this up.

# General
alias _='sudo'
alias b='${(z)BROWSER}'
alias cd='nocorrect cd'
alias cp='nocorrect cp -i'
alias df='df -kh'
alias du='du -kh'
alias e='${(z)EDITOR}'
alias find='noglob find'
alias fc='noglob fc'
alias gcc='nocorrect gcc'
alias history='noglob history'
alias ln='nocorrect ln -i'
alias locate='noglob locate'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir -p'
alias mv='nocorrect mv -i'
alias p='${(z)PAGER}'
alias po='popd'
alias pu='pushd'
alias rake='noglob rake'
alias rm='nocorrect rm -i'
alias scp='nocorrect scp'
alias type='type -a'

# Mac OS X
if [[ "$OSTYPE" == darwin* ]]; then
  alias o='open'
  alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
else
  alias o='xdg-open'
  alias get='wget --continue --progress=bar --timestamping'

  if (( $+commands[xclip] )); then
    alias pbcopy='xclip -selection clipboard -in'
    alias pbpaste='xclip -selection clipboard -out'
  fi

  if (( $+commands[xsel] )); then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
  fi
fi

alias pbc='pbcopy'
alias pbp='pbpaste'

# Top
if (( $+commands[htop] )); then
  alias top=htop
else
  alias topm='top -o vsize'
  alias topc='top -o cpu'
fi

# Miscellaneous
alias afind='nocorrect ack'
alias ebuild='nocorrect ebuild'
alias gist='nocorrect gist'
alias heroku='nocorrect heroku'
alias mysql='nocorrect mysql'

# Serves a directory via HTTP.
alias http-serve='python -m SimpleHTTPServer'

# Displays user owned processes status.
alias pmine='ps -U "$USER" -o pid,%cpu,%mem,command'

# Functions

# Makes a directory and changes to it.
function mkdcd {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

# Changes to a directory and lists its contents.
function cdls {
  builtin cd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}

# Pushes an entry onto the directory stack and lists its contents.
function pushdls {
  builtin pushd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}

# Pops an entry off the directory stack and lists its contents.
function popdls {
  builtin popd "$argv[-1]" && ls "${(@)argv[1,-2]}"
}

# Prints columns 1 2 3 ... n.
function slit {
  awk "{ print ${(j:,:):-\$${^@}} }"
}

# Finds files and executes a command on them.
function find-exec {
  find . -type f -iname "*${1:-}*" -exec "${2:-file}" '{}' \;
}

