Autoenv
=======

Provides integration for the [autoenv][1] shell environment settings
tool.

Settings
--------

By default this plugin finds autoenv as it's installed by Mac homebrew,
in `/usr/local/opt/autoenv/activate.sh`. To find the autoenv script in
another location, add the following line to *zpreztorc*:

    zstyle ':prezto:module:autoenv' script PATH_TO_AUTOENV_ACTIVATE

[1]: https://github.com/kennethreitz/autoenv
