Python
======

Enables local Python builds and package installation.

Local Python builds
-------------------

[pythonz][6] builds and installs multiple Python versions locally in the home
directory. It supports CPython, Stackless Python, Jython and PyPy.

This module prepends the pythonz directory to the path variable to make
`pythonz` available.

### Usage

Install Python versions with `pythonz install` into into `~/.pythonz/pythons`.
To make these Python versions generally available, add symbolic links to
`~/.pythonz/bin`.


Local Package Installation
--------------------------

Since version 2.6, Python supports per user package installation, as defined in
[PEP 370][1].

This module prepends per user site directories to the relevant path variables
to enable the execution of user installed scripts and the reading of
documentation.

### Usage

Install packages into the per user site directory with `easy_install --user` or
`pip install --user`.

virtualenvwrapper
-----------------

[virtualenvwrapper][2] is a frontend to the popular [virtualenv][3] utility.

virtualenv creates isolated Python environments and virtualenvwrapper provides
convenient shell functions to create, switch, and manage them.

### Usage

Install virtualenvwrapper and set [`$WORKON_HOME`][4] to the path where virtual
environments will be stored.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][5].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)
  - [Sebastian Wiesner](https://github.com/lunaryorn)

[1]: http://www.python.org/dev/peps/pep-0370/
[2]: http://www.doughellmann.com/projects/virtualenvwrapper/
[3]: http://pypi.python.org/pypi/virtualenv
[4]: http://www.doughellmann.com/docs/virtualenvwrapper/#introduction
[5]: https://github.com/sorin-ionescu/oh-my-zsh/issues
[6]: http://saghul.github.com/pythonz/
