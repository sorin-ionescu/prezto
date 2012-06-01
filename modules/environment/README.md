Environment
===========
Prepare the environment by setting some variables.

Because of its importance, this module *should* be the first loaded module.

Environment variables
---------------------
### path

- `$cdpath`, [`$cdpath` and `AUTO_CD`][1]
- `$infopath`
- `$manpath`, [Other path-like things][3]
- `$path`, [Path][4]

### utils

- `$EDITOR`, The user's preferred utility to edit text files.
- `$VISUAL`, The user's preferred utility to edit text files.
(See [differencebetween `VISUAL` and `EDITOR`][5])
- `$PAGER`, The user's preferred utility to display text files.
- `$GREP_COLOR`, Specifies the marker for highlighting.
- `$GREP_OPTIONS`, This variable specifies default options to be placed in front
of any  explicit  options.
- `$BROWSER`, The user's preferred web browser.

### [less][6]

- `$LESSCHARSET`, Selects a predefined character set. 
- `$LESSHISTFILE`, Name  of	the  history file used to remember search commands
and shell commands between invocations of less.
- `$LESSEDIT`, Editor prototype string (used for the `v` command).
- `$LESS`, Options which are passed to less automatically.
- `$LESSOPEN`, Command line to invoke the (optional) input-preprocessor.

Note to the developers
----------------------
This module **MUST NOT** rely on any command not built in _zsh_.

Authors
-------
*The authors of this module should be contacted via the github bug tracker.*

 - [Sorin Ionescu](/sorin-ionescu)
 - [Colin Hebert](/ColinHebert)

[1]: http://zsh.sourceforge.net/Guide/zshguide03.html
[3]: http://zsh.sourceforge.net/Guide/zshguide02.html#l26
[4]: http://zsh.sourceforge.net/Guide/zshguide02.html#l24
[5]: http://unix.stackexchange.com/questions/4859
[6]: http://unixhelp.ed.ac.uk/CGI/man-cgi?less
