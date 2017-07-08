#
# Defines Mix Elixir & Phoenix aliases.
#
# Authors:
#   Han Ngo <nntruonghan@gmail.com>
#

# Mix Phoenix
alias mpn='mix phoenix.new'
alias mpr='mix phoenix.routes'
alias mps='mix phoenix.server'

alias mpgc='mix phoenix.gen.channel'
alias mpgh='mix phoenix.gen.html'
alias mpgj='mix phoenix.gen.json'
alias mpgm='mix phoenix.gen.model'
alias mpgs='mix phoenix.gen.secret'

# Mix Ecto
alias mec='mix ecto.create'
alias med='mix ecto.drop'
alias mem='mix ecto.migrate'
alias megm='mix ecto.gen.migration'
alias merb='mix ecto.rollback'
alias mers='mix ecto.reset'
alias mes='mix ecto.setup'
alias mecm='mix do ecto.create, ecto.migrate'

# Kiex - Elixir Version Manager: https://github.com/taylor/kiex
alias kd='kiex default'
alias ki='kiex install'
alias kl='kiex list'
alias klb='kiex list branches'
alias klk='kiex list known'
alias klr='kiex list releases'
alias ks='kiex shell'
alias ksu='kiex selfupdate'
alias ku='kiex use'