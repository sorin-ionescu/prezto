Precompile - prezto zrecompile
======

This module compile all the parrent directories found in $fpath if writable.
Or else, a '-s|--system-fpath' switch is available for priviledged users to
(re)compile system wide functions/scripts to improve loading and execution.

Settings
--------

This module support a single setting at the moment, a string that hold
*precompile* command line options.

    zstyle ':prezto:module:precompile' options '-f -s'

'-f|--fpath-append' enable appending/replacing *element* parent directory with
*element.zwc* to get another loading/execution speed improvement.

zrecompile extra options (like *-M* option handy for scripts compilation) can be
appended to that string as well.

Runtime (re)compilation
-------

Of course, *precompile* function is available at runtime, so it is available to
inspect and reompile directory if necessary. Unchanged directory will not be
recompiled. Just expect a little delay the first time the module is enabled.

Authors
-------

  - [tokiclover](https://github.com/tokiclover)

