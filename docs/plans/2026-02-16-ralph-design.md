# Ralph: Ralph Wiggum Loop for Claude Code

A Python script that implements the [Ralph Wiggum loop](https://ralph-wiggum.ai/) pattern -- repeatedly running Claude Code with fresh context until a task is complete.

## Concept

Ralph is a thin outer loop. It reads a plan file, expands `@shorthand` sigils, passes the expanded text as a prompt to `claude -p`, and checks for a `<promise>DONE</promise>` marker. If not done, it loops with a completely fresh Claude session. State lives on disk (files, git, beads), not in Claude's context window.

Ralph does not parse tasks or manage work items. Claude itself figures out what to do by reading the plan, which might say "use beads" or reference specific bead IDs.

## Input Modes

1. **Plan file mode** (default): reads a markdown file from `RALPHDIR` and uses its contents as the prompt.
2. **Bead mode** (`-b BD-42`): constructs a prompt telling Claude to resolve a bead and its children.

## Shorthand Expansion

Plan files can contain `@sigil` tokens that ralph expands before sending to Claude.

- Expansions are defined in config files (TOML).
- `@beads` might expand to instructions about using the `bd` CLI.
- `@done` might expand to instructions about signaling completion.
- Undefined `@word` tokens are left as-is.
- No recursive expansion (expanded text is not re-scanned).

## CLI

```
ralph run [plan_file]       # Run the loop (default: RALPHDIR/plan.md)
ralph run -b BD-42          # Run in bead mode (--bead / -b)
ralph init                  # Create RALPHDIR with template plan and config
ralph expand [plan_file]    # Preview expanded prompt (debugging)
ralph expansions            # List defined expansions
```

### Flags for `ralph run`

- `--max-iterations N` -- safety limit (default: 20)
- `--ralphdir PATH` -- override RALPHDIR
- `--dry-run` -- expand and print prompt, don't run Claude
- `--allowed-tools TOOLS` -- passed through to `claude --allowedTools`
- `--max-turns N` -- passed through to `claude --max-turns`
- `--verbose` -- show iteration details

## File Layout

```
<git-repo-root>/
  openspec/ralph/           # RALPHDIR (default)
    plan.md                 # Default plan file
    config.toml             # Local config

~/.config/ralph/
  config.toml               # Global config
```

Local config overrides global; both are merged.

## Config Format (TOML)

```toml
[defaults]
max_iterations = 20
max_turns = 10
allowed_tools = "Bash,Read,Edit,Write,Glob,Grep"

[expansions]
beads = """
Use the beads (`bd`) issue tracker to manage tasks.
Run `bd ready` to find available work.
"""

done = """
When all tasks are complete, output <promise>DONE</promise> on its own line.
"""

tc = "Run typecheck with `npm run typecheck`."
```

## Implementation

- Single Python file: `bin/ralph`
- Uses `uv` script mode (`# /// script` header) for dependency management
- Dependencies: `click` (CLI), `tomli` (TOML reading for <3.11 compat, or stdlib `tomllib`)
- Shells out to `claude -p` via `subprocess`
- Linked to `~/bin/ralph` via existing `link-bin.sh`

## Core Loop Pseudocode

```python
for iteration in range(max_iterations):
    prompt = read_plan(plan_file)
    prompt = expand_shorthands(prompt, expansions)

    result = subprocess.run(
        ["claude", "-p", prompt,
         "--allowedTools", allowed_tools,
         "--max-turns", str(max_turns)],
        capture_output=True, text=True
    )

    if "<promise>DONE</promise>" in result.stdout:
        print(f"Completed in {iteration + 1} iterations")
        break

    print(f"Iteration {iteration + 1}: not done, restarting with fresh context")
```

## Future Work (Not in v1)

- A Claude skill or ralph subcommand to generate beads from a template prompt ("plan-to-beads" workflow).

## References

- [snarktank/ralph](https://github.com/snarktank/ralph) -- original Ralph implementation
- [ralph-wiggum.ai](https://ralph-wiggum.ai/) -- Ralph Wiggum concept site
- [Ralph Loop tutorial (Goose)](https://block.github.io/goose/docs/tutorials/ralph-loop/)
