# Git

Enhances the [Git][1] distributed version control system by providing aliases,
functions and by exposing repository status information to prompts.

This module must be loaded _before_ the [_`completion`_][13] module so that the
provided completion definitions are loaded automatically by _`completion`_
module.

**Note:** Git **2.11** is the minimum required version for better
[git-rev-list][7] and [git-submodule][14] support.

## Settings

### Log

To configure the format of the [git-log][8] output, add the following to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_, and replace `'<context>'` with `'brief'`,
`'oneline'`, and `'medium'`. This will be passed to the `--pretty=format:`
switch.

```sh
zstyle ':prezto:module:git:log:context' format '<context>'
```

### Status

Retrieving the status of a repository with [git-submodule][9] can take a long
time. To configure the submodules to ignore, add the following to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_, and replace `'<state>'` with `'dirty'`,
`'untracked'`, `'all'`, or `'none'`.

```sh
zstyle ':prezto:module:git:status:ignore' submodules '<state>'
```

This setting affects all aliases and functions that call `git-status`.

## Aliases

Aliases are enabled by default. To disable them, add the following to
_`${ZDOTDIR:-$HOME}/.zpreztorc`_.

```sh
zstyle ':prezto:module:git:alias' skip 'yes'
```

### Git

- `g` is short for `git`.

### Branch (b)

- `gb` lists, creates, renames, and deletes branches.
- `gbc` creates a new branch.
- `gbl` lists branches and their commits. (also `gbv`)
- `gbL` lists all local and remote branches and their commits.
- `gbr` renames a branch. (also `gbm`)
- `gbR` renames a branch even if the new branch name already exists. (also
  `gbM`)
- `gbs` lists branches and their commits with ancestry graphs.
- `gbS` lists local and remote branches and their commits with ancestry graphs.
- `gbV` lists branches with more verbose information about their commits.
- `gbx` deletes a branch. (also `gbd`)
- `gbX` deletes a branch irrespective of its merged status. (also `gbD`)

### Commit (c)

- `gc` records changes to the repository.
- `gcS` records changes to the repository. (Signed)
- `gca` stages all modified and deleted files.
- `gcaS` stages all modified and deleted files. (Signed)
- `gcm` records changes to the repository with the given message.
- `gcmS` records changes to the repository with the given message. (Signed)
- `gcam` stages all modified and deleted files, and records changes to the
  repository with the given message.
- `gco` checks out a branch or paths to work tree.
- `gcO` checks out hunks from the index or the tree interactively.
- `gcf` amends the tip of the current branch using the same log message as
  _HEAD_.
- `gcfS` amends the tip of the current branch using the same log message as
  _HEAD_. (Signed)
- `gcF` amends the tip of the current branch.
- `gcFS` amends the tip of the current branch. (Signed)
- `gcp` applies changes introduced by existing commits.
- `gcP` applies changes introduced by existing commits without committing.
- `gcr` reverts existing commits by reverting patches and recording new commits.
- `gcR` removes the _HEAD_ commit.
- `gcs` displays commits with various objects.
- `gcsS` displays commits with GPG signature.
- `gcl` lists lost commits.
- `gcy` displays commits yet to be applied to upstream in the short format.
- `gcY` displays commits yet to be applied to upstream.

### Conflict (C)

- `gCl` lists unmerged files.
- `gCa` adds unmerged file contents to the index.
- `gCe` executes merge-tool on all unmerged file.
- `gCo` checks out our changes for unmerged paths.
- `gCO` checks out our changes for all unmerged paths.
- `gCt` checks out their changes for unmerged paths.
- `gCT` checks out their changes for all unmerged paths.

### Data (d)

- `gd` displays information about files in the index and the work tree.
- `gdc` lists cached files.
- `gdx` lists deleted files.
- `gdm` lists modified files.
- `gdu` lists untracked files.
- `gdk` lists killed files.
- `gdi` lists ignored files.

### Fetch (f)

- `gf` downloads objects and references from another repository.
- `gfa` downloads objects and references from all remote repositories.
- `gfc` clones a repository into a new directory.
- `gfcr` clones a repository into a new directory including all submodules.
- `gfm` fetches from and merges with another repository or local branch.
- `gfr` fetches from and rebases on another repository or local branch.

### Flow (F)

