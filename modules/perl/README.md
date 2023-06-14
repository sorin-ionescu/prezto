# Perl

Enables local [Perl][1] module installation on macOS and defines aliases.

## Local Module Installation

Perl versions older than 5.14 do not support the local installation of Perl
modules natively. This module allows for local installation of Perl modules on
macOS in _`~/Library/Perl/5.12`_ by altering the environment.

### Usage

For Perl versions older than 5.14, install _`local::lib`_.

```console
curl -L -C - -O http://search.cpan.org/CPAN/authors/id/A/AP/APEIRON/local-lib-1.008004.tar.gz
tar xvf local-lib-1.008004.tar.gz
cd local-lib-1.008004
perl Makefile.PL --bootstrap=$HOME/Library/Perl/5.12
make && make test && make install
```

Install _cpanminus_:

```console
curl -L http://cpanmin.us | perl - --self-upgrade
```

## Perlbrew

An alternative to the above is to use [Perlbrew][2], which allows for the
management of multiple, isolated Perl installations in the home directory.

## plenv

Yet another alternative is [_plenv_][3]. This is inspired from _rbenv_ and
enables switching between multiple binary installations.

The subcommands of _plenv_ is similar with _rbenv_.

## Aliases

Aliases are enabled by default. To disable them, add the following to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_.

```sh
zstyle ':prezto:module:perl:alias' skip 'yes'
```

### General

- `pl` is short for `perl`.
- `pld` looks up Perl documentation (`perldoc`).
- `ple` executes a one line program in a loop (`perl -wlne`).

### Perlbrew (plb)

- `plb` manages Perl environments.
- `plba` lists available Perl versions.
- `plbi` installs a Perl version.
- `plbl` lists installed Perl versions.
- `plbo` temporarily turns off Perlbrew.
- `plbO` turns off Perlbrew.
- `plbs` switches to a Perl version.
- `plbu` uninstalls a Perl version.
- `plbx` temporarily sets the Perl version to use.

### plenv (plv)

- `plv` manages Perl environments.
- `plvc` List all available plenv commands.
- `plvl` Set or show the local application-specific Perl version.
- `plvg` Set or show the global Perl version.
- `plvs` Set or show the shell-specific Perl version.
- `plvi` Install a Perl version using the perl-build plugin.
- `plvu` Uninstall a specific Perl version.
- `plvr` Rehash plenv shims (run this after installing executables).
- `plvv` Show the current Perl version and its origin.
- `plvV` List all Perl versions available to plenv.
- `plvw` Display the full path to an executable.
- `plvW` List all Perl versions that contain the given executable.
- `plvm` List cpan modules in current perl.
- `plvM` Migrate cpan modules from other version.
- `plvI` Install cpanm.

## Functions

- `perl-info` exposes information about the Perl environment via the
  `$perl_info` associative array.

## Theming

To display the name of the current Perl version in a prompt, define the
following style in the `prompt_name_setup` function.

```sh
# %v - perl version.
zstyle ':prezto:module:perl:info:version' format 'version:%v'
```

Then add `$perl_info[version]` to `$PROMPT` or `$RPROMPT` and call
`perl-info` in the `prompt_name_precmd` hook function.

## Authors

_The authors of this module should be contacted via the [issue tracker][4]._

- [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://www.perl.org
[2]: https://perlbrew.pl
[3]: https://github.com/tokuhirom/plenv
[4]: https://github.com/sorin-ionescu/prezto/issues
