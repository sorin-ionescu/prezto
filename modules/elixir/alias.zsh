#
# Defines Mix Elixir aliases.
#
# Authors:
#   Han Ngo <nntruonghan@gmail.com>
#

# IEx
alias i='iex'
alias ips='iex -S mix phoenix.server'
alias ism='iex -S mix'

# Mix
alias m='mix'
alias mr='mix run'
alias mrnh='mix run --no-halt'
alias mrl='mix release'
alias mt='mix test'
alias mts='mix test --stale'
alias mtw='mix test.watch'
alias mx='mix xref'

alias mn='mix new'
alias mns='mix new --sup'
alias mat='mix app.tree'

alias mab='mix archive.build'
alias mai='mix archive.install'

alias mc='mix compile'
alias mcv='mix compile --verbose'
alias mcx='mix compile.xref'

alias mcr='mix credo'
alias mcrs='mix credo --strict'

alias mdc='mix deps.compile'
alias mdg='mix deps.get'
alias mdu='mix deps.update'
alias mdt='mix deps.tree'
alias mdua='mix deps.update --all'
alias mdun='mix deps.unlock'
alias mduu='mix deps.unlock --unused'
alias mdgc='mix do deps.get, deps.compile'

alias meb='mix escript.build'
alias mho='mix hex.outdated'
alias mlh='mix local.hex'

mncd() {
  arg="$*"
  mix new "$arg";cd "$arg";
}