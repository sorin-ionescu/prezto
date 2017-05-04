#
# Enable Sublime Text
#
# Authors:
#   Patrick Baker <patricksbaker@gmail.com>
#   Modified version from oh-my-zsh
#   Original: https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/sublime/sublime.plugin.zsh
#
local _sublime_darwin_paths
_sublime_darwin_paths=(
  /Applications/Sublime\ Text*/Contents/SharedSupport/bin/subl
)

if [[ "$OSTYPE" == linux* ]]; then
    if [ -f '/usr/bin/sublime_text' ]; then
        alias st=st_run
        st_run() { nohup /usr/bin/sublime_text $@ > /dev/null & }
    fi
elif  [[ "$OSTYPE" == darwin* ]]; then
    for _sublime_path in ${_sublime_darwin_paths}; do
        if [[ -a "${_sublime_path}" ]]; then
            alias subl="'${_sublime_path}'"
            alias st=subl
            break
        fi
    done
fi

alias stt='st .'
