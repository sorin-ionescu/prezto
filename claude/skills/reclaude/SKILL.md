---
description: Update relevant CLAUDE.md files based on the changes made on the current branch.
---

## Instructions

1. **Identify the base branch**: Run `git merge-base HEAD main` (fall back to `master` if `main` doesn't exist) to find the common ancestor.

2. **Analyze branch changes**: Run `git diff --stat <merge-base>..HEAD` and `git diff <merge-base>..HEAD` to understand what changed on this branch. Also run `git log --oneline <merge-base>..HEAD` to read the commit messages for additional context.

3. **Find all CLAUDE.md files**: Search the repository for existing CLAUDE.md files (e.g., `CLAUDE.md`, `CLAUDE.local.md`, or any `CLAUDE.md` in subdirectories). Read each one to understand what's already documented.

4. **Determine what to update**: Based on the branch changes, identify entries that belong in CLAUDE.md files. For every candidate line, apply this filter: **"Would removing this cause Claude to make mistakes?"** If not, don't add it. A bloated CLAUDE.md causes Claude to ignore actual instructions.

   **DO add** (decisions Claude can't reverse-engineer from the code):
   - Style choices invisible in the codebase (e.g., "Use ES modules, not CommonJS")
   - Boundaries with no code signal (e.g., "Don't touch /legacy")
   - Workflow decisions only your team made (e.g., "Run single tests, not the full suite")
   - New build/test/lint commands that were added or changed

   **DO NOT add** (these are noise that dilutes what matters):
   - Standard language conventions Claude already knows
   - How a system works (Claude can read the code)
   - API documentation (link to it instead)
   - Aspirations like "write clean code" — only concrete decisions
   - Anything Claude could figure out by reading the files

5. **Scope updates to the right file**: Place updates in the CLAUDE.md closest to the relevant code. Use the root `CLAUDE.md` for project-wide conventions and subdirectory `CLAUDE.md` files for module-specific guidance. Do NOT create new CLAUDE.md files unless the changes clearly warrant a new scope that doesn't fit existing files.

6. **Apply updates**: Edit the relevant CLAUDE.md files. Follow the existing style and structure of each file. Be concise — CLAUDE.md entries should be short, actionable instructions, not lengthy explanations. The file should feel uncomfortably short; that means it's working. Do not duplicate information already present. Remove or update entries that are now outdated due to the branch changes. Ruthlessly remove anything that doesn't pass the "would removing this cause mistakes?" bar.

7. **Summary**: Show me what was updated and why, with a brief rationale for each change.

$ARGUMENTS
