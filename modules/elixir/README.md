Elixir
=============

Defines [Elixir][1] aliases.

Aliases
-------

 - `i`='iex' runs interactive elixir
 - `ips`='iex -S mix phoenix.server' runs iex in phoenix app
 - `ism`='iex -S mix' runs iex in current elixir package

 - `m`='mix' runs the default task
 - `mr`='mix run' runs the given file or expression
 - `mrnh`='mix run --no-halt' does not halt the system after running the command
 - `mrl`='mix release' build an executable release (require [distillery](https://github.com/bitwalker/distillery))
 - `mt`='mix test' runs a project's tests
 - `mts`='mix test --stale' runs only tests which reference modules that changed since the last `test --stale`
 - `mx`='mix xref' performs cross reference checks

 - `mn`='mix new' creates a new Elixir project
 - `mns`='mix new --sup' creates a new Elixir project with a supervision tree
 - `mat`='mix app.tree' prints the application tree

 - `mab`='mix archive.build' archives this project into a .ez file
 - `mai`='mix archive.install' installs an archive locally

 - `mc`='mix compile' compiles source files
 - `mcv`='mix compile --verbose' compiles source files with verbose mode
 - `mcx`='mix compile.xref' performs remote dispatch checking

 - `mcr`='mix credo' analyze static code
 - `mcrs`='mix credo --strict'

 - `mdc`='mix deps.compile' compiles dependencies
 - `mdg`='mix deps.get' gets all out of date dependencies
 - `mdt`='mix deps.tree' prints the dependency tree
 - `mdu`='mix deps.update' updates the given dependencies
 - `mdua`='mix deps.update --all' updates all dependencies
 - `mdun`='mix deps.unlock' unlocks the given dependencies
 - `mduu`='mix deps.unlock --unused' unlocks unused dependencies
 - `mdgc`='mix do deps.get, deps.compile' get all dependencies then compiles them

 - `meb`='mix escript.build' builds an escript for the project
 - `mho`='mix hex.outdated' shows outdated Hex deps for the current projects
 - `mlh`='mix local.hex' installs Hex locally

Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Han Ngo](https://github.com/tieubao)


[1]: https://elixir-lang.org
[2]: https://github.com/sorin-ionescu/prezto/issues
