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
| ^@            | set-mark-command                            |
| ^A            | beginning-of-line                           |
| ^B            | backward-char                               |
| ^D            | delete-char-or-list                         |
| ^E            | end-of-line                                 |
| ^F            | forward-char                                |
| ^G            | send-break                                  |
| ^H            | backward-delete-char                        |
| ^I            | expand-or-complete-with-indicator           |
| ^J            | accept-line                                 |
| ^K            | kill-line                                   |
| ^L            | clear-screen                                |
| ^M            | accept-line                                 |
| ^N            | history-substring-search-down               |
| ^O            | accept-line-and-down-history                |
| ^P            | history-substring-search-up                 |
| ^Q            | push-line-or-edit                           |
| ^R            | history-incremental-pattern-search-backward |
| ^S            | history-incremental-pattern-search-forward  |
| ^T            | transpose-chars                             |
| ^U            | kill-whole-line                             |
| ^V            | quoted-insert                               |
| ^W            | backward-kill-word                          |
| ^X^B          | vi-find-prev-char                           |
| ^X^E          | edit-command-line                           |
| ^X^F          | vi-find-next-char                           |
| ^X^J          | vi-join                                     |
| ^X^K          | kill-buffer                                 |
| ^X^N          | infer-next-history                          |
| ^X^O          | overwrite-mode                              |
| ^X^S          | prepend-sudo                                |
| ^X^U          | undo                                        |
| ^X^V          | vi-cmd-mode                                 |
| ^X^X          | exchange-point-and-mark                     |
| ^X^]          | vi-match-bracket                            |
| ^X\*          | expand-word                                 |
| ^X=           | what-cursor-position                        |
| ^XG           | list-expand                                 |
| ^Xg           | list-expand                                 |
| ^Xr           | history-incremental-search-backward         |
| ^Xs           | history-incremental-search-forward          |
| ^Xu           | undo                                        |
| ^Y            | yank                                        |
| ^[^D          | list-choices                                |
| ^[^G          | send-break                                  |
| ^[^H          | backward-kill-word                          |
| ^[^I          | self-insert-unmeta                          |
| ^[^J          | self-insert-unmeta                          |
| ^[^L          | clear-screen                                |
| ^[^M          | self-insert-unmeta                          |
| ^[^[OC        | emacs-forward-word                          |
| ^[^[OD        | emacs-backward-word                         |
| ^[^\_         | copy-prev-word                              |
| ^[            | expand-history                              |
| ^[!           | expand-history                              |
| ^["           | quote-region                                |
| ^[$           | spell-word                                  |
| ^['           | quote-line                                  |
| ^[-           | neg-argument                                |
| ^[.           | insert-last-word                            |
| ^[0           | digit-argument                              |
| ^[1           | digit-argument                              |
| ^[2           | digit-argument                              |
| ^[3           | digit-argument                              |
| ^[4           | digit-argument                              |
| ^[5           | digit-argument                              |
| ^[6           | digit-argument                              |
| ^[7           | digit-argument                              |
| ^[8           | digit-argument                              |
| ^[9           | digit-argument                              |
| ^[<           | beginning-of-buffer-or-history              |
| ^[>           | end-of-buffer-or-history                    |
| ^[?           | which-command                               |
| ^[A           | accept-and-hold                             |
| ^[B           | emacs-backward-word                         |
| ^[C           | capitalize-word                             |
| ^[D           | kill-word                                   |
| ^[E           | expand-cmd-path                             |
| ^[F           | emacs-forward-word                          |
| ^[G           | get-line                                    |
| ^[H           | run-help                                    |
| ^[K           | backward-kill-line                          |
| ^[L           | down-case-word                              |
| ^[M           | copy-prev-shell-word                        |
| ^[N           | history-search-forward                      |
| ^[OA          | up-line-or-history                          |
| ^[OB          | down-line-or-history                        |
| ^[OC          | forward-char                                |
| ^[OD          | backward-char                               |
| ^[OF          | end-of-line                                 |
| ^[OH          | beginning-of-line                           |
| ^[P           | history-search-backward                     |
| ^[Q           | push-line-or-edit                           |
| ^[S           | spell-wordi                                 |
| ^[T           | transpose-words                             |
| ^[U           | up-case-word                                |
| ^[W           | copy-region-as-kill                         |
| ^[[2~         | overwrite-mode                              |
| ^[[3~         | delete-char                                 |
| ^[[A          | history-substring-search-up                 |
| ^[[B          | history-substring-search-down               |
| ^[[C          | forward-char                                |
| ^[[D          | backward-char                               |
| ^[[Z          | reverse-menu-complete                       |
| ^[\_          | redo                                        |
| ^[a           | accept-and-hold                             |
| ^[b           | emacs-backward-word                         |
| ^[c           | capitalize-word                             |
| ^[d           | kill-word                                   |
| ^[e           | expand-cmd-path                             |
| ^[f           | emacs-forward-word                          |
| ^[g           | get-line                                    |
| ^[h           | run-help                                    |
| ^[k           | backward-kill-line                          |
| ^[l           | down-case-word                              |
| ^[m           | copy-prev-shell-word                        |
| ^[n           | history-search-forward                      |
| ^[p           | history-search-backward                     |
| ^[q           | push-line-or-edit                           |
| ^[s           | spell-word                                  |
| ^[t           | transpose-words                             |
| ^[u           | up-case-word                                |
| ^[w           | copy-region-as-kill                         |
| ^[x           | execute-named-cmd                           |
| ^[y           | yank-pop                                    |
| ^[z           | execute-last-named-cmd                      |
| ^[&#124;      | vi-goto-column                              |
| ^[^?          | backward-kill-word                          |
| ^\_           | undo                                        |
| " "           | magic-space                                 |
| !"-"~         | self-insert                                 |
| ^?            | backward-delete-char                        |
| \M-^@"-"\M-^? | self-insert                                 |


### Vi (Insert Mode)

| Key           | ZLE Widget                        |
|:-------------:| ---------------------------------:|
| ^A"-"^C       | self-insert                       |
| ^D            | list-choices                      |
| ^E"-"^F       | self-insert                       |
| ^G            | list-expand                       |
| ^H            | vi-backward-delete-char           |
| ^I            | expand-or-complete-with-indicator |
| ^J            | accept-line                       |
| ^K            | self-insert                       |
| ^L            | clear-screen                      |
| ^M            | accept-line                       |
| ^N"-"^P       | self-insert                       |
| ^Q            | push-line-or-edit                 |
| ^R            | redisplay                         |
| ^S"-"^T       | self-insert                       |
| ^U            | vi-kill-line                      |
| ^V            | vi-quoted-insert                  |
| ^W            | vi-backward-kill-word             |
| ^X            | self-insert                       |
| ^X^S          | prepend-sudo                      |
| ^Y"-"^Z       | self-insert                       |
| ^[            | vi-cmd-mode                       |
| ^[E           | expand-cmd-path                   |
| ^[M           | copy-prev-shell-word              |
| ^[OA          | up-line-or-history                |
| ^[OB          | down-line-or-history              |
| ^[OC          | forward-char                      |
| ^[OD          | backward-char                     |
| ^[OF          | end-of-line                       |
| ^[OH          | beginning-of-line                 |
| ^[Q           | push-line-or-edit                 |
| ^[[2~         | overwrite-mode                    |
| ^[[3~         | delete-char                       |
| ^[[A          | history-substring-search-up       |
| ^[[B          | history-substring-search-down     |
| ^[[C          | vi-forward-char                   |
| ^[[D          | vi-backward-char                  |
| ^[[Z          | reverse-menu-complete             |
| ^[e           | expand-cmd-path                   |
| ^[m           | copy-prev-shell-word              |
| ^[q           | push-line-or-edit                 |
| ^\\\\"-"^\_   | self-insert                       |
| " "           | magic-space                       |
| !"-"j         | self-insert                       |
| jk            | vi-cmd-mode                       |
| k             | self-insert                       |
| kj            | vi-cmd-mode                       |
|  l"-"~        | self-insert                       |
| ^?            | backward-delete-char              |
| \M-^@"-"\M-^? | self-insert                       |


### Vi (Command Mode)

| Key           | ZLE Widget                                  |
|:-------------:| -------------------------------------------:|
| ^D            | list-choices                                |
| ^G            | list-expand                                 |
| ^H            | vi-backward-char                            |
| ^J            | accept-line                                 |
| ^L            | clear-screen                                |
| ^M            | accept-line                                 |
| ^N            | down-history                                |
| ^P            | up-history                                  |
| ^R            | redo                                        |
| ^[OA          | up-line-or-history                          |
| ^[OB          | down-line-or-history                        |
| ^[OC          | vi-forward-char                             |
| ^[OD          | vi-backward-char                            |
| ^[[A          | up-line-or-history                          |
| ^[[B          | down-line-or-history                        |
| ^[[C          | vi-forward-char                             |
| ^[[D          | vi-backward-char                            |
| " "           | vi-forward-char                             |
| \"            | vi-set-buffer                               |
| #             | pound-insert                                |
| \$            | vi-end-of-line                              |
| %             | vi-match-bracket                            |
| '             | vi-goto-mark-line                           |
| +             | vi-down-line-or-history                     |
| ,             | vi-rev-repeat-find                          |
| -             | vi-up-line-or-history                       |
| .             | vi-repeat-change                            |
| /             | history-incremental-pattern-search-forward  |
| 0             | vi-digit-or-beginning-of-line               |
| 1"-"9         | digit-argument                              |
| :             | execute-named-cmd                           |
| ;             | vi-repeat-find                              |
| <             | vi-unindent                                 |
| =             | list-choices                                |
| >             | vi-indent                                   |
| ?             | history-incremental-pattern-search-backward |
| A             | vi-add-eol                                  |
| B             | vi-backward-blank-word                      |
| C             | vi-change-eol                               |
| D             | vi-kill-eol                                 |
| E             | vi-forward-blank-word-end                   |
| F             | vi-find-prev-char                           |
| G             | vi-fetch-history                            |
| I             | vi-insert-bol                               |
| J             | vi-join                                     |
| N             | vi-rev-repeat-search                        |
| O             | vi-open-line-above                          |
| P             | vi-put-before                               |
| R             | vi-replace                                  |
| S             | vi-change-whole-line                        |
| T             | vi-find-prev-char-skip                      |
| W             | vi-forward-blank-word                       |
| X             | vi-backward-delete-char                     |
| Y             | vi-yank-whole-line                          |
| \^            | vi-first-non-blank                          |
| \`            | vi-goto-mark                                |
| a             | vi-add-next                                 |
| b             | vi-backward-word                            |
| c             | vi-change                                   |
| d             | vi-delete                                   |
| e             | vi-forward-word-end                         |
| f             | vi-find-next-char                           |
| h             | vi-backward-char                            |
| i             | vi-insert                                   |
| j             | history-substring-search-down               |
| k             | history-substring-search-up                 |
| l             | vi-forward-char                             |
| m             | vi-set-mark                                 |
| n             | vi-repeat-search                            |
| o             | vi-open-line-below                          |
| p             | vi-put-after                                |
| r             | vi-replace-chars                            |
| s             | vi-substitute                               |
| t             | vi-find-next-char-skip                      |
| u             | undo                                        |
| v             | edit-command-line                           |
| w             | vi-forward-word                             |
| x             | vi-delete-char                              |
| y             | vi-yank                                     |
| &#124;        | vi-goto-column                              |
| ~             | vi-swap-case                                |
| ^?            | vi-backward-char                            |

Authors
-------

*The authors of this module should be contacted via the [issue tracker][1].*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)

[1]: https://github.com/sorin-ionescu/oh-my-zsh/issues

