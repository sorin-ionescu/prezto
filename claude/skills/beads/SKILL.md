---
name: beads
description: Use when creating, listing, updating, closing, or searching issues, tasks, bugs, or TODOs, managing dependencies between issues, or when the user mentions tracking work items — uses the bd (beads) CLI issue tracker
---

# Beads Issue Tracker

Beads (`bd`) is a git-native issue tracker that lives in `.beads/` inside a repository. Use it for lightweight issue management without leaving the terminal.

## Pre-check

Before using any `bd` command, verify the project has beads initialized:

```bash
ls .beads/config.yaml
```

If not present, do NOT use bd commands — tell the user beads isn't set up in this project.

## Quick Reference

### Creating Issues

| Command | Purpose |
|---|---|
| `bd create "title"` | Create an issue |
| `bd create "title" -t bug -p 1` | Bug with high priority (0=critical, 4=backlog) |
| `bd create "title" -d "description" -l "label1,label2"` | With description and labels |
| `bd create "title" --deps <id>` | With dependency on another issue |
| `bd create "title" --parent <id>` | As child of an epic/parent |
| `bd q "title"` | Quick capture — outputs only the ID |

### Querying Issues

| Command | Purpose |
|---|---|
| `bd ready` | Work ready to claim (open + no blockers). **Prefer this over `bd list --ready`.** |
| `bd list` | List all open issues |
| `bd list -s in_progress` | Filter by status: open, in_progress, blocked, deferred, closed |
| `bd list -p 0 -p 1` | Filter by priority |
| `bd list -l "bugfix"` | Filter by label |
| `bd list --sort priority` | Sort by: priority, created, updated, status, id, title |
| `bd list --tree` | Hierarchical tree view |
| `bd search "query"` | Full-text search across title, description, and ID |
| `bd show <id>` | Full detail on one issue |
| `bd status` | Project overview and statistics |
| `bd blocked` | All blocked issues |
| `bd count` | Count issues matching filters (same filters as `list`) |

### Updating Issues

| Command | Purpose |
|---|---|
| `bd update <id> -s in_progress` | Set status |
| `bd update <id> --claim` | Atomically claim (set assignee + in_progress; fails if already claimed) |
| `bd update <id> -p 1` | Change priority |
| `bd update <id> --title "new title"` | Rename |
| `bd update <id> -d "new description"` | Update description |
| `bd update <id> --add-label "label"` | Add label |
| `bd close <id>` | Close an issue |
| `bd close <id> -r "reason"` | Close with reason |
| `bd close <id> --suggest-next` | Close and show newly unblocked issues |
| `bd reopen <id>` | Reopen a closed issue |

### Dependencies & Graph

| Command | Purpose |
|---|---|
| `bd dep add <issue> <depends-on>` | Issue depends on depends-on |
| `bd dep remove <issue> <depends-on>` | Remove a dependency |
| `bd dep list <id>` | Show dependencies and dependents |
| `bd dep tree <id>` | Dependency tree |
| `bd dep cycles` | Detect dependency cycles |
| `bd graph <id>` | Visual dependency DAG for one issue |
| `bd graph --all` | Visual DAG for all open issues |

### Maintenance

| Command | Purpose |
|---|---|
| `bd doctor [--fix]` | Diagnose and auto-fix issues, run migrations, update git hooks |
| `bd cleanup` | Delete issues older than N days (safe — issues remain in git history) |
| `bd upgrade` | Upgrade beads to latest release |
| `bd sync` | Sync database and push to git |

### Useful Global Flags

| Flag | Purpose |
|---|---|
| `--json` | JSON output for programmatic parsing |
| `--silent` | On create: output only the issue ID |
| `-q, --quiet` | Errors only |

## Guidelines

1. **Search before creating** — run `bd search "keywords"` to avoid creating duplicate issues.
2. **Use `bd ready`** when the user asks "what should I work on next" — it's smarter than `bd list` because it excludes blocked and deferred issues.
3. **Use `--json` when parsing output** — e.g., checking if duplicates exist before creating.
4. **Add dependencies proactively** — if an issue clearly depends on another, use `bd dep add`.
5. **Never use `bd edit`** — it opens an interactive editor. Use `bd update` with flags instead.
6. **Let bd auto-detect storage mode** — don't pass `--no-db` or `--db` explicitly; the project's `.beads/config.yaml` handles this.
7. **Keep the database small** — run `bd cleanup` regularly. Over ~500 issues, agents may fail to read `issues.jsonl` directly (25k token file-read limit). Deleted issues remain in git history and can be recovered.
8. **Run `bd doctor` regularly** — it diagnoses issues, runs migrations, and updates configuration. Run it daily or after upgrades.
9. **Upgrade frequently** — beads gets frequent bug fixes. Run `bd upgrade` at least every week or two.
10. **Use short issue prefixes** — 2-3 character prefixes (e.g., `bd-`, `vc-`, `ef-`) keep output readable. Change with `bd` commands if needed.

$ARGUMENTS
