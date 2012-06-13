Perl
====

Enables local [Perl][1] module installation on Mac OS X and defines alises.

Local Module Installation
-------------------------

Perl versions older than 5.14 do not support the local installation of Perl
modules natively. This module allows for local installation of Perl modules on
Mac OS X in *~/Library/Perl/5.12* by altering the environment.

### Usage

For Perl versions older than 5.14, install *local::lib*.

    curl -L -C - -O http://search.cpan.org/CPAN/authors/id/A/AP/APEIRON/local-lib-1.008004.tar.gz
    tar xvf local-lib-1.008004.tar.gz
    cd local-lib-1.008004
    perl Makefile.PL --bootstrap=$HOME/Library/Perl/5.12
    make && make test && make install

Install *cpanminus*:

    curl -L http://cpanmin.us | perl - --self-upgrade

Perlbrew
--------

An alternative to the above is to use [Perlbrew][2], which allows for the
management of multiple, isolated Perl installations in the home directory.

Aliases
-------

### General

  - `pe` executes a one line program in a loop (`perl -wlne`).
  - `pd` looks up Perl documentation (`perldoc`).

### Perlbrew

  - `pb` manages Perl environments.
  - `pba` lists available Perl versions.
  - `pbi` installs a Perl version.
  - `pbl` lists installed Perl versions.
  - `pbo` temporarily turns off Perlbrew.
  - `pbO` turns off Perlbrew.
  - `pbs` switches to a Perl version.
  - `pbu` uninstalls a Perl version.
  - `pbx` temporarily sets the Perl version to use.

Functions
---------

  - `prep` provides a grep-like pattern search.
  - `psub` provides a sed-like pattern substitution.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][3].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: http://www.perl.org
[2]: http://perlbrew.pl
[3]: https://github.com/sorin-ionescu/oh-my-zsh/issues

