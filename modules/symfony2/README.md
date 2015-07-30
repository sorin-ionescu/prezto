Symfony2
=============

Defines [Symfony2][1] basic command aliases and enables command completion.
This module ported from the symfony2 plugin of oh-my-zsh.
Refs: https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/symfony2/symfony2.plugin.zsh

Aliases
-------

  - `sf` is short for `php app/console`.
  - `sfcl` clears the application cache for a given environment.
  - `sfsr` runs PHP built-in web server.
  - `sfcw` warms up the cache.
  - `sfroute` displays the configured routes.
  - `sfcontaoainer` displays all configured public services.
  - `sfgb` helps you generates new bundles.

*The authors of this module should be contacted via the [issue tracker][2].*

  - [Robby Russell](https://github.com/robbyrussell)
  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://symfony.com

sf='`_symfony_console`'
sfcl='sf cache:clear'
sfsr='sf server:run -vvv'
sfcw='sf cache:warmup'
sfroute='sf router:debug'
sfcontainer='sf container:debug'
sfgb='sf generate:bundle'
