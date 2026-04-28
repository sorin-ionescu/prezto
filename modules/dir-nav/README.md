# Dir-Nav

Browser-style directional directory navigation bound to Alt+Arrow keys.

| Key | Action |
| --- | --- |
| `Alt+Left`  | Back to previous directory |
| `Alt+Right` | Forward (undo back) |
| `Alt+Up`    | Parent directory |
| `Alt+Down`  | First child directory (alphabetical) |

`cd`'s issued outside the widgets push onto the back stack and clear the
forward stack, matching browser history semantics.

## Usage

Add `dir-nav` to the `pmodule` list in `~/.zpreztorc`:

```sh
zstyle ':prezto:load' pmodule \
  ... \
  'dir-nav'
```
