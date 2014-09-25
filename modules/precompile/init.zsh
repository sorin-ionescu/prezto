#
# p-as-prezto-recompile-as-zreompile module to re-compile
# functions/scripts on the fly to loading and execution
#
# $Header: precompile/init.zsh                           Exp $
# $Aythor: (c) 2014 -tclover <tokiclover@gmail.com>      Exp $
# $License: MIT (or 2-clause/new/simplified BSD)         Exp $
# $Version: 0.1 2014/09/24 21:09:26                      Exp $
#

zstyle -a ':prezto:module:precompile' options 'args'

(( $+functions[precompile] )) || autoload -Uz precompile && precompile $args[@]

unset args

#
# vim:fenc=utf-8:ft=zsh:ci:pi:sts=2:sw=2:ts=2:
#
