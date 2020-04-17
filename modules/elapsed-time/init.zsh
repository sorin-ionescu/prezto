#
# Provides elapsed time information
#
# Authors:
#   Salamandar <felix@piedallu.me>
#

_elapsed_time_start_time=$SECONDS

_elapsed_time_min_seconds=5

function elapsed-time-start {
    _elapsed_time_start_time=$SECONDS
}

function elapsed-time-end {
  local end_time=$(( SECONDS - _elapsed_time_start_time ))
  local hours minutes seconds remainder

  if (( end_time >= 3600 )); then
    hours=$(( end_time / 3600 ))
    remainder=$(( end_time % 3600 ))
    minutes=$(( remainder / 60 ))
    seconds=$(( remainder % 60 ))
    print -P "%B%F{red}>>> elapsed time ${hours}h${minutes}m${seconds}s%b"
  elif (( end_time >= 60 )); then
    minutes=$(( end_time / 60 ))
    seconds=$(( end_time % 60 ))
    print -P "%B%F{yellow}>>> elapsed time ${minutes}m${seconds}s%b"
  elif (( end_time > ${_elapsed_time_min_seconds} )); then
    print -P "%B%F{green}>>> elapsed time ${end_time}s%b"
  fi
}

add-zsh-hook preexec elapsed-time-start
add-zsh-hook precmd  elapsed-time-end
