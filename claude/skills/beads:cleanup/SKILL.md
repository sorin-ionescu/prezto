---
name: beads:cleanup
description: Use when doing maintenance on beads issues — running doctor, cleanup, sync, upgrade, or resolving merge conflicts in .beads/ files
---

# Beads Cleanup

Maintenance routine for the beads (`bd`) issue tracker. Run regularly to keep the database healthy.

## Routine

Run these in order:

1. `bd doctor --fix` — diagnose issues, run migrations, update git hooks
2. `bd cleanup` — delete old closed issues (safe — they remain in git history)
3. `bd sync` — sync database and push to git
4. `bd upgrade` — check for updates (weekly)

Keep working issue set under ~500 issues. Beyond that, agents may struggle to read `issues.jsonl` directly.

## Merge Conflicts

Beads conflicts happen during merges/rebases. When they occur, clean up broken rebases and conflicts in `.beads/` files. This is improving with each release but still happens.

## Schedule

| Task | Frequency |
|------|-----------|
| `bd doctor --fix` | Daily or after upgrades |
| `bd cleanup` | Daily or every few days |
| `bd sync` | After closing issues |
| `bd upgrade` | Weekly |
