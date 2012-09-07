Git
===

Defines [Git][1] utility and information functions and aliases.

Aliases
------

Git
---

  - `g` is alias for 'git'

Branch (b)
----------

  - `gb` is alias for 'git branch'
  - `gbc` is alias for 'git checkout -b'
  - `gbl` is alias for 'git branch -v'
  - `gbL` is alias for 'git branch -av'
  - `gbx` is alias for 'git branch -d'
  - `gbX` is alias for 'git branch -D'
  - `gbm` is alias for 'git branch -m'
  - `gbM` is alias for 'git branch -M'
  - `gbs` is alias for 'git show-branch'
  - `gbS` is alias for 'git show-branch -a'

Commit (c)
----------

  - `gc` is alias for 'git commit'
  - `gca` is alias for 'git commit --all'
  - `gcm` is alias for 'git commit --message'
  - `gco` is alias for 'git checkout'
  - `gcO` is alias for 'git checkout HEAD --'
  - `gcf` is alias for 'git commit --amend --reuse-message HEAD'
  - `gcp` is alias for 'git cherry-pick --ff'
  - `gcP` is alias for 'git cherry-pick --no-commit'
  - `gcr` is alias for 'git revert'
  - `gcR` is alias for 'git reset "HEAD^"'
  - `gcs` is alias for 'git show'
  - `gcl` is alias for 'git-commit-lost'

Data (d)
--------

  - `gd` is alias for 'git ls-files'
  - `gdc` is alias for 'git ls-files --cached'
  - `gdx` is alias for 'git ls-files --deleted'
  - `gdm` is alias for 'git ls-files --modified'
  - `gdu` is alias for 'git ls-files --other --exclude-standard'
  - `gdk` is alias for 'git ls-files --killed'
  - `gdi` is alias for 'git status --porcelain --short --ignored | sed -n "s/^!! //p"'

Fetch (f)
---------

  - `gf` is alias for 'git fetch'
  - `gfc` is alias for 'git clone'
  - `gfm` is alias for 'git pull'
  - `gfr` is alias for 'git pull --rebase'

Index (i)
---------

  - `gia` is alias for 'git add'
  - `giA` is alias for 'git add --patch'
  - `giu` is alias for 'git add --update'
  - `gid` is alias for 'git diff --no-ext-diff --cached'
  - `giD` is alias for 'git diff --no-ext-diff --cached --word-diff'
  - `gir` is alias for 'git reset'
  - `giR` is alias for 'git reset --keep'
  - `gix` is alias for 'git rm -r --cached'
  - `giX` is alias for 'git rm -rf --cached'
  - `gig` is alias for 'git grep --cached'

Konflict (k)
-------------

  - `gkl` is alias for 'git status | sed -n "s/^.\*both [a-z]\*ed: \*//p"'
  - `gka` is alias for 'git add $(gkl)'
  - `gke` is alias for 'git mergetool $(gkl)'
  - `gko` is alias for 'git checkout --ours --'
  - `gkO` is alias for 'gko $(gkl)'
  - `gkt` is alias for 'git checkout --theirs --'
  - `gkT` is alias for 'gkt $(gkl)'

Log (l)
-------

  - `gl` is alias for 'git log --topo-order --pretty=format:Commit: %H%d%nAuthor: %an <%ae>%nDate:   %ai (%ar)%n%+B'
  - `gls` is alias for 'git log --topo-order --stat --pretty=format:Commit: %H%d%nAuthor: %an <%ae>%nDate:   %ai (%ar)%n%+B'
  - `gld` is alias for 'git log --topo-order --stat --patch --full-diff --pretty=format:Commit: %H%d%nAuthor: %an <%ae>%nDate:   %ai (%ar)%n%+B'
  - `glo` is alias for 'git log --topo-order --pretty=format:%h %s%d%n'
  - `glg` is alias for 'git log --topo-order --all --graph --pretty=format:%h %s%d%n'
  - `glb` is alias for 'git log --topo-order --pretty=format:%h %s%n(%ar by %an)%d%n'
  - `glc` is alias for 'git shortlog --summary --numbered'

Merge (m)
---------

  - `gm` is alias for 'git merge'
  - `gmC` is alias for 'git merge --no-commit'
  - `gmF` is alias for 'git merge --no-ff'
  - `gma` is alias for 'git merge --abort'
  - `gmt` is alias for 'git mergetool'

