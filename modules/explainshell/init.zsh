#
# Adds a explain function and explainshell widget
# 
# Authors
#   C Lentfort
#


function explain {
  # base url with first command already injected
  # $ explain tar
  #   => http://explainshel.com/explain/tar?args=
  url="http://explainshell.com/explain/$1?args="
  
  # removes $1 (tar) from arguments ($@)
  shift;
  
  # iterates over remaining args and adds builds the rest of the url
  for i in "$@"; do
    url=$url"$i""+"
  done
  
  # opens url in browser
  $BROWSER -t $url &> /dev/null
}

function explainshell {
    explain $BUFFER
}

zle -N explainshell

zstyle -s ':prezto:module:explainshell' key-binding 'key_binding'
if [[ -n "$key_binding" ]]; then
  bindkey "$key_binding" explainshell
fi

unset key_binding
