---
description: Use when working through the next epic's tasks end-to-end — selecting an epic, dispatching subagents per task, shipping, and iterating on CI until green
---

# Next Epic

Work through an epic's tasks via subagents, ship the result, and get CI green.

## Arguments

- **Label:** `beads:next-epic alloy` — first open epic with that label, by priority
- **ID:** `beads:next-epic BD-42` — specific epic
- **None:** highest-priority open epic

## The Flow

```dot
digraph next_epic {
    "Select epic" [shape=doublecircle];
    "Run beads:agents loop" [shape=box];
    "bd epic close-eligible" [shape=box];
    "Invoke ship skill" [shape=box];
    "gh pr checks --watch" [shape=box];
    "Green?" [shape=diamond];
    "Report PR URL" [shape=doublecircle];
    "Best-effort fix" [shape=box];
    "Attempts < 2?" [shape=diamond];
    "Report failure + PR URL" [shape=doublecircle];

    "Select epic" -> "Run beads:agents loop";
    "Run beads:agents loop" -> "bd epic close-eligible";
    "bd epic close-eligible" -> "Invoke ship skill";
    "Invoke ship skill" -> "gh pr checks --watch";
    "gh pr checks --watch" -> "Green?";
    "Green?" -> "Report PR URL" [label="yes"];
    "Green?" -> "Best-effort fix" [label="no"];
    "Best-effort fix" -> "Attempts < 2?" ;
    "Attempts < 2?" -> "gh pr checks --watch" [label="yes — push fix"];
    "Attempts < 2?" -> "Report failure + PR URL" [label="no — stop"];
}
```

## Phase 1: Select Epic

```bash
bd list --type epic --status open   # filter by label/ID from arguments
```

Pick highest priority match. If multiple ambiguous matches, ask the user. Display epic title and task count before proceeding.

## Phase 2: Execute Tasks

**REQUIRED:** Use `beads:agents` skill — sequential mode, one subagent per task, 1-2 sentence summaries between agents. Parent never reads files or explores code.

After the loop completes: `bd epic close-eligible`

## Phase 3: Ship

**REQUIRED:** Invoke the `ship` skill. This commits, pushes, and creates the PR.

## Phase 4: PR Until Green

1. `gh pr checks --watch` to wait for CI
2. If green: report PR URL. Done.
3. If failing:
   - Read logs: `gh pr checks` then `gh run view <run-id> --log-failed`
   - Code issue → fix, commit, push
   - Flaky/infra → push empty commit to re-trigger
   - Loop back to step 1 (max 2 fix attempts)
4. After 2 failed attempts: stop and report failure with PR URL and check details

$ARGUMENTS