Push (p)
--------

  - `gp` is alias for 'git push'
  - `gpf` is alias for 'git push --force'
  - `gpa` is alias for 'git push --all'
  - `gpA` is alias for 'git push --all && git push --tags'
  - `gpt` is alias for 'git push --tags'
  - `gpc` is alias for 'git push --set-upstream origin "$(git-branch-current)"'
  - `gpp` is alias for 'git pull origin "$(git-branch-current)" && git push origin "$(git-branch-current)"'

Rebase (r)
----------

  - `gr` is alias for 'git rebase'
  - `gra` is alias for 'git rebase --abort'
  - `grc` is alias for 'git rebase --continue'
  - `gri` is alias for 'git rebase --interactive'
  - `grs` is alias for 'git rebase --skip'

Remote (R)
----------

  - `gR` is alias for 'git remote'
  - `gRl` is alias for 'git remote --verbose'
  - `gRa` is alias for 'git remote add'
  - `gRx` is alias for 'git remote rm'
  - `gRm` is alias for 'git remote rename'
  - `gRu` is alias for 'git remote update'
  - `gRc` is alias for 'git remote prune'
  - `gRs` is alias for 'git remote show'
  - `gRb` is alias for 'git-hub'

Stash (s)
---------

  - `gs` is alias for 'git stash'
  - `gsa` is alias for 'git stash apply'
  - `gsc` is alias for 'git-stash-clear-interactive'
  - `gsx` is alias for 'git stash drop'
  - `gsd` is alias for 'git-stash-dropped'
  - `gsl` is alias for 'git stash list'
  - `gsL` is alias for 'git stash show --patch --stat'
  - `gsp` is alias for 'git stash pop'
  - `gsr` is alias for 'git-stash-recover'
  - `gss` is alias for 'git stash save --include-untracked'
  - `gsS` is alias for 'git stash save --patch --no-keep-index'

Submodule (S)
-------------

  - `gS` is alias for 'git submodule'
  - `gSa` is alias for 'git submodule add'
  - `gSf` is alias for 'git submodule foreach'
  - `gSi` is alias for 'git submodule init'
  - `gSl` is alias for 'git submodule status'
  - `gSs` is alias for 'git submodule sync'
  - `gSu` is alias for 'git submodule update --init --recursive'
  - `gSU` is alias for 'git submodule foreach git pull origin master'

Working Copy (w)
----------------
  - `gws` is alias for 'git status --short'
  - `gwS` is alias for 'git status'
  - `gwd` is alias for 'git diff --no-ext-diff'
  - `gwD` is alias for 'git diff --no-ext-diff --word-diff'
  - `gwr` is alias for 'git reset --soft'
  - `gwR` is alias for 'git reset --hard'
  - `gwc` is alias for 'git clean -n'
  - `gwC` is alias for 'git clean -f'
  - `gwx` is alias for 'git rm -r'
  - `gwX` is alias for 'git rm -rf'
  - `gwg` is alias for 'git grep'

Theming
-------

To display git repository information on the prompt, define the
following style in the `prompt_theme_setup` function.

  zstyle ':prezto:module:git' action ':%%B%F{yellow}%s%f%%b'
  zstyle ':prezto:module:git' added ' %%B%F{green}✚%f%%b'
  zstyle ':prezto:module:git' ahead ' %%B%F{yellow}⬆%f%%b'
  zstyle ':prezto:module:git' behind ' %%B%F{yellow}⬇%f%%b'
  zstyle ':prezto:module:git' branch ':%F{red}%b%f'
  zstyle ':prezto:module:git' commit ':%F{green}%.7c%f'
  zstyle ':prezto:module:git' deleted ' %%B%F{red}✖%f%%b'
  zstyle ':prezto:module:git' modified ' %%B%F{blue}✱%f%%b'
  zstyle ':prezto:module:git' position ':%F{green}%p%f'
  zstyle ':prezto:module:git' renamed ' %%B%F{magenta}➜%f%%b'
  zstyle ':prezto:module:git' stashed ' %%B%F{cyan}✭%f%%b'
  zstyle ':prezto:module:git' unmerged ' %%B%F{yellow}═%f%%b'
  zstyle ':prezto:module:git' untracked ' %%B%F{white}◼%f%%b'
  zstyle ':prezto:module:git' info \
    'prompt'  ' %F{blue}git%f$(coalesce "%b" "%p" "%c")%s' \
    'rprompt' '%A%B%S%a%d%m%r%U%u'

Authors
-------

\*The authors of this module should be contacted via the [issue tracker][2].\*

  - [Sorin Ionescu](https://github.com/sorin-ionescu)
[1]: http://git-scm.com/
[2]: https://github.com/sorin-ionescu/prezto/issues
