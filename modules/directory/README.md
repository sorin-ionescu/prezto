Directory
=========

Sets directory options and defines directory aliases.

Options
-------

 - `AUTO_CD` auto cd to a directory without typing `cd`.
 - `AUTO_PUSHD` push the old directory onto the stack on `cd`.
 - `PUSHD_IGNORE_DUPS` don't store duplicates in the stack.
 - `PUSHD_SILENT` do not print the directory stack after `pushd` or `popd`.
 - `PUSHD_TO_HOME` push to home directory when no argument is given.
 - `CDABLE_VARS` change directory to a path stored in a variable.
 - `AUTO_NAME_DIRS` auto add variable-stored paths to `~` list.
 - `MULTIOS` write to multiple descriptors.
 - `EXTENDED_GLOB` use extended globbing syntax.
 - `CLOBBER` don't overwrite existing files with `>` and `>>`. Use `>!` and
    `>>!` to bypass.

Aliases
-------

 - `d` print the contents of the directory stack.
 - `1 ... 9` change directory to the **n** previous one.

Authors
-------

*The authors of this module should be contacted via the GitHub issue tracker.*

 - [James Cox](/imajes)
 - [Sorin Ionescu](/sorin-ionescu)

