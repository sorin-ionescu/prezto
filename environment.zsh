#
# Sets general shell options and defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Smart URLs
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# General
setopt RC_QUOTES          # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'.
unsetopt MAIL_WARNING     # Don't print a warning message if a mail file has been accessed

# Jobs
setopt LONG_LIST_JOBS     # List jobs in the long format by default.
setopt AUTO_RESUME        # Attempt to resume existing job before creating a new process.
setopt NOTIFY             # Report status of background jobs immediately.
unsetopt BG_NICE          # Don't run all background jobs at a lower priority.
unsetopt HUP              # Don't kill jobs on shell exit.
unsetopt CHECK_JOBS       # Don't report on jobs when shell exit.

# PATH
typeset -U cdpath fpath infopath manpath path

cdpath=(
  $HOME
  $HOME/Developer
)

infopath=(
  $HOME/.tilde/share/info
  $HOME/.tilde/opt/share/info
  /usr/local/share/info
  /usr/share/info
)

manpath=(
  $HOME/.tilde/share/man
  $HOME/.tilde/opt/share/man
  /usr/local/share/man
  /usr/share/man
)

for path_file in /etc/manpaths.d/*(.N); do
  manpath+=($(<$path_file))
done

path=(
  $HOME/.tilde/bin
  $HOME/.tilde/opt/bin
  /usr/local/bin
  /usr/local/sbin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
)

for path_file in /etc/paths.d/*(.N); do
  path+=($(<$path_file))
done

# Language
export LANG="en_US.UTF-8"
export LC_ALL="$LANG"
export LC_COLLATE="$LANG"
export LC_CTYPE="$LANG"
export LC_MESSAGES="$LANG"
export LC_MONETARY="$LANG"
export LC_NUMERIC="$LANG"
export LC_TIME="$LANG"

# Editors
export EDITOR="vim"
export VISUAL="vim"
export PAGER='less'

# Grep
if zstyle -t ':omz:environment:grep' color; then
  export GREP_COLOR='37;45'
  export GREP_OPTIONS='--color=auto'
fi

# Browser (Default)
if (( $+commands[xdg-open] )); then
  export BROWSER='xdg-open'
fi

if (( $+commands[open] )); then
  export BROWSER='open'
fi

# Less
export LESSCHARSET="UTF-8"
export LESSHISTFILE='-'
export LESSEDIT='vim ?lm+%lm. %f'
export LESS='-F -g -i -M -R -S -w -X -z-4'

if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

# Termcap
if zstyle -t ':omz:environment:termcap' color; then
  export LESS_TERMCAP_mb=$'\E[01;31m'      # begin blinking
  export LESS_TERMCAP_md=$'\E[01;31m'      # begin bold
  export LESS_TERMCAP_me=$'\E[0m'          # end mode
  export LESS_TERMCAP_se=$'\E[0m'          # end standout-mode
  export LESS_TERMCAP_so=$'\E[00;47;30m'   # begin standout-mode
  export LESS_TERMCAP_ue=$'\E[0m'          # end underline
  export LESS_TERMCAP_us=$'\E[01;32m'      # begin underline
fi

