Python
======

Enables local Python and local Python package installation.

Local Python Installation
-------------------------

[pyenv][4] builds and installs multiple Python versions locally in the home
directory.

This module prepends the pyenv directory to the path variable to enable the
execution of `pyenv`.

### Usage

Install Python versions with `pyenv install` into *~/.pyenv/versions*.

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

Install virtualenvwrapper.

Virtual environments are stored in *~/.virtualenvs*.

There are configuration variables that have to be set to enable certain features.
If you wish to use these features, export the variables in *~/.zshenv*

The variable `$PROJECT_HOME` tells virtualenvwrapper where to place project
working directories. It must be set and the directory created before `mkproject`
is used. Replace *Developer* with your projects directory.

    export PROJECT_HOME="$HOME/Developer"

The variable `$VIRTUALENVWRAPPER_VIRTUALENV_ARGS` tells virtualenvwrapper what
arguments to pass to `virtualenv`. For example, set the value to
*--no-site-packages* to ensure that all new environments are isolated from the
system site-packages directory.

    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

### Settings

#### Lazy loading

By default, virtualenvwrapper is loaded in lazy mode. This behaviour can be disabled adding the following line to *~/.zpreztorc*:

    zstyle ':prezto:module:python' lazy_venv 'no'

#### Automatic virtualenv initialization

To enable autoenv, add the following line to *~/.zpreztorc*:

    zstyle ':prezto:module:python' autoenv 'yes'

If a virtualenv is active, and was not activated by autoenv, then autoenv does nothing.
Otherwise, autoenv activated or deactivates a virtual environment whenever a directory is changed; based on the following priority:

    1. Name specified in a file named *.venv* in the cwd.
    2. *.venv* file in git root. If folder is inside git repository.
    3. Name of git root folder.
    4. No virtualenv.


Aliases
-------

  - `py` is short for `python`.

Functions
---------

  - `python-info` exposes information about the Python environment via the
    `$python_info` associative array.

Theming
-------

To display the name of the current virtual enviroment in a prompt, define the
following style in the `prompt_name_setup` function.

    # %v - virtualenv name.
    zstyle ':prezto:module:python:info:virtualenv' format 'virtualenv:%v'

Then add `$python_info[virtualenv]` to `$PROMPT` or `$RPROMPT` and call
`python-info` in the `prompt_name_preexec` hook function.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][5].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)
  - [Sebastian Wiesner](https://github.com/lunaryorn)

[1]: http://www.python.org/dev/peps/pep-0370/
[2]: http://www.doughellmann.com/projects/virtualenvwrapper/
[3]: http://pypi.python.org/pypi/virtualenv
[4]: https://github.com/yyuu/pyenv
[5]: https://github.com/sorin-ionescu/prezto/issues
