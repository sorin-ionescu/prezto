# Python

Enables local Python and local Python package installation.

## Settings

This module supports virtual environments from conda and
[_virtualenvwrapper_][2]. By default, only _virtualenvwrapper_ is enabled. To
disable _virtualenvwrapper_, add the following to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_.

```sh
zstyle ':prezto:module:python:virtualenv' initialize 'no'
```

Conda support can be enabled by adding the following to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_.

```sh
zstyle ':prezto:module:python' conda-init 'on'
```

Caution: using conda and virtualenvwrapper at the same time may cause conflicts.

## Local Python Installation

[_pyenv_][4] builds and installs multiple Python versions locally in the home
directory.

This module prepends the _pyenv_ directory to the path variable to enable the
execution of `pyenv`.

### Usage

Install Python versions with `pyenv install` into _`~/.pyenv/versions`_.

This will be loaded automatically if pyenv is installed to `$PYENV_ROOT`,
_`~/.pyenv`_, or if the `pyenv` command is on the path. By default, `PYENV_ROOT`
is set to _`$HOME/.pyenv`_. You can set it to an alternate location and export
it in [_`${ZDOTDIR:-$HOME}/.zshenv`_][6].

## Local Package Installation

Since version 2.6, Python supports per user package installation, as defined in
[PEP 370][1].

This module prepends per user site directories to the relevant path variables
to enable the execution of user installed scripts and the reading of
documentation.

### Usage

Install packages into the per user site directory with `pip install --user`.

## virtualenvwrapper

[_virtualenvwrapper_][2] is a frontend to the popular [_virtualenv_][3] utility.

`virtualenv` creates isolated Python environments and `virtualenvwrapper`
provides convenient shell functions to create, switch, and manage them.

### Usage

Install `virtualenvwrapper`.

Virtual environments are stored in _`~/.virtualenvs`_.

There are configuration variables that have to be set to enable certain
features. If you wish to use these features, export the variables in
[_`${ZDOTDIR:-$HOME}/.zshenv`_][6].

The variable `$PROJECT_HOME` tells `virtualenvwrapper` where to place project
working directories. It must be set and the directory created before `mkproject`
is used. Replace _Developer_ with your projects directory.

```sh
export PROJECT_HOME="$HOME/Developer"
```

The variable `VIRTUALENVWRAPPER_PYTHON` tells `virtualenvwrapper` to use the
specified full path of the `python` interpreter overriding the `$PATH` search.

```sh
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
```

The variable `VIRTUALENVWRAPPER_VIRTUALENV` tells `virtualenvwrapper` to use the
specified full path of `virtualenv` binary overriding the `$PATH` search.

```sh
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
```

The variable `$VIRTUALENVWRAPPER_VIRTUALENV_ARGS` tells `virtualenvwrapper` what
arguments to pass to `virtualenv`. For example, set the value to
`--system-site-packages` to ensure that all new environments have access to the
system site-packages directory.

```sh
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--system-site-packages'
```

### Additional Options

There is a hook to enable auto-switching to virtualenvs when switching into a
directory where the root of the project matches a virtualenv name.

This can be enabled with:

```sh
zstyle ':prezto:module:python:virtualenv' auto-switch 'yes'
```

`virtualenvwrapper` is automatically initialized if pre-requisites are met
(`$VIRTUALENVWRAPPER_VIRTUALENV` is explicitly set or `virtualenv` is in
`$PATH`). This can be disabled with:

```sh
zstyle ':prezto:module:python:virtualenv' initialize 'no'
```

## Aliases

Aliases are enabled by default. To disable them, add the following to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_.

```sh
zstyle ':prezto:module:python:alias' skip 'yes'
```

- `py` is short for `python`.
- `py2` is short for `python2`.
- `py3` is short for `python3`.

## Functions

- `python-info` exposes information about the Python environment via the
  `$python_info` associative array.

## Theming

To display the name of the current virtual environment in a prompt, define the
following style in the `prompt_name_setup` function.

```sh
# %v - virtualenv name.
zstyle ':prezto:module:python:info:virtualenv' format 'virtualenv:%v'
```

Then add `$python_info[virtualenv]` to `$PROMPT` or `$RPROMPT` and call
`python-info` in the `prompt_name_preexec` hook function.

Similarly, you can use `:prezto:module:python:info:version:format` with `%v` for
the version and add `$python_info[version]` to your prompt for the current
python version.

## Authors

_The authors of this module should be contacted via the [issue tracker][5]._

- [Sorin Ionescu](https://github.com/sorin-ionescu)
- [Sebastian Wiesner](https://github.com/lunaryorn)

[1]: https://www.python.org/dev/peps/pep-0370/
[2]: https://www.doughellmann.com/projects/virtualenvwrapper/
[3]: https://pypi.org/project/virtualenv/
[4]: https://github.com/yyuu/pyenv
[5]: https://github.com/sorin-ionescu/prezto/issues
[6]: ../../runcoms#zshenv
