#
# Defines Git aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Settings
#
#

# Log
zstyle -s ':prezto:module:git:log:medium' format '_git_log_medium_format' \
  || _git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
zstyle -s ':prezto:module:git:log:oneline' format '_git_log_oneline_format' \
  || _git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'
zstyle -s ':prezto:module:git:log:brief' format '_git_log_brief_format' \
  || _git_log_brief_format='%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'

# Status
zstyle -s ':prezto:module:git:status:ignore' submodules '_git_status_ignore_submodules' \
  || _git_status_ignore_submodules='none'

#
# Aliases
#

if ! zstyle -t ':prezto:module:git:alias' skip 'yes'; then
  # Git
  alias g='git'

  # Branch (b)
  alias gb='git branch'
  alias gba='git branch --all --verbose'
  alias gbc='git checkout -b'
  alias gbd='git branch --delete'
  alias gbD='git branch --delete --force'
  alias gbl='git branch --verbose'
  alias gbL='git branch --all --verbose'
  alias gbm='git branch --move'
  alias gbM='git branch --move --force'
  alias gbr='git branch --move'
  alias gbR='git branch --move --force'
  alias gbs='git show-branch'
  alias gbS='git show-branch --all'
  alias gbv='git branch --verbose'
  alias gbV='git branch --verbose --verbose'
  alias gbx='git branch --delete'
  alias gbX='git branch --delete --force'

  # Commit (c)
  alias gc='git commit --verbose'
  alias gca='git commit --verbose --all'
  alias gcm='git commit --message'
  alias gcS='git commit -S --verbose'
  alias gcSa='git commit -S --verbose --all'
  alias gcSm='git commit -S --message'
  alias gcam='git commit --all --message'
  alias gco='git checkout'
  alias gcO='git checkout --patch'
  alias gcf='git commit --amend --reuse-message HEAD'
  alias gcSf='git commit -S --amend --reuse-message HEAD'
  alias gcF='git commit --verbose --amend'
  alias gcSF='git commit -S --verbose --amend'
  alias gcp='git cherry-pick --ff'
  alias gcP='git cherry-pick --no-commit'
  alias gcr='git revert'
  alias gcR='git reset "HEAD^"'
  alias gcs='git show'
  alias gcsS='git show --pretty=short --show-signature'
  alias gcl='git-commit-lost'
  alias gcy='git cherry -v --abbrev'
  alias gcY='git cherry -v'

  # Conflict (C)
  alias gCl='git --no-pager diff --name-only --diff-filter=U'
  alias gCa='git add $(gCl)'
  alias gCe='git mergetool $(gCl)'
  alias gCo='git checkout --ours --'
  alias gCO='gCo $(gCl)'
  alias gCt='git checkout --theirs --'
  alias gCT='gCt $(gCl)'

  # Data (d)
  alias gd='git ls-files'
  alias gdc='git ls-files --cached'
  alias gdx='git ls-files --deleted'
  alias gdm='git ls-files --modified'
  alias gdu='git ls-files --other --exclude-standard'
  alias gdk='git ls-files --killed'
  alias gdi='git status --porcelain --short --ignored | sed -n "s/^!! //p"'

  # Fetch (f)
  alias gf='git fetch'
  alias gfa='git fetch --all'
  alias gfc='git clone'
  alias gfcr='git clone --recurse-submodules'
  alias gfm='git pull'
  alias gfma='git pull --autostash'
  alias gfr='git pull --rebase'
  alias gfra='git pull --rebase --autostash'

  # Flow (F)
  alias gFi='git flow init'
  alias gFf='git flow feature'
  alias gFb='git flow bugfix'
  alias gFl='git flow release'
  alias gFh='git flow hotfix'
  alias gFs='git flow support'

  alias gFfl='git flow feature list'
  alias gFfs='git flow feature start'
  alias gFff='git flow feature finish'
  alias gFfp='git flow feature publish'
  alias gFft='git flow feature track'
  alias gFfd='git flow feature diff'
  alias gFfr='git flow feature rebase'
  alias gFfc='git flow feature checkout'
  alias gFfm='git flow feature pull'
  alias gFfx='git flow feature delete'

  alias gFbl='git flow bugfix list'
  alias gFbs='git flow bugfix start'
  alias gFbf='git flow bugfix finish'
  alias gFbp='git flow bugfix publish'
  alias gFbt='git flow bugfix track'
  alias gFbd='git flow bugfix diff'
  alias gFbr='git flow bugfix rebase'
  alias gFbc='git flow bugfix checkout'
  alias gFbm='git flow bugfix pull'
  alias gFbx='git flow bugfix delete'

  alias gFll='git flow release list'
  alias gFls='git flow release start'
  alias gFlf='git flow release finish'
  alias gFlp='git flow release publish'
  alias gFlt='git flow release track'
  alias gFld='git flow release diff'
  alias gFlr='git flow release rebase'
  alias gFlc='git flow release checkout'
  alias gFlm='git flow release pull'
  alias gFlx='git flow release delete'

  alias gFhl='git flow hotfix list'
  alias gFhs='git flow hotfix start'
  alias gFhf='git flow hotfix finish'
  alias gFhp='git flow hotfix publish'
  alias gFht='git flow hotfix track'
  alias gFhd='git flow hotfix diff'
  alias gFhr='git flow hotfix rebase'
  alias gFhc='git flow hotfix checkout'
  alias gFhm='git flow hotfix pull'
  alias gFhx='git flow hotfix delete'

  alias gFsl='git flow support list'
  alias gFss='git flow support start'
  alias gFsf='git flow support finish'
  alias gFsp='git flow support publish'
  alias gFst='git flow support track'
  alias gFsd='git flow support diff'
  alias gFsr='git flow support rebase'
  alias gFsc='git flow support checkout'
  alias gFsm='git flow support pull'
  alias gFsx='git flow support delete'

  # Grep (g)
  alias gg='git grep'
  alias ggi='git grep --ignore-case'
  alias ggl='git grep --files-with-matches'
  alias ggL='git grep --files-without-matches'
  alias ggv='git grep --invert-match'
  alias ggw='git grep --word-regexp'

  # Index (i)
  alias gia='git add'
  alias giA='git add --patch'
  alias giu='git add --update'
  alias gid='git diff --no-ext-diff --cached'
  alias giD='git diff --no-ext-diff --cached --word-diff'
  alias gii='git update-index --assume-unchanged'
  alias giI='git update-index --no-assume-unchanged'
  alias gir='git reset'
  alias giR='git reset --patch'
  alias gix='git rm -r --cached'
  alias giX='git rm -rf --cached'

  # Log (l)
  alias gl='git log --topo-order --pretty=format:"${_git_log_medium_format}"'
  alias gls='git log --topo-order --stat --pretty=format:"${_git_log_medium_format}"'
  alias gld='git log --topo-order --stat --patch --full-diff --pretty=format:"${_git_log_medium_format}"'
  alias glo='git log --topo-order --pretty=format:"${_git_log_oneline_format}"'
  alias glg='git log --topo-order --all --graph --pretty=format:"${_git_log_oneline_format}"'
  alias glb='git log --topo-order --pretty=format:"${_git_log_brief_format}"'
  alias glc='git shortlog --summary --numbered'
  alias glS='git log --show-signature'

  # Merge (m)
  alias gm='git merge'
  alias gmC='git merge --no-commit'
  alias gmF='git merge --no-ff'
  alias gma='git merge --abort'
  alias gmt='git mergetool'

  # Push (p)
  alias gp='git push'
  alias gpf='git push --force-with-lease'
  alias gpF='git push --force'
  alias gpa='git push --all'
  alias gpA='git push --all && git push --tags'
  alias gpt='git push --tags'
  alias gpc='git push --set-upstream origin "$(git-branch-current 2> /dev/null)"'
  alias gpp='git pull origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'

  # Rebase (r)
  alias gr='git rebase'
  alias gra='git rebase --abort'
  alias grc='git rebase --continue'
  alias gri='git rebase --interactive'
  alias grs='git rebase --skip'

  # Remote (R)
  alias gR='git remote'
  alias gRl='git remote --verbose'
  alias gRa='git remote add'
  alias gRx='git remote rm'
  alias gRm='git remote rename'
  alias gRu='git remote update'
  alias gRp='git remote prune'
  alias gRs='git remote show'
  alias gRb='git-hub-browse'

  # Stash (s)
  alias gs='git stash'
  alias gsa='git stash apply'
  alias gsx='git stash drop'
  alias gsX='git-stash-clear-interactive'
  alias gsl='git stash list'
  alias gsL='git-stash-dropped'
  alias gsd='git stash show --patch --stat'
  alias gsp='git stash pop'
  alias gsr='git-stash-recover'
  alias gss='git stash save --include-untracked'
  alias gsS='git stash save --patch --no-keep-index'
  alias gsw='git stash save --include-untracked --keep-index'

  # Submodule (S)
  alias gS='git submodule'
  alias gSa='git submodule add'
  alias gSf='git submodule foreach'
  alias gSi='git submodule init'
  alias gSI='git submodule update --init --recursive'
  alias gSl='git submodule status'
  alias gSm='git-submodule-move'
  alias gSs='git submodule sync'
  alias gSu='git submodule foreach git pull origin master'
  alias gSx='git-submodule-remove'

  # Tag (t)
  alias gt='git tag'
  alias gtl='git tag -l'
  alias gts='git tag -s'
  alias gtv='git verify-tag'

  # Working Copy (w)
  alias gws='git status --ignore-submodules=${_git_status_ignore_submodules} --short'
  alias gwS='git status --ignore-submodules=${_git_status_ignore_submodules}'
  alias gwd='git diff --no-ext-diff'
  alias gwD='git diff --no-ext-diff --word-diff'
  alias gwr='git reset --soft'
  alias gwR='git reset --hard'
  alias gwc='git clean -n'
  alias gwC='git clean -f'
  alias gwx='git rm -r'
  alias gwX='git rm -rf'
fi
