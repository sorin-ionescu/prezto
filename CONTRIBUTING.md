Contributing
------------

This project would not exist without all of its users and [contributors][1].

If you have ideas on how to make the configuration easier to maintain or
improve its performance, do not hesitate to fork and send pull requests.

### Issue Reporting

   - Check that the issue has not already been reported.
   - Check that the issue has not already been fixed in the latest code.
   - Open an issue with a clear title and description in grammatically correct,
     complete sentences.

### Pull Request

   - Read [how to properly contribute to open source projects on GitHub][2].
   - Use a topic branch to easily amend a pull request later, if necessary.
   - Write [good commit messages][3].
   - Squash commits on the topic branch before opening a pull request.
   - Use the same coding style and spacing.
   - Open a [pull request][4] that relates to but one subject with a clear
     title and description in grammatically correct, complete sentences.

#### Code Style

This project follows the [Google Shell Style Guide][5] when possible. However,
there are a number of additional things to keep in mind.

   - Local variables should be used whenever possible.
   - Prefer `zstyle` over environment variables for configuration.
   - Prefer (( ... )) over [[ ... ]] for arithmetic expression.
   - Use the function keyword to define functions.
   - The 80 character hard limit can be waved for readability.

#### Using an Alternative zprezto Directory

To work on zprezto without messing with your current configuration:

```sh
mkdir devel-zprezto
cd devel-zprezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git .zprezto
ZDOTDIR=$(pwd)
echo "Your development ZDOTDIR is $ZDOTDIR"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

Then to start zsh in this development environment you will run:

```sh
ZDOTDIR=/path/to/devel-zprezto zsh
```

#### Modules

   - A *README.md* must be present.
   - Large functions must be placed in a *functions* directory.
   - Functions that take arguments must have completion.

#### Themes

   - A screenshots section must be present in the file header.
   - The pull request description must have [embedded screenshots][6].

[1]: https://github.com/sorin-ionescu/prezto/contributors
[2]: http://gun.io/blog/how-to-github-fork-branch-and-pull-request
[3]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[4]: https://help.github.com/articles/using-pull-requests
[5]: https://google.github.io/styleguide/shell.xml
[6]: http://daringfireball.net/projects/markdown/syntax#img
