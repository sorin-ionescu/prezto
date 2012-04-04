#
# Defines Git aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Git
alias g='git'
compdef g=git 2> /dev/null

# Branch (b)
alias gb='git branch'
compdef _git gb=git-branch 2> /dev/null
alias gbc='git checkout -b'
compdef _git gbc=git-checkout 2> /dev/null
alias gbl='git branch -v'
compdef _git gbl=git-branch 2> /dev/null
alias gbL='git branch -av'
compdef _git gbL=git-branch 2> /dev/null
alias gbx='git branch -d'
compdef _git gbx=git-branch 2> /dev/null
alias gbX='git branch -D'
compdef _git gbX=git-branch 2> /dev/null
alias gbm='git branch -m'
compdef _git gbm=git-branch 2> /dev/null
alias gbM='git branch -M'
compdef _git gbM=git-branch 2> /dev/null

# Commit (c)
alias gc='git commit'
compdef _git gc=git-commit 2> /dev/null
alias gca='git commit --all'
compdef _git gca=git-commit 2> /dev/null
alias gcm='git commit --message'
compdef _git gcm=git-commit 2> /dev/null
alias gco='git checkout'
compdef _git gco=git-checkout 2> /dev/null
alias gcO='git checkout HEAD --'
compdef _git gcO=git-checkout 2> /dev/null
alias gcf='git commit --amend --reuse-message HEAD'
compdef _git gcf=git-commit 2> /dev/null
alias gcp='git cherry-pick --ff'
compdef _git gcp=git-cherry-pick 2> /dev/null
alias gcP='git cherry-pick --no-commit'
compdef _git gcP=git-cherry-pick 2> /dev/null
alias gcr='git revert'
compdef _git gcr=git-revert 2> /dev/null
alias gcR='git reset "HEAD^"'
compdef _git gcR=git-reset 2> /dev/null
alias gcs='git show'
compdef _git gcs=git-show 2> /dev/null
alias gcv='git fsck | awk '\''/dangling commit/ {print $3}'\'' | git show --format="SHA1: %C(green)%h%C(reset) %f" --stdin | awk '\''/SHA1/ {sub("SHA1: ", ""); print}'\'''

# Data (d)
alias gd='git ls-files'
compdef _git gd=git-ls-files 2> /dev/null
alias gdc='git ls-files --cached'
compdef _git gdc=git-ls-files 2> /dev/null
alias gdx='git ls-files --deleted'
compdef _git gdx=git-ls-files 2> /dev/null
alias gdm='git ls-files --modified'
compdef _git gdm=git-ls-files 2> /dev/null
alias gdu='git ls-files --other --exclude-standard'
compdef _git gdu=git-ls-files 2> /dev/null
alias gdk='git ls-files --killed'
compdef _git gdk=git-ls-files 2> /dev/null
alias gdi='git status --porcelain --short --ignored | sed -n "s/^!! //p"'

# Fetch (f)
alias gf='git fetch'
compdef _git gf=git-fetch 2> /dev/null
alias gfc='git clone'
compdef _git gfc=git-clone 2> /dev/null
alias gfm='git pull'
compdef _git gfm=git-pull 2> /dev/null
alias gfr='git pull --rebase'
compdef _git gfr=git-pull 2> /dev/null

# Index (i)
alias gia='git add'
compdef _git gia=git-add 2> /dev/null
alias giA='git add --patch'
compdef _git giA=git-add 2> /dev/null
alias giu='git add --update'
compdef _git giu=git-add 2> /dev/null
alias gid='git diff --no-ext-diff --cached'
compdef _git gid=git-diff 2> /dev/null
alias giD='git diff --no-ext-diff --cached --word-diff'
compdef _git giD=git-diff 2> /dev/null
alias gir='git reset --mixed'
compdef _git gir=git-reset 2> /dev/null
alias giR='git reset --keep'
compdef _git giR=git-reset 2> /dev/null
alias gix='git rm -r --cached'
compdef _git gix=git-rm 2> /dev/null
alias giX='git rm -rf --cached'
compdef _git giX=git-rm 2> /dev/null
alias gig='git grep --cached'
compdef _git gig=git-grep 2> /dev/null

# Konflict (k)
alias gkl='git status | sed -n "s/^.*both [a-z]*ed: *//p"'
alias gka='git add $(gkl)'
compdef _git gka=git-add 2> /dev/null
alias gke='git mergetool $(gkl)'
alias gko='git checkout --ours --'
compdef _git gko=git-checkout 2> /dev/null
alias gkO='gko $(gkl)'
alias gkt='git checkout --theirs --'
compdef _git gkt=git-checkout 2> /dev/null
alias gkT='gkt $(gkl)'

# Log (l)
git_log_format_medium='--pretty=format:%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
git_log_format_oneline='--pretty=format:%C(green)%h%C(reset) %s%n'
git_log_format_brief='--pretty=format:%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'

alias gl='git log --topo-order ${git_log_format_medium}'
compdef _git gl=git-log 2> /dev/null
alias gls='git log --topo-order --stat ${git_log_format_medium}'
compdef _git gls=git-log 2> /dev/null
alias gld='git log --topo-order --stat --patch --full-diff ${git_log_format_medium}'
compdef _git gld=git-log 2> /dev/null
alias glo='git log --topo-order ${git_log_format_oneline}'
compdef _git glo=git-log 2> /dev/null
alias glg='git log --topo-order --all --graph ${git_log_format_oneline}'
compdef _git glg=git-log 2> /dev/null
alias glb='git log --topo-order ${git_log_format_brief}'
compdef _git glb=git-log 2> /dev/null
alias glc='git shortlog --summary --numbered'
compdef _git glc=git-shortlog 2> /dev/null

