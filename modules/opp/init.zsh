# Vim's text-objects-ish for zsh.

# Author: Takeshi Banse <takebi@laafc.net>
# License: Public Domain

# Thank you very much, Bram Moolenaar!
# I want to use the Vim's text-objects in zsh.
if [[ ! -f ${0:h}/functions/opp.zwc ]] ||
   [[ ! -f ${0:h}/functions/opp-install.zwc ]]; then
  (
    . "${0:h}/external/opp.zsh"
    . "${0:h}/external/opp/surround.zsh"
    . "${0:h}/external/opp/textobj-between.zsh"
    opp-zcompile "${0:h}/external/opp.zsh" ${0:h}/functions > /dev/null
  )
  fpath+=${0:h}/functions > /dev/null
  . ${0:h}/functions/opp-install
  autoload opp
fi
opp-install
