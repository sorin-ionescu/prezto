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

Keymaping
----------

### Emacs

| Key           | ZLE Widget                                  |
|:-------------:| -------------------------------------------:|
| Ctl+@         | set-mark-command                            |
| Ctl+A         | beginning-of-line                           |
| Ctl+B         | backward-char                               |
| Ctl+D         | delete-char-or-list                         |
| Ctl+E         | end-of-line                                 |
| Ctl+F         | forward-char                                |
| Ctl+G         | send-break                                  |
| Ctl+H         | backward-delete-char                        |
| Ctl+I         | expand-or-complete-with-indicator           |
| Ctl+J         | accept-line                                 |
| Ctl+K         | kill-line                                   |
| Ctl+L         | clear-screen                                |
| Ctl+M         | accept-line                                 |
| Ctl+N         | history-substring-search-down               |
| Ctl+O         | accept-line-and-down-history                |
| Ctl+P         | history-substring-search-up                 |
| Ctl+Q         | push-line-or-edit                           |
| Ctl+R         | history-incremental-pattern-search-backward |
| Ctl+S         | history-incremental-pattern-search-forward  |
| Ctl+T         | transpose-chars                             |
| Ctl+U         | kill-whole-line                             |
| Ctl+V         | quoted-insert                               |
| Ctl+W         | backward-kill-word                          |
| Ctl+XCtl+B    | vi-find-prev-char                           |
| Ctl+XCtl+E    | edit-command-line                           |
| Ctl+XCtl+F    | vi-find-next-char                           |
| Ctl+XCtl+J    | vi-join                                     |
| Ctl+XCtl+K    | kill-buffer                                 |
| Ctl+XCtl+N    | infer-next-history                          |
| Ctl+XCtl+O    | overwrite-mode                              |
| Ctl+XCtl+S    | prepend-sudo                                |
| Ctl+XCtl+U    | undo                                        |
| Ctl+XCtl+V    | vi-cmd-mode                                 |
| Ctl+XCtl+X    | exchange-point-and-mark                     |
| Ctl+XCtl+]    | vi-match-bracket                            |
| Ctl+X\*       | expand-word                                 |
| Ctl+X=        | what-cursor-position                        |
| Ctl+XG        | list-expand                                 |
| Ctl+Xg        | list-expand                                 |
| Ctl+Xr        | history-incremental-search-backward         |
| Ctl+Xs        | history-incremental-search-forward          |
| Ctl+Xu        | undo                                        |
| Ctl+Y         | yank                                        |
| EscCtl+D      | list-choices                                |
| EscCtl+G      | send-break                                  |
| EscCtl+H      | backward-kill-word                          |
| EscCtl+I      | self-insert-unmeta                          |
| EscCtl+J      | self-insert-unmeta                          |
| EscCtl+L      | clear-screen                                |
| EscCtl+M      | self-insert-unmeta                          |
| EscCtl+[OC    | emacs-forward-word                          |
| EscCtl+[OD    | emacs-backward-word                         |
| EscCtl+\_     | copy-prev-word                              |
| Esc           | expand-history                              |
| Esc+!         | expand-history                              |
| Esc+"         | quote-region                                |
| Esc+$         | spell-word                                  |
| Esc+'         | quote-line                                  |
| Esc+-         | neg-argument                                |
| Esc+.         | insert-last-word                            |
| Esc+0         | digit-argument                              |
| Esc+1         | digit-argument                              |
| Esc+2         | digit-argument                              |
| Esc+3         | digit-argument                              |
| Esc+4         | digit-argument                              |
| Esc+5         | digit-argument                              |
| Esc+6         | digit-argument                              |
| Esc+7         | digit-argument                              |
| Esc+8         | digit-argument                              |
| Esc+9         | digit-argument                              |
| Esc+<         | beginning-of-buffer-or-history              |
| Esc+>         | end-of-buffer-or-history                    |
| Esc+?         | which-command                               |
| Esc+A         | accept-and-hold                             |
| Esc+B         | emacs-backward-word                         |
| Esc+C         | capitalize-word                             |
| Esc+D         | kill-word                                   |
| Esc+E         | expand-cmd-path                             |
| Esc+F         | emacs-forward-word                          |
| Esc+G         | get-line                                    |
| Esc+H         | run-help                                    |
| Esc+K         | backward-kill-line                          |
| Esc+L         | down-case-word                              |
| Esc+M         | copy-prev-shell-word                        |
| Esc+N         | history-search-forward                      |
| Esc+OA        | up-line-or-history                          |
| Esc+OB        | down-line-or-history                        |
| Esc+OC        | forward-char                                |
| Esc+OD        | backward-char                               |
| Esc+OF        | end-of-line                                 |
| Esc+OH        | beginning-of-line                           |
| Esc+P         | history-search-backward                     |
| Esc+Q         | push-line-or-edit                           |
| Esc+S         | spell-word                                  |
| Esc+T         | transpose-words                             |
| Esc+U         | up-case-word                                |
| Esc+W         | copy-region-as-kill                         |
| Esc+[2~       | overwrite-mode                              |
| Esc+[3~       | delete-char                                 |
| Esc+[A        | history-substring-search-up                 |
| Esc+[B        | history-substring-search-down               |
| Esc+[C        | forward-char                                |
| Esc+[D        | backward-char                               |
| Esc+[Z        | reverse-menu-complete                       |
| Esc+\_        | redo                                        |
| Esc+a         | accept-and-hold                             |
| Esc+b         | emacs-backward-word                         |
| Esc+c         | capitalize-word                             |
| Esc+d         | kill-word                                   |
| Esc+e         | expand-cmd-path                             |
| Esc+f         | emacs-forward-word                          |
| Esc+g         | get-line                                    |
| Esc+h         | run-help                                    |
| Esc+k         | backward-kill-line                          |
| Esc+l         | down-case-word                              |
| Esc+m         | copy-prev-shell-word                        |
| Esc+n         | history-search-forward                      |
| Esc+p         | history-search-backward                     |
| Esc+q         | push-line-or-edit                           |
| Esc+s         | spell-word                                  |
| Esc+t         | transpose-words                             |
| Esc+u         | up-case-word                                |
| Esc+w         | copy-region-as-kill                         |
| Esc+x         | execute-named-cmd                           |
| Esc+y         | yank-pop                                    |
| Esc+z         | execute-last-named-cmd                      |
| Esc+&#124;    | vi-goto-column                              |
| Esc+^?        | backward-kill-word                          |
| Esc+^\_       | undo                                        |
| " "           | magic-space                                 |
| !"-"~         | self-insert                                 |
| ^?            | backward-delete-char                        |
| \M-^@"-"\M-^? | self-insert                                 |


### Vi (Insert Mode)

| Key           | ZLE Widget                        |
|:-------------:| ---------------------------------:|
| Ctl+A-Ctrl+C  | self-insert                       |
| Ctl+D         | list-choices                      |
| Ctl+E-Ctl+F   | self-insert                       |
| Ctl+G         | list-expand                       |
| Ctl+H         | vi-backward-delete-char           |
| Ctl+I         | expand-or-complete-with-indicator |
| Ctl+J         | accept-line                       |
| Ctl+K         | self-insert                       |
| Ctl+L         | clear-screen                      |
| Ctl+M         | accept-line                       |
| Ctl+N-Ctl+P   | self-insert                       |
| Ctl+Q         | push-line-or-edit                 |
| Ctl+R         | redisplay                         |
| Ctl+S-Ctl+T   | self-insert                       |
| Ctl+U         | vi-kill-line                      |
| Ctl+V         | vi-quoted-insert                  |
| Ctl+W         | vi-backward-kill-word             |
| Ctl+X         | self-insert                       |
| Ctl+XCtl+S    | prepend-sudo                      |
| Ctl+Y-Ctl+Z   | self-insert                       |
| Esc           | vi-cmd-mode                       |
| Esc+E         | expand-cmd-path                   |
| Esc+M         | copy-prev-shell-word              |
| Esc+OA        | up-line-or-history                |
| Esc+OB        | down-line-or-history              |
| Esc+OC        | forward-char                      |
| Esc+OD        | backward-char                     |
| Esc+OF        | end-of-line                       |
| Esc+OH        | beginning-of-line                 |
| Esc+Q         | push-line-or-edit                 |
| Esc+[2~       | overwrite-mode                    |
| Esc+[3~       | delete-char                       |
| Esc+[A        | history-substring-search-up       |
| Esc+[B        | history-substring-search-down     |
| Esc+[C        | vi-forward-char                   |
| Esc+[D        | vi-backward-char                  |
| Esc+[Z        | reverse-menu-complete             |
| Esc+e         | expand-cmd-path                   |
| Esc+m         | copy-prev-shell-word              |
| Esc+q         | push-line-or-edit                 |
| Ctl+\\\\-Ctl+\_   | self-insert                       |
| " "           | magic-space                       |
| !-j           | self-insert                       |
| jk            | vi-cmd-mode                       |
| k             | self-insert                       |
| kj            | vi-cmd-mode                       |
|  l-~          | self-insert                       |
| ^?            | backward-delete-char              |
| Meta^@-Meta^? | self-insert                       |


### Vi (Command Mode)

| Key           | ZLE Widget                                  |
|:------:| -------------------------------------------:|
| Ctl+D  | list-choices                                |
| Ctl+G  | list-expand                                 |
| Ctl+H  | vi-backward-char                            |
| Ctl+J  | accept-line                                 |
| Ctl+L  | clear-screen                                |
| Ctl+M  | accept-line                                 |
| Ctl+N  | down-history                                |
| Ctl+P  | up-history                                  |
| Ctl+R  | redo                                        |
| Esc+OA | up-line-or-history                          |
| Esc+OB | down-line-or-history                        |
| Esc+OC | vi-forward-char                             |
| Esc+OD | vi-backward-char                            |
| Esc+[A | up-line-or-history                          |
| Esc+[B | down-line-or-history                        |
| Esc+[C | vi-forward-char                             |
| Esc+[D | vi-backward-char                            |
| " "    | vi-forward-char                             |
| "      | vi-set-buffer                               |
| #      | pound-insert                                |
| $      | vi-end-of-line                              |
| %      | vi-match-bracket                            |
| '      | vi-goto-mark-line                           |
| +      | vi-down-line-or-history                     |
| ,      | vi-rev-repeat-find                          |
| -      | vi-up-line-or-history                       |
| .      | vi-repeat-change                            |
| /      | history-incremental-pattern-search-forward  |
| 0      | vi-digit-or-beginning-of-line               |
| 1-9    | digit-argument                              |
| :      | execute-named-cmd                           |
| ;      | vi-repeat-find                              |
| <      | vi-unindent                                 |
| =      | list-choices                                |
| >      | vi-indent                                   |
| ?      | history-incremental-pattern-search-backward |
| A      | vi-add-eol                                  |
| B      | vi-backward-blank-word                      |
| C      | vi-change-eol                               |
| D      | vi-kill-eol                                 |
| E      | vi-forward-blank-word-end                   |
| F      | vi-find-prev-char                           |
| G      | vi-fetch-history                            |
| I      | vi-insert-bol                               |
| J      | vi-join                                     |
| N      | vi-rev-repeat-search                        |
| O      | vi-open-line-above                          |
| P      | vi-put-before                               |
| R      | vi-replace                                  |
| S      | vi-change-whole-line                        |
| T      | vi-find-prev-char-skip                      |
| W      | vi-forward-blank-word                       |
| X      | vi-backward-delete-char                     |
| Y      | vi-yank-whole-line                          |
| ^      | vi-first-non-blank                          |
| `      | vi-goto-mark                                |
| a      | vi-add-next                                 |
| b      | vi-backward-word                            |
| c      | vi-change                                   |
| d      | vi-delete                                   |
| e      | vi-forward-word-end                         |
| f      | vi-find-next-char                           |
| h      | vi-backward-char                            |
| i      | vi-insert                                   |
| j      | history-substring-search-down               |
| k      | history-substring-search-up                 |
| l      | vi-forward-char                             |
| m      | vi-set-mark                                 |
| n      | vi-repeat-search                            |
| o      | vi-open-line-below                          |
| p      | vi-put-after                                |
| r      | vi-replace-chars                            |
| s      | vi-substitute                               |
| t      | vi-find-next-char-skip                      |
| u      | undo                                        |
| v      | edit-command-line                           |
| w      | vi-forward-word                             |
| x      | vi-delete-char                              |
| y      | vi-yank                                     |
| &#124; | vi-goto-column                              |
| ~      | vi-swap-case                                |
| ^?     | vi-backward-char                            |

Authors
-------

*The authors of this module should be contacted via the [issue tracker][1].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/sorin-ionescu/oh-my-zsh/issues

