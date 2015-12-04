#
# Defines Symfony2 basic command aliases and enables command completion.
#
# Authors:
#   longkey1 <longkey1@gmail.com>
#
# This module ported from the symfony2 plugin of oh-my-zsh.
#
# Refs:
#   https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/symfony2/symfony2.plugin.zsh
#

_symfony_console () {
  echo "php $(find . -maxdepth 2 -mindepth 1 -name 'console' -type f | head -n 1)"
}

_symfony_get_command_list () {
   `_symfony_console` --no-ansi | sed "1,/Available commands/d" | awk '/^  ?[a-z]+/ { print $1 }'
}

_symfony () {
   compadd `_symfony_get_command_list`
}

compdef _symfony '`_symfony_console`'
compdef _symfony 'app/console'
compdef _symfony 'bin/console'
compdef _symfony sf

#Alias
alias sf='`_symfony_console`'
alias sfcc='sf cache:clear'
alias sfsr='sf server:run -vvv'
alias sfcw='sf cache:warmup'
alias sfdc='sf debug:container'
alias sfdr='sf debug:router'
alias sfgb='sf generate:bundle'
