---
name: beads:cleanup
description: Use when cleaning up old beads issues — deletes closed issues to keep the working set small
---

# Beads Cleanup

Delete old closed issues to keep the working set small. Closed issues remain in git history.

```
bd cleanup
```

Keep working issue set under ~500 issues. Beyond that, agents may struggle to read `issues.jsonl` directly.
