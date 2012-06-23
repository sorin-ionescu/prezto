#
# Defines Git aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Git
alias g='git'

# Branch (b)
alias gb='git branch'
alias gbc='git checkout -b'
alias gbl='git branch -v'
alias gbL='git branch -av'
alias gbx='git branch -d'
alias gbX='git branch -D'
alias gbm='git branch -m'
alias gbM='git branch -M'
alias gbs='git show-branch'
alias gbS='git show-branch -a'

# Commit (c)
alias gc='git commit'
alias gca='git commit --all'
alias gcm='git commit --message'
alias gco='git checkout'
alias gcO='git checkout HEAD --'
alias gcf='git commit --amend --reuse-message HEAD'
alias gcp='git cherry-pick --ff'
alias gcP='git cherry-pick --no-commit'
alias gcr='git revert'
alias gcR='git reset "HEAD^"'
alias gcs='git show'
alias gcl='git-commit-lost'

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
alias gfc='git clone'
alias gfm='git pull'
alias gfr='git pull --rebase'

# Index (i)
alias gia='git add'
alias giA='git add --patch'
alias giu='git add --update'
alias gid='git diff --no-ext-diff --cached'
alias giD='git diff --no-ext-diff --cached --word-diff'
alias gir='git reset'
alias giR='git reset --keep'
alias gix='git rm -r --cached'
alias giX='git rm -rf --cached'
alias gig='git grep --cached'

# Konflict (k)
alias gkl='git status | sed -n "s/^.*both [a-z]*ed: *//p"'
alias gka='git add $(gkl)'
alias gke='git mergetool $(gkl)'
alias gko='git checkout --ours --'
alias gkO='gko $(gkl)'
alias gkt='git checkout --theirs --'
alias gkT='gkt $(gkl)'

# Log (l)
git_log_format_medium='--pretty=format:%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
git_log_format_oneline='--pretty=format:%C(green)%h%C(reset) %s%n'
git_log_format_brief='--pretty=format:%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'

alias gl='git log --topo-order ${git_log_format_medium}'
alias gls='git log --topo-order --stat ${git_log_format_medium}'
alias gld='git log --topo-order --stat --patch --full-diff ${git_log_format_medium}'
alias glo='git log --topo-order ${git_log_format_oneline}'
alias glg='git log --topo-order --all --graph ${git_log_format_oneline}'
alias glb='git log --topo-order ${git_log_format_brief}'
alias glc='git shortlog --summary --numbered'

# Merge (m)
alias gm='git merge'
alias gmC='git merge --no-commit'
alias gmF='git merge --no-ff'
alias gma='git merge --abort'
alias gmt='git mergetool'

# Push (p)
alias gp='git push'
alias gpf='git push --force'
alias gpa='git push --all'
alias gpA='git push --all && git push --tags'
alias gpt='git push --tags'
alias gpc='git push --set-upstream origin "$(git-branch-current)"'
alias gpp='git pull origin "$(git-branch-current)" && git push origin "$(git-branch-current)"'

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
alias gRc='git remote prune'
alias gRs='git remote show'
alias gRb='git-hub'

# Stash (s)
alias gs='git stash'
alias gsa='git stash apply'
alias gsc='git-stash-clear-interactive'
alias gsx='git stash drop'
alias gsd='git-stash-dropped'
alias gsl='git stash list'
alias gsL='git stash show --patch --stat'
alias gsp='git stash pop'
alias gsr='git-stash-recover'
alias gss='git stash save --include-untracked'
alias gsS='git stash save --patch --no-keep-index'

# Submodule (S)
alias gS='git submodule'
alias gSa='git submodule add'
alias gSf='git submodule foreach'
alias gSi='git submodule init'
alias gSl='git submodule status'
alias gSs='git submodule sync'
alias gSu='git submodule update --init --recursive'
alias gSU='git submodule foreach git pull origin master'

# Working Copy (w)
alias gws='git status --short'
alias gwS='git status'
alias gwd='git diff --no-ext-diff'
alias gwD='git diff --no-ext-diff --word-diff'
alias gwr='git reset --soft'
alias gwR='git reset --hard'
alias gwc='git clean -n'
alias gwC='git clean -f'
alias gwx='git rm -r'
alias gwX='git rm -rf'
alias gwg='git grep'

