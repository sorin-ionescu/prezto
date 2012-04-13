Python
======

Enables local Python package installation (see [PEP 370][1]) and
[_virtualenvwrapper_][2], if installed.

Local package installation
--------------------------

Since version 2.6 Python supports per user package installation into a per user
site as defined in [PEP 370][1].

This module prepends the scripts directory of the per user site
to `$path` so that you can run Python scripts from per user packages.  It also
prepends the man directories from the per user site to `$manpath` to make
documentation of per user packages available.

You can install packages into the per user site with `easy_install --user` or
`pip install --user`.

[_virtualenvwrapper_][2] support
--------------------------------

[_virtualenvwrapper_][2] is a frontend to the popular [_virtualenv_][3] utility.
_virtualenv_ creates isolated Python environments and _virtualenvwrapper_
provides convenient shell functions to create, switch and manage such
environments.

If _virtualenvwrapper_ is installed and the `$WORKON_HOME` environment variable
is set, this module sources the _virtualenvwrapper_ initialization script to
enable _virtualenvwrapper_.

Authors
-------

*The authors of this module should be contacted via the github bug tracker.*

 - [Sorin Ionescu](/sorin-ionescu)
 - [Sebastian Wiesner](/lunaryorn)

[1]: http://www.python.org/dev/peps/pep-0370/
[2]: http://www.doughellmann.com/projects/virtualenvwrapper/
[3]: http://pypi.python.org/pypi/virtualenv