- `gFi` is short for `git flow init`

#### Feature (Ff)

- `gFf` is short for `git flow feature`
- `gFfl` is short for `git flow feature list`
- `gFfs` is short for `git flow feature start`
- `gFff` is short for `git flow feature finish`
- `gFfp` is short for `git flow feature publish`
- `gFft` is short for `git flow feature track`
- `gFfd` is short for `git flow feature diff`
- `gFfr` is short for `git flow feature rebase`
- `gFfc` is short for `git flow feature checkout`
- `gFfm` is short for `git flow feature pull`
- `gFfx` is short for `git flow feature delete`

#### Bugfix (Fb)

- `gFb` is short for `git flow bugfix`
- `gFbl` is short for `git flow bugfix list`
- `gFbs` is short for `git flow bugfix start`
- `gFbf` is short for `git flow bugfix finish`
- `gFbp` is short for `git flow bugfix publish`
- `gFbt` is short for `git flow bugfix track`
- `gFbd` is short for `git flow bugfix diff`
- `gFbr` is short for `git flow bugfix rebase`
- `gFbc` is short for `git flow bugfix checkout`
- `gFbm` is short for `git flow bugfix pull`
- `gFbx` is short for `git flow bugfix delete`

#### Release (Fl)

- `gFl` is short for `git flow release`
- `gFll` is short for `git flow release list`
- `gFls` is short for `git flow release start`
- `gFlf` is short for `git flow release finish`
- `gFlp` is short for `git flow release publish`
- `gFlt` is short for `git flow release track`
- `gFld` is short for `git flow release diff`
- `gFlr` is short for `git flow release rebase`
- `gFlc` is short for `git flow release checkout`
- `gFlm` is short for `git flow release pull`
- `gFlx` is short for `git flow release delete`

#### Hotfix (Fh)

- `gFh` is short for `git flow hotfix`
- `gFhl` is short for `git flow hotfix list`
- `gFhs` is short for `git flow hotfix start`
- `gFhf` is short for `git flow hotfix finish`
- `gFhp` is short for `git flow hotfix publish`
- `gFht` is short for `git flow hotfix track`
- `gFhd` is short for `git flow hotfix diff`
- `gFhr` is short for `git flow hotfix rebase`
- `gFhc` is short for `git flow hotfix checkout`
- `gFhm` is short for `git flow hotfix pull`
- `gFhx` is short for `git flow hotfix delete`

#### Support (Fs)

- `gFs` is short for `git flow support`
- `gFsl` is short for `git flow support list`
- `gFss` is short for `git flow support start`
- `gFsf` is short for `git flow support finish`
- `gFsp` is short for `git flow support publish`
- `gFst` is short for `git flow support track`
- `gFsd` is short for `git flow support diff`
- `gFsr` is short for `git flow support rebase`
- `gFsc` is short for `git flow support checkout`
- `gFsm` is short for `git flow support pull`
- `gFsx` is short for `git flow support delete`

### Grep (g)

- `gg` displays lines matching a pattern.
- `ggi` displays lines matching a pattern ignoring case.
- `ggl` lists files matching a pattern.
- `ggL` lists files that are not matching a pattern.
- `ggv` displays lines not matching a pattern.
- `ggw` displays lines matching a pattern at word boundary.

### Index (i)

- `gia` adds file contents to the index.
- `giA` adds file contents to the index interactively.
- `giu` adds file contents to the index (updates only known files).
- `gid` displays changes between the index and a named commit (diff).
- `giD` displays changes between the index and a named commit (word diff).
- `gii` temporarily ignore differences in a given file.
- `giI` unignore differences in a given file.
- `gir` resets the current HEAD to the specified state.
- `giR` resets the current index interactively.
- `gix` removes files/directories from the index (recursively).
- `giX` removes files/directories from the index (recursively and forced).

### Log (l)

- `gl` displays the log.
- `gls` displays the stats log.
- `gld` displays the diff log.
- `glo` displays the one line log.
- `glg` displays the graph log.
- `glb` displays the brief commit log.
- `glc` displays the commit count for each contributor in descending order.
- `glS` displays the log and checks the validity of signed commits.

### Merge (m)

- `gm` joins two or more development histories together.
- `gmC` joins two or more development histories together but does not commit.
- `gmF` joins two or more development histories together but does not commit
  generating a merge commit even if the merge resolved as a fast-forward.
