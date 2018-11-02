#
# Provides Git aliases and functions.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[git] )); then
  return 1
fi

# Load dependencies.
pmodload 'helper'

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

function current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

if ! zstyle -t ':prezto:module:git:alias' skip 'yes'; then
  # Git
  alias g='git'

  # Branch (b)
  alias gb='git branch'
  alias gba='git branch --all --verbose'
  alias gbc='git checkout -b'
  alias gbd='git branch --delete'
  alias gbD='git branch --delete --force'

  # Commit (c)
  alias gc='git commit --verbose'
  alias gco='git checkout'
  alias gcp='git cherry-pick --ff'
  alias grv='git revert'
  alias gRh='git reset "HEAD^"'

  # Fetch (f)
  alias gf='git fetch'
  alias gfa='git fetch --all'
  alias gcl='git clone'
  alias gfcr='git clone --recurse-submodules'

  alias ggpull='git pull origin $(git_current_branch)'
	compdef _git ggpull=git-checkout

  # Grep (g)
	alias gg='git --no-pager grep -n'
  # alias ggi='git grep --ignore-case'
  # alias ggl='git grep --files-with-matches'
  # alias ggL='git grep --files-without-matches'
  # alias ggv='git grep --invert-match'
  # alias ggw='git grep --word-regexp'

  # Index (i)
  alias ga='git add'
  alias gaa='git add --all'
  alias gid='git diff --no-ext-diff --cached'
  alias giD='git diff --no-ext-diff --cached --word-diff'
  alias gir='git reset'
  alias giR='git reset --patch'

  # Merge (m)
  alias gm='git merge'
  alias gmom='git merge origin/master'
  alias gmod='git merge origin/develop'
  alias gma='git merge --abort'

  # Push (p)
  alias gpf='git push --force-with-lease'
  alias gpF='git push --force'
	alias ggpush='git push origin $(git_current_branch)'
	compdef _git ggpush=git-checkout

  # Rebase (r)
  alias gr='git rebase'
  alias gra='git rebase --abort'
  alias grc='git rebase --continue'

  # Stash (s)
  alias gs='git stash'
  alias gsl='git stash list'
  alias gsd='git stash show --patch --stat'
  alias gsp='git stash pop'

  # Tag (t)
  alias gt='git tag'

  # Working Copy (w)
  alias gst='git status'
  alias gwd='git diff --no-ext-diff'
  alias gwD='git diff --no-ext-diff --word-diff'
  alias gwr='git reset --soft'
  alias gwR='git reset --hard'
  alias gic='git clean -i'
  alias gix='git rm -r'
  alias giX='git rm -rf'
fi
