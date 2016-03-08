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
  # If the `hub` command exists, use that in place of git
  if (( $+commands[hub] )); then
    alias git='hub'
  fi

  # Git
  alias g='git'

  # Add (a)
  alias ga='git add'
  alias gaa='git add --all'
  alias gapa='git add --patch'
  alias gau='git add --update'

  # Branch (b)
  alias gb='git branch'
  alias gba='git branch -a'
  alias gbc='git checkout -b'
  alias gbl='git branch -v'
  alias gbL='git branch -av'
  alias gbr='git branch --remote'
  alias gbx='git branch -d'
  alias gbX='git branch -D'
  alias gbm='git branch -m'
  alias gbM='git branch -M'
  alias gbs='git show-branch'
  alias gbS='git show-branch -a'

  # Commit (c)
  alias gc='git commit -v'
  alias gc!='git commit -v --amend'
  alias gcn!='git commit -v --no-edit --amend'
  alias gca='git commit -v -a'
  alias gca!='git commit -v -a --amend'
  alias gcan!='git commit -v -a --no-edit --amend'
  alias gcans!='git commit -v -a -s --no-edit --amend'
  alias gcam='git commit -a -m'
  alias gcmsg='git commit --message'
  alias gcb='git checkout -b'
  alias gco='git checkout'
  alias gcO='git checkout --patch'
  alias gcm='git checkout master'
  alias gcp='git cherry-pick --ff'
  alias gcP='git cherry-pick --no-commit'
  alias gcr='git revert'
  alias gcR='git reset "HEAD^"'
  alias gcs='git show'

  # Conflict (C)
  alias gCl='git status | sed -n "s/^.*both [a-z]*ed: *//p"'
  alias gCa='git add $(gCl)'
  alias gCe='git mergetool $(gCl)'
  alias gCo='git checkout --ours --'
  alias gCO='gCo $(gCl)'
  alias gCt='git checkout --theirs --'
  alias gCT='gCt $(gCl)'

  # Diff (d)
  alias gd='git diff --no-ext-diff'
  alias gdca='git diff --no-ext-diff --cached'
  alias giD='git diff --no-ext-diff --cached --word-diff'
  alias gir='git reset'
  alias giR='git reset --patch'
  alias gix='git rm -r --cached'
  alias giX='git rm -rf --cached'
  alias gdi='git status --porcelain --short --ignored | sed -n "s/^!! //p"'

  # Fetch (f)
  alias gf='git fetch'
  alias gfa='git fetch --all --prune'
  alias gfc='git clone'
  alias gfcr='git clone --recurse-submodules'
  alias gfm='git pull'
  alias gfr='git pull --rebase'

  # Grep (g)
  alias gg='git grep'
  alias ggi='git grep --ignore-case'
  alias ggl='git grep --files-with-matches'
  alias ggL='git grep --files-without-matches'
  alias ggv='git grep --invert-match'
  alias ggw='git grep --word-regexp'

  # Log (l)
  alias gl='git log --topo-order --pretty=format:"${_git_log_medium_format}"'
  alias gls='git log --topo-order --stat --pretty=format:"${_git_log_medium_format}"'
  alias gld='git log --topo-order --stat --patch --full-diff --pretty=format:"${_git_log_medium_format}"'
  alias glo='git log --topo-order --pretty=format:"${_git_log_oneline_format}"'
  alias glg='git log --topo-order --all --graph --pretty=format:"${_git_log_oneline_format}"'
  alias glb='git log --topo-order --pretty=format:"${_git_log_brief_format}"'
  alias glc='git shortlog --summary --numbered'
  alias glog='git log --oneline --decorate --graph'
  alias gloga='git log --oneline --decorate --graph --all'
  alias glp="_git_log_prettily"

  # Merge (m)
  alias gm='git merge'
  alias gmC='git merge --no-commit'
  alias gmF='git merge --no-ff'
  alias gma='git merge --abort'
  alias gmt='git mergetool'
  alias gmtvim='git mergetool --no-prompt --tool=vimdiff'
  alias gmom='git merge origin/master'
  alias gmum='git merge upstream/master'

  # Push (p)
  alias gp='git push'
  alias ggpush='git push origin $(git-branch-current)'
  alias gpf='git push --force'
  alias gpa='git push --all'
  alias gpA='git push --all && git push --tags'
  alias gpt='git push --tags'
  alias gpc='git push --set-upstream origin "$(git-branch-current 2> /dev/null)"'
  alias ggpull='git pull origin $(git-branch-current)'
  alias gpp='git pull origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'
  alias gpd='git push --dry-run'
  alias gpu='git push upstream'
  alias gpv='git push -v'
  alias gprb='git pull --rebase'

  # Rebase (rb)
  alias grb='git rebase'
  alias grbm='git rebase master'
  alias grba='git rebase --abort'
  alias grbc='git rebase --continue'
  alias grbi='git rebase --interactive'
  alias grbs='git rebase --skip'

  # Remote (r)
  alias gr='git remote'
  alias grl='git remote --verbose'
  alias grv='git remote --verbose'
  alias gra='git remote add'
  alias grrm='git remote remove'
  alias grmv='git remote rename'
  alias grup='git remote update'
  alias grp='git remote prune'
  alias grs='git remote show'
  alias grset='git remote set-url'
  alias grbrowse='git-hub-browse'

  # Reset (r)
  alias grh='git reset HEAD'
  alias grhh='git reset HEAD --hard'
  alias gru='git reset --'

  # Stash (s)
  alias gs='git stash'
  alias gsa='git stash apply'
  alias gsx='git stash drop'
  alias gsX='git-stash-clear-interactive'
  alias gsl='git stash list'
  alias gsL='git-stash-dropped'
  alias gsd='git stash show --patch --stat'
  alias gstp='git stash pop'
  alias gsr='git-stash-recover'
  alias gss='git stash save --include-untracked'
  alias gsS='git stash save --patch --no-keep-index'
  alias gsw='git stash save --include-untracked --keep-index'

  # Status
  alias gsb='git status -sb'
  alias gss='git status -s'
  alias gst='git status'

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
