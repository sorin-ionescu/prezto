Phoenix Framework
=============

Defines [Elixir Phoenix][1] aliases.

Aliases
-------

 - `mpn`='mix phoenix.new'
 - `mpr`='mix phoenix.routes'
 - `mps`='mix phoenix.server'

 - `mpgc`='mix phoenix.gen.channel' generates a Phoenix channel
 - `mpgh`='mix phoenix.gen.html' generates controller, views, and context for an HTML resource
 - `mpgj`='mix phoenix.gen.json' generates controller, views, and context for a JSON resource
 - `mpgm`='mix phoenix.gen.model' generates an Ecto model in your Phoenix application
 - `mpgs`='mix phoenix.gen.secret' generates a secret

 - `mec`='mix ecto.create' creates the repository storage
 - `med`='mix ecto.drop' drops the repository storage
 - `mem`='mix ecto.migrate' runs the repository migrations
 - `megm`='mix ecto.gen.migration' generates a new migration for the repo
 - `merb`='mix ecto.rollback' rolls back the repository migrations
 - `mecm`='mix do ecto.create, ecto.migrate' creates the repository storage then start migration

 - `kd`='kiex default' sets default elixir version with specific version
 - `ki`='kiex install' installs a known release or branch
 - `kl`='kiex list' lists installed versions
 - `klb`='kiex list branches' lists current branches
 - `klk`='kiex list known' lists known releases
 - `klr`='kiex list releases' lists known releases
 - `ks`='kiex shell' uses sub-shell with specific elixir version
 - `ksu`='kiex selfupdate' upgrades kiex
 - `ku`='kiex use' use specific elixir version

Authors
-------

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Han Ngo](https://github.com/tieubao)


[1]: http://www.phoenixframework.org
[2]: https://github.com/sorin-ionescu/prezto/issues
