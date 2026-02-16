---
description: Commit and push changes to a branch.
---

## Instructions

1. **Branch check**: Run `git branch --show-current` to get the current branch name.
   - If on `main` or `master`, create and check out a new branch. Derive the branch name from the staged/unstaged changes (short, kebab-case, descriptive).
   - If already on a feature branch, check for a closed/merged PR (see step 4 pre-check below). If one exists, create a new branch off the main branch instead — derive the name from the changes, cherry-pick or re-apply the commits, and proceed on the new branch.
   - Otherwise, stay on the current feature branch.

2. **Commit**: Stage and commit the changes without asking for confirmation. Follow the repository's commit message conventions based on recent `git log`. Summarize all staged changes accurately.

3. **Push**: Push the branch to `origin` with `-u` to set upstream tracking.

4. **Pull Request**: Run `gh pr view --json url,state` to check if a PR already exists for this branch.
   - If no PR exists, or the existing PR is closed/merged, create a new one with `gh pr create`. Derive the title and body from the commit(s) on the branch. Use `--fill` as a starting point but write a clear summary.
   - If an open PR already exists, display its URL.

$ARGUMENTS
