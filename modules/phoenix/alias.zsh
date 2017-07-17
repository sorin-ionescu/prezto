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
alias kid='kiex default'
alias kii='kiex install'
alias kil='kiex list'
alias kilb='kiex list branches'
alias kilk='kiex list known'
alias kilr='kiex list releases'
alias kis='kiex shell'
alias kisu='kiex selfupdate'
alias kiu='kiex use'