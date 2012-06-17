Editor
======

Setup the editor keymap

Settings
--------

### Key bindings

To enable key bindings, add the following to *zshrc*, and replace 'map' with
'emacs' or 'vi'.

    zstyle ':omz:module:editor' keymap 'map'

### Dot Expansion

To enable the auto conversion of .... to ../.., add the following to *zshrc*.

    zstyle ':omz:module:editor' dot-expansion 'yes'

### Prompt

To indicate when the editor is in the primary keymap (emacs or viins), add
the following to your theme prompt setup function.

    zstyle ':omz:module:editor:keymap' primary '>>>'

To indicate when the editor is in the primary keymap (emacs or viins) insert
mode, add the following to your theme prompt setup function.

    zstyle ':omz:module:editor:keymap:primary' insert 'I'

To indicate when the editor is in the primary keymap (emacs or viins) overwrite
mode, add the following to your theme prompt setup function.

    zstyle ':omz:module:editor:keymap:primary' overwrite 'O'

To indicate when the editor is in the alternate keymap (vicmd), add the following
to your theme prompt setup function.

    zstyle ':omz:module:editor:keymap' alternate '<<<'

To indicate when the editor is completing, add the following to your theme
prompt setup function.

    zstyle ':omz:module:editor' completing '...'

Authors
-------

*The authors of this module should be contacted via the [issue tracker][1].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/sorin-ionescu/oh-my-zsh/issues