- `gma` aborts the conflict resolution, and reconstructs the pre-merge state.
- `gmt` runs the merge conflict resolution tools to resolve conflicts.

### Push (p)

- `gp` updates remote refs along with associated objects.
- `gpf` forcefully updates remote refs along with associated objects using the
  safer `--force-with-lease` option.
- `gpF` forcefully updates remote refs along with associated objects using the
  riskier `--force` option.
- `gpa` updates remote branches along with associated objects.
- `gpA` updates remote branches and tags along with associated objects.
- `gpt` updates remote tags along with associated objects.
- `gpc` updates remote refs along with associated objects and adds _origin_ as
  an upstream reference for the current branch.
- `gpp` pulls and pushes from origin to origin.

### Rebase (r)

- `gr` forward-ports local commits to the updated upstream _HEAD_.
- `gra` aborts the rebase.
- `grc` continues the rebase after merge conflicts are resolved.
- `gri` makes a list of commits to be rebased and opens the editor.
- `grs` skips the current patch.

### Remote (R)

- `gR` manages tracked repositories.
- `gRl` lists remote names and their URLs.
- `gRa` adds a new remote.
- `gRx` removes a remote.
- `gRm` renames a remote.
- `gRu` fetches remotes updates.
- `gRp` prunes all stale remote tracking branches.
- `gRs` displays information about a given remote.
- `gRb` opens a remote on [GitHub][3] in the default browser.

### Stash (s)

- `gs` stashes the changes of the dirty working directory.
- `gsa` applies the changes recorded in a stash to the working directory.
- `gsx` drops a stashed state.
- `gsX` drops all the stashed states.
- `gsl` lists stashed states.
- `gsL` lists dropped stashed states.
- `gsd` displays changes between the stash and its original parent.
- `gsp` removes and applies a single stashed state from the stash list.
- `gsr` recovers a given stashed state.
- `gss` stashes the changes of the dirty working directory, including untracked.
- `gsS` stashes the changes of the dirty working directory interactively.
- `gsw` stashes the changes of the dirty working directory retaining the index.

### Submodule (S)

- `gS` initializes, updates, or inspects submodules.
- `gSa` adds given a repository as a submodule.
- `gSf` evaluates a shell command in each of checked out submodules.
- `gSi` initializes submodules.
- `gSI` initializes and clones submodules recursively.
- `gSl` lists the commits of all submodules.
- `gSm` moves a submodule.
- `gSs` synchronizes submodules' remote URL to the value specified in
  _.gitmodules_.
- `gSu` fetches and merges the latest changes for all submodule.
- `gSx` removes a submodule.

### Tag (t)

- `gt` lists tags or creates tag.
- `gtl` lists tags matching pattern.
- `gts` creates a signed tag.
- `gtv` validate a signed tag.

### Working directory (w)

- `gws` displays working-tree status in the short format.
- `gwS` displays working-tree status.
- `gwd` displays changes between the working tree and the index (diff).
- `gwD` displays changes between the working tree and the index (word diff).
- `gwr` resets the current HEAD to the specified state, does not touch the
  index nor the working tree.
- `gwR` resets the current HEAD, index and working tree to the specified state.
- `gwc` removes untracked files from the working tree (dry-run).
- `gwC` removes untracked files from the working tree.
- `gwx` removes files from the working tree and from the index recursively.
- `gwX` removes files from the working tree and from the index recursively and
  forcefully.

### Shadows

The following aliases may shadow system commands:

- `gb` shadows the [GB][10].
- `gm` shadows the [GraphicsMagick image processor][11].
- `gpt` shadows the [GUID partition table maintenance utility][4].
- `gs` shadows the [Ghostscript interpreter and previewer][5].

If you frequently use the above commands, you may wish to remove said aliases
from this module or to disable them at the bottom of the zshrc with `unalias`.

You can temporarily bypass an alias by prefixing it with a backward slash:
`\gpt`.

## Functions

- `git-branch-current` displays the current branch.
- `git-commit-lost` lists lost commits.
- `git-dir` displays the path to the Git directory.
- `git-hub-browse` opens the [GitHub][3] repository in the default browser.
- `git-hub-shorten-url` shortens [GitHub URLs][12].
- `git-info` exposes repository information via the `$git_info` associative
  array.
