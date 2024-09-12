# Prezto — Instantly Awesome Zsh

Prezto is the configuration framework for [Zsh][1]; it enriches the command line
interface environment with sane defaults, aliases, functions, auto completion,
and prompt themes.

## Installation

### Manual

Prezto will work with any recent release of Zsh, but the minimum required
version is **4.3.11**.

01. Launch Zsh:

    ```console
    zsh
    ```

02. Clone the repository:

    ```console
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    ```

    <details>
      <summary><em>Optional: Installing in <code>$XDG_CONFIG_HOME</code></em></summary>

      Optionally, if you already have `$XDG_CONFIG_HOME` configured (usually as
      _`$HOME/.config`_ by default) and intend to install Prezto under
      _`$XDG_CONFIG_HOME/zsh`_ instead, you can clone the repository there and
      configure `$ZDOTDIR` separately if not already configured.

      - Clone the repository:

        ```console
        git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}/.zprezto"
        ```

      - Configure `$XDG_CONFIG_HOME` and `$ZDOTDIR` in _`$HOME/.zshenv`_:

        ```sh
        export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
        [[ -d $XDG_CONFIG_HOME/zsh ]] && export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
        source "$ZDOTDIR/.zshenv"
        ```

    </details>

03. Create a new Zsh configuration by copying/linking the Zsh configuration
    files provided:

    ```console
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
    ```
    If you use windows, please use this command (save as `example.bat` and run it).
    ```bat
    @echo off
    setlocal enabledelayedexpansion
    REM Define Homedir
    set "HomeDir=%USERPROFILE%"
    set "sourceDir=%HomeDir%\.zprezto\runcoms"
    set "linkDir=%HomeDir%"
    echo "sourceDir = %sourceDir%"
    echo "linkDir = %linkDir%"

    REM Create Config Linking
    if not exist "%linkDir%" mkdir "%linkDir%"
    for /R "%sourceDir%" %%F in (*) do (
        set "fileName=%%~nxF"
        REM echo "filename=!fileName!"
        REM echo "F=%%F"
        REM pause
        if /I not "!fileName!"=="README.md" (
            mklink "%linkDir%\.!fileName!" "%%F"
        )
    )

    REM Define 
    set PROMPT_DIR="%HomeDir%\.zprezto\modules\prompt"
    echo "PROMPT_DIR: %PROMPT_DIR%"
    set array[0]="%PROMPT_DIR%\functions\async"
    set array[1]="%PROMPT_DIR%\functions\prompt_agnoster_setup"
    set array[2]="%PROMPT_DIR%\functions\prompt_powerlevel10k_setup"
    set array[3]="%PROMPT_DIR%\functions\prompt_powerline_setup"
    set array[4]="%PROMPT_DIR%\functions\prompt_pure_setup"

    REM Del Prompt External Functions
    for /l %%i in (0,1,4) do (
        echo "!array[%%i]!"
        del /f !array[%%i]!
    )

    REM Make Linking For External Functions
    mklink "%PROMPT_DIR%\functions\async" "%PROMPT_DIR%\external\async\async.zsh"
    mklink "%PROMPT_DIR%\functions\prompt_agnoster_setup" "%PROMPT_DIR%\external\agnoster\agnoster.zsh-theme"
    mklink "%PROMPT_DIR%\functions\prompt_powerlevel10k_setup" "%PROMPT_DIR%\external\powerlevel10k\powerlevel10k.zsh-theme"
    mklink "%PROMPT_DIR%\functions\prompt_powerline_setup" "%PROMPT_DIR%\external\powerline\prompt_powerline_setup"
    mklink "%PROMPT_DIR%\functions\prompt_pure_setup" "%PROMPT_DIR%\external\pure\pure.zsh"

    endlocal
    ```

    If you use **windows**, please use this command。
    
    ```bat
    @echo off
    setlocal enabledelayedexpansion
    REM YOUR HOME DIR
    set "HomeDir=%USERPROFILE%"
    set "sourceDir=%HomeDir%\.zprezto\runcoms"
    set "linkDir=%HomeDir%"
    echo "sourceDir = %sourceDir%"
    echo "linkDir = %linkDir%"
    
    if not exist "%linkDir%" mkdir "%linkDir%"
    for /R "%sourceDir%" %%F in (*) do (
        set "fileName=%%~nxF"
        REM echo "filename=!fileName!"
        REM echo "F=%%F"
        REM pause
        if /I not "!fileName!"=="README.md" (
            mklink "%linkDir%\.!fileName!" "%%F"
        )
    )
    ```
    
    **Note:** If you already have any of the given configuration files, `ln` in
    the above operation will cause an error. In simple cases, you can load
    Prezto by adding the line `source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"` to
    the bottom of your _`${ZDOTDIR:-$HOME}/.zshrc`_ and keep the rest of your
    Zsh configuration intact. For more complicated setups, we recommend that you
    back up your original configs and replace them with the provided Prezto
    [_`runcoms`_][10].
    
