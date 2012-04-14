Directory
=========
Sets directory options and defines directory aliases.

Options
-------

 - `AUTO_CD`, Auto cd to a directory without typing `cd`.
 - `AUTO_PUSHD`, Push the old directory onto the stack on `cd`.
 - `PUSHD_IGNORE_DUPS`, Don't store duplicates in the stack.
 - `PUSHD_SILENT`, Do not print the directory stack after `pushd` or `popd`.
 - `PUSHD_TO_HOME`, Push to home directory when no argument is given.
 - `CDABLE_VARS`, Change directory to a path stored in a variable.
 - `AUTO_NAME_DIRS`, Auto add variable-stored paths to `~` list.
 - `MULTIOS`, Write to multiple descriptors.
 - `EXTENDED_GLOB`, Use extended globbing syntax.
 - `CLOBBER`, Don't overwrite existing files with `>` and `>>`. Use `>!` and
`>>!` to bypass.

Aliases
-------

 - `d`, Print the contents of the `directory` stack.
 - `1` to `9`, Change directory to the `n` previous one.

Authors
-------

*The authors of this module should be contacted via the github bug tracker.*

 - [James Cox](/imajes)
 - [Sorin Ionescu](/sorin-ionescu)
