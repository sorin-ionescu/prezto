#
# A simple theme from PeepCode.
# http://peepcode.com/blog/2012/my-command-line-prompt
#
# Authors:
#   Geoffrey Grosenbach <boss@topfunky.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Screenshots:
#   http://i.imgur.com/LhgmW.png
#

function +vi-git-status() {
  # Check for untracked files or updated submodules since vcs_info does not.
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    hook_com[unstaged]=' %F{8}✗%f'
  fi
}

function prompt_peepcode_precmd {
  vcs_info

  if (( $+functions[ruby-info] )); then
    ruby-info
  fi
}

function prompt_peepcode_setup {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS
  prompt_opts=(cr percent subst)

  # Load required functions.
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  # Add hook for calling vcs_info before each command.
  add-zsh-hook precmd prompt_peepcode_precmd

  # Set vcs_info parameters.
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' check-for-changes true
  zstyle ':vcs_info:*' get-revision true
  zstyle ':vcs_info:*' use-simple true
  zstyle ':vcs_info:*' unstagedstr ' %F{8}✗%f'
  zstyle ':vcs_info:*' formats ' %F{8}%b%f %F{white}%.7i%f%u'
  zstyle ':vcs_info:*' actionformats ' %F{8}%b%f %F{white}%.7i%f +%a%u'
  zstyle ':vcs_info:git*+set-message:*' hooks git-status

  # Set ruby-info parameters.
  zstyle ':prezto:module:ruby:info:version' format ' %F{white}%v%f'

  # Define prompts.
  PROMPT="
%~
%(?.%F{green}${1:-☻ }%f.%F{red}${1:-☻ }%f) "
RPROMPT='${ruby_info[version]}${vcs_info_msg_0_}'

}

function prompt_peepcode_help {
  cat <<EOH
This prompt's last command exit status symbol is customizable:

  prompt peepcode [<symbol>]

If this option is not provided, the symbol defaults to ☻.
EOH
}

function prompt_peepcode_preview {
  local +h PROMPT='%# '
  local +h RPROMPT=''
  local +h SPROMPT=''

  if (( $# > 0 )); then
    prompt_preview_theme 'peepcode' "$@"
  else
    prompt_preview_theme 'peepcode'
    print
    prompt_preview_theme 'peepcode' "❯"
    print
    prompt_preview_theme 'peepcode' "$"
  fi
}

prompt_peepcode_setup "$@"
