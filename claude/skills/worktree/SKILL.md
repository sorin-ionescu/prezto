---
description: Set up and manage git worktree slots for parallel agent work.
---

## Arguments

$ARGUMENTS

If no arguments are provided, default to `setup`.

## Commands

### `setup`

Set up the worktree infrastructure for the current repository.

1. **Create root directory**: `mkdir -p .worktrees`

2. **Git ignore**: Check `.gitignore` for `.worktrees/`. If not present, append it.

3. **Create Slot 1** (if `.worktrees/slot-1` does not exist):
   ```
   git worktree add -b agent/slot-1 .worktrees/slot-1 HEAD
   ```

4. **Create Slot 2** (if `.worktrees/slot-2` does not exist):
   ```
   git worktree add -b agent/slot-2 .worktrees/slot-2 HEAD
   ```

5. **Update CLAUDE.md**: Append the following section to the project's `CLAUDE.md` if not already present:

   ```
   ## Agent Worktree Protocol

   Persistent worktree slots exist under `.worktrees/` for parallel agent work. Using these preserves compilation caches and avoids re-cloning.

   ### Slots

   | Slot | Path | Branch |
   |------|------|--------|
   | slot-1 | `.worktrees/slot-1` | `agent/slot-1` |
   | slot-2 | `.worktrees/slot-2` | `agent/slot-2` |

   ### Usage

   1. To start a task in a slot: `cd .worktrees/slot-1` → `git pull origin <main-branch>` → `git checkout -b feature/my-feature`
   2. Do not delete the `.worktrees/` directories — they are persistent caches.
   3. When running dev servers or tools in parallel across slots, use different ports to avoid conflicts.
   ```

6. **Report**: Confirm what was created and the current state of `.worktrees/`.

### `status`

Show the current state of all worktree slots.

1. Run `git worktree list` to display all worktrees.
2. For each slot that exists, show the current branch and last commit.

### `reset <slot>`

Reset a slot back to the main branch (e.g., `reset slot-1`).

1. `cd .worktrees/<slot>`
2. `git checkout agent/<slot>`
3. `git reset --hard origin/<main-branch>` (confirm with user first)

### `remove <slot>`

Remove a worktree slot (confirm with user first).

1. `git worktree remove .worktrees/<slot>`
2. `git branch -d agent/<slot>` (if safe to delete)