04. Set Zsh as your default shell:

    ```console
    chsh -s /bin/zsh
    ```

05. Open a new Zsh terminal window or tab.

### Troubleshooting

If you are not able to find certain commands after switching to Prezto, modify
the `PATH` variable in _`${ZDOTDIR:-$HOME}/.zprofile`_ then open a new Zsh
terminal window or tab.

## Updating

Run `zprezto-update` to automatically check if there is an update to Prezto.
If there are no file conflicts, Prezto and its submodules will be automatically
updated. If there are conflicts you will be instructed to go into the
`$ZPREZTODIR` directory and resolve them yourself.

To pull the latest changes and update submodules manually:

```console
cd $ZPREZTODIR
git pull
git submodule sync --recursive
git submodule update --init --recursive
```

## Usage

Prezto has many features disabled by default. Read the source code and the
accompanying README files to learn about what is available.

### Modules

01. Browse [_`modules`_][9] to see what is available.
02. Load the modules you need in _`${ZDOTDIR:-$HOME}/.zpreztorc`_ and then open
    a new Zsh terminal window or tab.

### Themes

01. For a list of themes, type `prompt -l`.
02. To preview a theme, type `prompt -p name`.
03. Load the theme you like in _`${ZDOTDIR:-$HOME}/.zpreztorc`_ and then
    open a new Zsh terminal window or tab.

    ![sorin theme][2]
    Note that the [_`git`_][11] module may be required for special symbols to
    appear, such as those on the right of the above image. Add `'git'` to the
    `pmodule` list (under `zstyle ':prezto:load' pmodule \` in your
    _`${ZDOTDIR:-$HOME}/.zpreztorc`_) to enable this module.

### External Modules

01. By default modules will be loaded from [_`/modules`_][9] and _`/contrib`_.
02. Additional module directories can be added to the
    `:prezto:load:pmodule-dirs` setting in _`${ZDOTDIR:-$HOME}/.zpreztorc`_.

    Note that module names need to be unique or they will cause an error when
    loading.

    ```sh
    zstyle ':prezto:load' pmodule-dirs $HOME/.zprezto-contrib
    ```

## Customization

The project is managed via [Git][3]. We highly recommend that you fork this
project so that you can commit your changes and push them to your fork on
[GitHub][4] to preserve them. If you do not know how to use Git, follow this
[tutorial][5] and bookmark this [reference][6].

## Resources

The [Zsh Reference Card][7] and the [zsh-lovers][8] man page are indispensable.

## License

This project is licensed under the MIT License.

[1]: https://www.zsh.org
[2]: https://i.imgur.com/nrGV6pg.png "sorin theme"
[3]: https://git-scm.com
[4]: https://github.com
[5]: https://gitimmersion.com
[6]: https://git.github.io/git-reference/
[7]: http://www.bash2zsh.com/zsh_refcard/refcard.pdf
[8]: https://grml.org/zsh/zsh-lovers.html
[9]: modules#readme
[10]: runcoms#readme
[11]: modules/git#readme
