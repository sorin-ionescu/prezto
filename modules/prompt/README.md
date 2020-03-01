Prompt
======

Loads prompt [themes][1].

Settings
--------

### Prompt Theme

To select a prompt theme, add the following to *zpreztorc*, and replace **name**
with the name of the theme you wish to load. Setting it to **random** will load
a random theme.

```sh
zstyle ':prezto:module:prompt' theme 'name'
```

### Prompt Display Length

To change working directory prompt display length from 'short', set the
following to 'long' (without `~` expansion) or 'full' (with `~` expansion)
in *zpreztorc*.

```sh
zstyle ':prezto:module:prompt' pwd-length 'short'
```

### Display Return Value

Some prompts display the return value in the prompt. If a prompt has support,
this can be disabled with the following snippet.

```sh
zstyle ':prezto:module:prompt' show-return-val 'no'
```

Theming
-------

A prompt theme is an autoloadable function file with a special name,
`prompt_name_setup`, placed anywhere in `$fpath`, but for the purpose of this
project, themes **should** be placed in the *modules/prompt/functions*
directory.

### Required Variables

To ensure that your function works with the editor-info module you'll need to
set the following variable:

```
  # Tell prezto we can manage this prompt
  zstyle ':prezto:module:prompt' managed 'yes'
```

This is to ensure compatibility with outside prompts, while allowing prezto
and prezto-compatible prompts to take full advantage of the editor module.
This should be set in the `prompt_name_setup` function after you've added
any additional hooks with `add-zsh-hook precmd prompt_name_precmd`. See below
for additional information about functions and hooks.

### Theme Functions

There are three theme functions, a setup function, a help function, and
a preview function. The setup function **must** always be defined. The help
function and the preview functions are optional.

#### `prompt_name_setup`

This function is called by the `prompt` function to install the theme. This
function may define other functions as necessary to maintain the prompt,
including a function that displays help or a function used to preview it.

**Do not call this function directly.**

The most basic example of this function can be seen below.

```sh
function prompt_name_setup {
  PROMPT='%m%# '
  RPROMPT=''
}
```

#### `prompt_name_help`

If the `prompt_name_setup` function is customizable via parameters, a help
function **should** be defined. The user will access it via `prompt -h name`.

The most basic example of this function can be seen below.

```sh
function prompt_name_help {
  cat <<EOH
This prompt is color-scheme-able. You can invoke it thus:

  prompt theme [<color1>] [<color2>]

where the color is for the left-hand prompt.
EOH
}
```

#### `prompt_name_preview`

If the `prompt_name_setup` function is customizable via parameters, a preview
function **should** be defined. The user will access it via `prompt -p name`.

The most basic example of this function can be seen below.

```sh
function prompt_name_preview {
  if (( $# > 0 )); then
    prompt_preview_theme theme "$@"
  else
    prompt_preview_theme theme red green blue
    print
    prompt_preview_theme theme yellow magenta black
  fi
}
```

### Hook Functions

There are many Zsh [hook][2] functions, but mostly the *precmd* hook will be
used.

#### `prompt_name_precmd`

This hook is called before the prompt is displayed and is useful for getting
information to display in a prompt.

When calling functions to get information to display in a prompt, do not assume
that all the dependencies have been loaded. Always check for the availability of
a function before you calling it.

**Do not register hook functions. They will be registered by the `prompt` function.**

The most basic example of this function can be seen below.

```sh
function prompt_name_precmd {
  if (( $+functions[git-info] )); then
    git-info
  fi
}
```

Troubleshooting
---------------

### Fonts aren't displaying properly.

On most systems, themes which use special characters need to have a patched font
installed and configured properly.

Powerline provides some information on [terminal support][4] and [how to install
patched fonts][5] which should fix most font issues.


Authors
-------

*The authors of this module should be contacted via the [issue tracker][3].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Prompt-Themes
[2]: http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
[3]: https://github.com/sorin-ionescu/prezto/issues
[4]: http://powerline.readthedocs.io/en/master/usage.html#terminal-emulator-requirements
[5]: http://powerline.readthedocs.io/en/latest/installation.html#fonts-installation
