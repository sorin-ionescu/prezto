Editor
======

Sets editor specific key bindings options and variables.

Options
-------

  - `BEEP` beep on error in line editor.

Variables
---------

  - `WORDCHARS` treat a given set of characters as part of a word.

Settings
--------

### Key bindings

To enable key bindings, add the following to *zpreztorc*, and replace 'bindings'
with 'emacs' or 'vi'.

```sh
zstyle ':prezto:module:editor' key-bindings 'bindings'
```

### Dot Expansion

To enable the auto conversion of .... to ../.., add the following to
*zpreztorc*.

```sh
zstyle ':prezto:module:editor' dot-expansion 'yes'
```

### PS Context

To enable the prompt context to be set, add the following to your
*zpreztorc*.

```sh
zstyle ':prezto:module:editor' ps-context 'yes'
```

Theming
-------

To indicate when the editor is in the primary keymap (emacs or viins), add
the following to your `theme_prompt_setup` function.

```sh
zstyle ':prezto:module:editor:info:keymap:primary' format '>>>'
```

To indicate when the editor is in the primary keymap (emacs or viins) insert
mode, add the following to your `theme_prompt_setup` function.

```sh
zstyle ':prezto:module:editor:info:keymap:primary:insert' format 'I'
```

To indicate when the editor is in the primary keymap (emacs or viins) overwrite
mode, add the following to your `theme_prompt_setup` function.

```sh
zstyle ':prezto:module:editor:info:keymap:primary:overwrite' format 'O'
```

To indicate when the editor is in the alternate keymap (vicmd), add the
following to your `theme_prompt_setup` function.

```sh
zstyle ':prezto:module:editor:info:keymap:alternate' format '<<<'
```

To indicate when the editor is completing, add the following to your
`theme_prompt_setup` function.

```sh
zstyle ':prezto:module:editor:info:completing' format '...'
```

Then add `$editor_info[context]`, where context is *keymap*, *insert*, or
*overwrite*, to `$PROMPT` or `$RPROMPT`.

Convenience Functions
---------------------

### bindkey-all

Provides a function `bindkey-all` which can be useful for checking how all of the
keys are bound. Normal `bindkey` command will only list the keys bound for one
keymap, which is not as useful if you want to grep through the output. The
keymap's names go to stderr so when you grep through bindkey-all's output you
will still see the headings and can tell which keymap each binding goes to.

It will also pass through arguments so you can use bindkey-all to set bindings
for all keymaps at once. If provided arguments it will *not* print out the
names of each of the keymaps, and just run the command for each keymap.

Authors
-------

*The authors of this module should be contacted via the [issue tracker][1].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/sorin-ionescu/prezto/issues
