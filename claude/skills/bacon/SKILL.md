---
description: Set up the bacon background checker for a Rust project.
---

## Instructions

### Phase 1: Verification

Check that `Cargo.toml` exists in the project root. If not, abort with "Not a Rust project."

### Phase 2: Installation

Run `bacon --version` to check if bacon is installed.

If missing:
1. Report: "Installing bacon via cargo..."
2. Run: `cargo install --locked bacon`
3. Verify installation succeeded.

### Phase 3: Configuration

1. Run `bacon --init` to create `bacon.toml` if it doesn't exist.
2. Check `bacon.toml` for a job named `[jobs.ai]`. If missing, append:

```toml
[jobs.ai]
command = ["cargo", "check", "--color", "never", "--message-format", "short"]
need_stdout = true
watch = ["src"]
```

### Phase 4: Documentation

Append the following to the project's `CLAUDE.md` if not already present:

```
- **Rust Verification (Bacon)**:
  - Do NOT run `cargo check` directly if possible; it can be slow.
  - Run `bacon ai` (or `bacon ai --headless` if in a script) to get instant, uncolored, short-format diagnostics.
  - If you need to see only errors (no warnings), use `bacon ai -- --quiet`.
```

### Phase 5: Completion

Report:
- Whether bacon was installed or already present.
- That the `ai` job has been added to `bacon.toml`.
