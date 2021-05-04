# Prezto — Instantly Awesome Zsh

Prezto is the configuration framework for [Zsh][1]; it enriches the command line
interface environment with sane defaults, aliases, functions, auto completion,
and prompt themes.

## Installation

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

03. Create a new Zsh configuration by copying the Zsh configuration files
    provided:

    ```console
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
    ```

    **Note:** If you already have any of the given configuration files, `ln` in
    the above operation will cause an error. In simple cases, you can load
    Prezto by adding the line `source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"` to
    the bottom of your *${ZDOTDIR:-$HOME}/.zshrc* and keep the rest of your Zsh
    configuration intact. For more complicated setups, we recommend that you
    back up your original configs and replace them with the provided Prezto
    *runcoms*.

04. Set Zsh as your default shell:

    ```console
    chsh -s /bin/zsh
    ```

05. Open a new Zsh terminal window or tab.

### Troubleshooting

If you are not able to find certain commands after switching to Prezto, modify
the `PATH` variable in *${ZDOTDIR:-$HOME}/.zprofile* then open a new Zsh
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
git submodule update --init --recursive
```

## Usage

Prezto has many features disabled by default. Read the source code and the
accompanying README files to learn about what is available.

### Modules

01. Browse */modules* to see what is available.
02. Load the modules you need in *${ZDOTDIR:-$HOME}/.zpreztorc* then open a new
    Zsh terminal window or tab.

### Themes

01. For a list of themes, type `prompt -l`.
02. To preview a theme, type `prompt -p name`.
03. Load the theme you like in *${ZDOTDIR:-$HOME}/.zpreztorc* then open a new
    Zsh terminal window or tab.

    ![sorin theme][2]
    Note that the *git* module may be required for special symbols to appear,
    such as those on the right of the above image. Add `'git'` to the `pmodule`
    list (under `zstyle ':prezto:load' pmodule \` in your
    *${ZDOTDIR:-$HOME}/.zpreztorc*) to enable this module.

### External Modules

01. By default modules will be loaded from */modules* and */contrib*.
02. Additional module directories can be added to the
    `:prezto:load:pmodule-dirs` setting in *${ZDOTDIR:-$HOME}/.zpreztorc*.

    Note that module names need to be unique or they will cause an error when
    loading.

    ```console
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
