Project Jump
============

Provides `pj` function and aliases that quickly jumps to pre-specified
directories.

Usage
-----

  - Set `$PROJECT_PATHS` in your ~/.zshrc

  ```shell
    # Set space separated directories for tab-completion jumping with pj
    PROJECT_PATHS=(~/src ~/work)
  ```

  - In ZSH you now can open a project directory with the command: `pj my-project`
    the plugin will locate the `my-project` directory in one of the $PROJECT_PATHS
    Also tab completion is supported.
  - `pjo my-project` will open the directory in $EDITOR

Comparison with fasd
--------------------

  - The fasd module which allows quick jumping to all visited directories
    in most frequently visited order and many more features.
  - Prefer pj if you just want simple tab completion of common directories.
  - No issue with using both pj and fasd at the same time.
