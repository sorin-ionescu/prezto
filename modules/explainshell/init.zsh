#
# Adds a explain function and explainshell widget
# 
# Authors
#   C Lentfort
#

function _expand_alias_recursive {
  local _alias
  for word in "$@"; do
    # Check if word is aliased
    _alias=$aliases[$word]
    if [ -n "$_alias" ]; then
      # Check if found alias and given command are identical
      if [[ "$_alias" != "${(j: :)@}" ]]; then
        _expand_alias_recursive "${(z)_alias}"
      else
        _explainshell_expanded_buffer+=$1
      fi
    else
      _explainshell_expanded_buffer+=$word
    fi
  done
}

function explain {
  local url
  # We don't explain empty buffers
  if (( $# == 0 )); then
    return 1;
  fi

  # Replace aliases with their actual expansions
  _explainshell_expanded_buffer=()
  _expand_alias_recursive $@
  _explainshell_expanded_buffer=(${(u)_explainshell_expanded_buffer})
  # base url with first command already injected
  # $ explain tar
  #   => http://explainshel.com/explain/tar?args=
  url="http://explainshell.com/explain?cmd="

  # iterates over remaining args and adds builds the rest of the url
  for i in "$_explainshell_expanded_buffer"; do
    url=$url"$i""+"
  done

  unset _explainshell_expanded_buffer
  # opens url in browser
  $BROWSER -t $url &> /dev/null
}

function explainshell {
  explain ${(z)BUFFER}
}

zle -N explainshell

zstyle -s ':prezto:module:explainshell' key-binding 'key_binding'
if [[ -n "$key_binding" ]]; then
  bindkey "$key_binding" explainshell
fi

unset key_binding
