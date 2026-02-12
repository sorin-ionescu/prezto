Update relevant CLAUDE.md files based on the changes made on the current branch.

## Instructions

1. **Identify the base branch**: Run `git merge-base HEAD main` (fall back to `master` if `main` doesn't exist) to find the common ancestor.

2. **Analyze branch changes**: Run `git diff --stat <merge-base>..HEAD` and `git diff <merge-base>..HEAD` to understand what changed on this branch. Also run `git log --oneline <merge-base>..HEAD` to read the commit messages for additional context.

3. **Find all CLAUDE.md files**: Search the repository for existing CLAUDE.md files (e.g., `CLAUDE.md`, `CLAUDE.local.md`, or any `CLAUDE.md` in subdirectories). Read each one to understand what's already documented.

4. **Determine what to update**: Based on the branch changes, identify new or changed patterns that belong in CLAUDE.md files. Focus on:
   - New conventions or patterns introduced (e.g., naming conventions, file organization, error handling patterns)
   - New commands for building, testing, or linting that were added or changed
   - Architectural decisions reflected in the code (e.g., new modules, dependency choices, API patterns)
   - Changes to project structure (new directories, moved files, renamed modules)
   - New tools, frameworks, or libraries integrated
   - Updated workflows or processes

5. **Scope updates to the right file**: Place updates in the CLAUDE.md closest to the relevant code. Use the root `CLAUDE.md` for project-wide conventions and subdirectory `CLAUDE.md` files for module-specific guidance. Do NOT create new CLAUDE.md files unless the changes clearly warrant a new scope that doesn't fit existing files.

6. **Apply updates**: Edit the relevant CLAUDE.md files. Follow the existing style and structure of each file. Be concise — CLAUDE.md entries should be short, actionable instructions, not lengthy explanations. Do not duplicate information already present. Remove or update entries that are now outdated due to the branch changes.

7. **Summary**: Show me what was updated and why, with a brief rationale for each change.

$ARGUMENTS