# Merge (m)
alias gm='git merge'
compdef _git gm=git-merge 2> /dev/null
alias gmC='git merge --no-commit'
compdef _git gmC=git-merge 2> /dev/null
alias gmF='git merge --no-ff'
compdef _git gmF=git-merge 2> /dev/null
alias gma='git merge --abort'
compdef _git gma=git-merge 2> /dev/null
alias gmt='git mergetool'
compdef _git gmt=git-mergetool 2> /dev/null

# Push (p)
alias gp='git push'
compdef _git gp=git-push 2> /dev/null
alias gpf='git push --force'
compdef _git gpf=git-push 2> /dev/null
alias gpa='git push --all'
compdef _git gpa=git-push 2> /dev/null
alias gpA='git push --all && git push --tags'
compdef _git gpA=git-push 2> /dev/null
alias gpt='git push --tags'
compdef _git gpt=git-push 2> /dev/null
alias gpc='git push --set-upstream origin "$(git-current-branch)"'
compdef _git gpc=git-push 2> /dev/null
alias gpp='git pull origin "$(git-current-branch)" && git push origin "$(git-branch)"'

# Rebase (r)
alias gr='git rebase'
compdef _git gr=git-rebase 2> /dev/null
alias gra='git rebase --abort'
compdef _git gra=git-rebase 2> /dev/null
alias grc='git rebase --continue'
compdef _git grc=git-rebase 2> /dev/null
alias gri='git rebase --interactive'
compdef _git gri=git-rebase 2> /dev/null
alias grs='git rebase --skip'
compdef _git grs=git-rebase 2> /dev/null

# Remote (R)
alias gR='git remote'
compdef _git gh=git-remote 2> /dev/null
alias gRl='git remote --verbose'
compdef _git gRl=git-remote 2> /dev/null
alias gRa='git remote add'
compdef _git gRa=git-remote 2> /dev/null
alias gRx='git remote rm'
compdef _git gRx=git-remote 2> /dev/null
alias gRm='git remote rename'
compdef _git gRm=git-remote 2> /dev/null
alias gRu='git remote update'
compdef _git gRu=git-remote 2> /dev/null
alias gRc='git remote prune'
compdef _git gRc=git-remote 2> /dev/null
alias gRs='git remote show'
compdef _git gRs=git-remote 2> /dev/null
alias gRb='git-hub'
compdef _git-hub gRb=git-hub 2> /dev/null

# Stash (s)
alias gs='git stash'
compdef _git gs=git-stash 2> /dev/null
alias gsa='git stash apply'
compdef _git gsa=git-stash 2> /dev/null
alias gsc='git stash clear'
compdef _git gsc=git-stash 2> /dev/null
alias gsx='git stash drop'
compdef _git gsx=git-stash 2> /dev/null
alias gsl='git stash list'
compdef _git gsl=git-stash 2> /dev/null
alias gsL='git stash show --patch --stat'
compdef _git gsL=git-stash 2> /dev/null
alias gsp='git stash pop'
compdef _git gsp=git-stash 2> /dev/null
alias gss='git stash save --include-untracked'
compdef _git gss=git-stash 2> /dev/null
alias gsS='git stash save --patch --no-keep-index'
compdef _git gsS=git-stash 2> /dev/null

# Submodule (S)
alias gS='git submodule'
compdef _git gS=git-submodule 2> /dev/null
alias gSa='git submodule add'
compdef _git gSa=git-submodule 2> /dev/null
alias gSf='git submodule foreach'
compdef _git gSf=git-submodule 2> /dev/null
alias gSi='git submodule init'
compdef _git gSi=git-submodule 2> /dev/null
alias gSl='git submodule status'
compdef _git gSl=git-submodule 2> /dev/null
alias gSs='git submodule sync'
compdef _git gSs=git-submodule 2> /dev/null
alias gSu='git submodule update'
compdef _git gSu=git-submodule 2> /dev/null
alias gSU='git submodule update --init --recursive'
compdef _git gSU=git-submdoule 2> /dev/null

# Working Copy (w)
alias gws='git status --short'
compdef _git gws=git-status 2> /dev/null
alias gwS='git status'
compdef _git gwS=git-status 2> /dev/null
alias gwd='git diff --no-ext-diff'
compdef _git gwd=git-diff 2> /dev/null
alias gwD='git diff --no-ext-diff --word-diff'
compdef _git gwD=git-diff 2> /dev/null
alias gwr='git reset --soft'
compdef _git gwr=git-reset 2> /dev/null
alias gwR='git reset --hard'
compdef _git gwR=git-reset 2> /dev/null
alias gwc='git clean -n'
compdef _git gwc=git-clean 2> /dev/null
alias gwC='git clean -f'
compdef _git gwC=git-clean 2> /dev/null
alias gwx='git rm -r'
compdef _git gwx=git-rm 2> /dev/null
alias gwX='git rm -rf'
compdef _git gwX=git-rm 2> /dev/null
alias gwg='git grep'
compdef _git gwg=git-grep 2> /dev/null