- `git-root` displays the path to the working tree root.
- `git-stash-clear-interactive` asks for confirmation before clearing the stash.
- `git-stash-dropped` lists dropped stashed states.
- `git-stash-recover` recovers given dropped stashed states.
- `git-submodule-move` moves a submodule.
- `git-submodule-remove` removes a submodule.

## Theming

To display information about the current repository in a prompt, define the
following styles in the `prompt_name_setup` function, where the syntax for
setting a style is as follows.

```sh
zstyle ':prezto:module:git:info:context:subcontext' format 'string'
```

### Main Contexts

| Name     | Format Code | Description                        |
| -------- | :---------: | ---------------------------------- |
| action   |     %s      | Special action name                |
| ahead    |     %A      | Commits ahead of remote count      |
| behind   |     %B      | Commits behind of remote count     |
| branch   |     %b      | Branch name                        |
| commit   |     %c      | Commit hash                        |
| position |     %p      | Commits from the nearest tag count |
| remote   |     %R      | Remote name                        |
| stashed  |     %S      | Stashed states count               |

### Concise Contexts

| Name      | Format Code | Description           |
| --------- | :---------: | --------------------- |
| clean     |     %C      | Clean state           |
| dirty     |     %D      | Dirty files count     |
| indexed   |     %i      | Indexed files count   |
| unindexed |     %I      | Unindexed files count |
| untracked |     %u      | Untracked files count |

The following contexts must be enabled with the following zstyle:

```sh
zstyle ':prezto:module:git:info' verbose 'yes'
```

### Verbose Contexts

| Name      | Format Code | Description           |
| --------- | :---------: | --------------------- |
| added     |     %a      | Added files count     |
| clean     |     %C      | Clean state           |
| deleted   |     %d      | Deleted files count   |
| dirty     |     %D      | Dirty files count     |
| modified  |     %m      | Modified files count  |
| renamed   |     %r      | Renamed files count   |
| unmerged  |     %U      | Unmerged files count  |
| untracked |     %u      | Untracked files count |

### Special Action Contexts

| Name                 | Format | Description                  |
| -------------------- | :----: | ---------------------------- |
| apply                | value  | Applying patches             |
| bisect               | value  | Binary searching for changes |
| cherry-pick          | value  | Cherry picking               |
| cherry-pick-sequence | value  | Cherry picking sequence      |
| merge                | value  | Merging                      |
| rebase               | value  | Rebasing                     |
| rebase-interactive   | value  | Rebasing interactively       |
| rebase-merge         | value  | Rebasing merge               |
| revert               | value  | Reverting                    |
| revert-sequence      | value  | Reverting sequence           |

First, format the repository state attributes. For example, to format the branch
and remote names, define the following styles.

```sh
zstyle ':prezto:module:git:info:branch' format 'branch:%b'
zstyle ':prezto:module:git:info:remote' format 'remote:%R'
```

Second, format how the above attributes are displayed in prompts.

```sh
zstyle ':prezto:module:git:info:keys' format \
  'prompt'  ' git(%b)' \
  'rprompt' '[%R]'
```

Last, add `$git_info[prompt]` to `$PROMPT` and `$git_info[rprompt]` to
`$RPROMPT` respectively and call `git-info` in the `prompt_name_preexec` hook
function.

## Authors

_The authors of this module should be contacted via the [issue tracker][6]._

- [Sorin Ionescu](https://github.com/sorin-ionescu)
- [Colin Hebert](https://github.com/ColinHebert)

[1]: https://www.git-scm.com
[2]: https://hub.github.com
[3]: https://www.github.com
[4]: https://www.manpagez.com/man/8/gpt/
[5]: https://www.manpagez.com/man/1/gs/
[6]: https://github.com/sorin-ionescu/prezto/issues
[7]: https://github.com/sorin-ionescu/prezto/issues/219
[8]: https://git-scm.com/docs/git-log
[9]: https://git-scm.com/docs/git-submodule
[10]: https://getgb.io/
[11]: https://www.manpagez.com/man/1/gm/
[12]: https://github.blog/2011-11-10-git-io-github-url-shortener
[13]: ../completion#readme
[14]: https://github.com/sorin-ionescu/prezto/pull/1929
