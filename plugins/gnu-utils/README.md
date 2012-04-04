gnu-utils
=========

Allow to use an alternate set of coreutils ([GNU coreutils][1]).

On some systems, such as Mac OS, the coreutils installed aren't the
gnu-coreutils.  
In this case it's possible to install GNU coreutils, allowing to access to GNU
coreutils commands with a different prefix (ie: `gls` for `ls`).

Some installers create, during the installation of GNU coreutils, an alternative
folder containing the same commands with a "vanilla name" (actually `ls`).
This allows to add the said folder to `PATH`.  
This solution can be a problem if you only want the GNU coreutils commands
inside your zsh session (and you want to run scripts that still use the original
coreutils).  
The _gnu-utils plugin_ takes care of that by "hashing" the commands instead of
adding them to the `PATH`.

Authors
-------

*The authors of this plugin should be contacted via the github bug tracker.*

 - [Sorin Ionescu](/sorin-ionescu)

[1]: http://www.gnu.org/software/coreutils/
