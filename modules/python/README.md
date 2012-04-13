Python
======

Enables local Python package installation (see [PEP 370][1]) and
[_virtualenvwrapper_][2], if installed.

This module will prepend the per user site packages directory as defined in [PEP
370][1] to `$path` and `$manpath` so that you can run Python scripts and read
man pages installed into the per user site.

It also sources the [_virtualenvwrapper_][2] initialization script, if
[_virtualenvwrapper_][2] is installed.  [_virtualenvwrapper_][2] is a frontend
to [_virtualenv_][3] which provides convenient shell functions to create, switch
and manage virtualenvs.

Authors
-------

*The authors of this module should be contacted via the github bug tracker.*

 - [Sorin Ionescu](/sorin-ionescu)
 - [Sebastian Wiesner](/lunaryorn)

[1]: http://www.python.org/dev/peps/pep-0370/
[2]: http://www.doughellmann.com/projects/virtualenvwrapper/
[3]: http://pypi.python.org/pypi/virtualenv
