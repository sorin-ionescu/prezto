# Overview

`function_keys` enables you to associate `zsh` functions to be called when function keys (F1-F12) are pressed.

# Usage

Assuming you want to bind `F9` to `make`, for instance, include the following in you `.zshrc`:

         function fkey_f9 {
                  make
         }