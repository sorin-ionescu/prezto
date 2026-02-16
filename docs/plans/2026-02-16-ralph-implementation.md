# Ralph Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build a Python CLI tool (`bin/ralph`) that implements the Ralph Wiggum loop -- repeatedly running Claude Code with fresh context until a task is complete.

**Architecture:** Single-file `uv` script with click for CLI. Reads TOML config (global + local), expands `@sigil` shorthands in plan files, shells out to `claude -p`, checks for `<promise>DONE</promise>` completion marker. State lives on disk, each Claude invocation is a fresh session.

**Tech Stack:** Python 3.11+ (via uv), click, tomllib (stdlib). Single file with `uv` script inline metadata.

---

### Task 1: Scaffold the script with uv metadata and CLI skeleton

**Files:**
- Create: `bin/ralph`

**Step 1: Create the script file with uv script header and click CLI**

```python
#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.11"
# dependencies = ["click>=8.0"]
# ///

"""Ralph: Ralph Wiggum loop for Claude Code."""

import click


@click.group()
def cli():
    """Ralph Wiggum loop for Claude Code.

    Repeatedly runs Claude Code with fresh context until a task is complete.
    """
    pass


@cli.command()
def run():
    """Run the ralph loop."""
    click.echo("ralph run: not yet implemented")


@cli.command()
def init():
    """Initialize RALPHDIR with template plan and config."""
    click.echo("ralph init: not yet implemented")


@cli.command()
def expand():
    """Preview the expanded prompt."""
    click.echo("ralph expand: not yet implemented")


@cli.command()
def expansions():
    """List defined expansions."""
    click.echo("ralph expansions: not yet implemented")


if __name__ == "__main__":
    cli()
```

**Step 2: Make it executable**

Run: `chmod +x bin/ralph`

**Step 3: Verify the scaffold works**

Run: `uv run --script bin/ralph --help`
Expected: Click help output showing the four commands.

Run: `uv run --script bin/ralph run`
Expected: "ralph run: not yet implemented"

**Step 4: Commit**

```bash
git add bin/ralph
git commit -m "feat(ralph): scaffold CLI with uv script metadata and click"
```

---

### Task 2: Config loading (global + local TOML, merged)

**Files:**
- Modify: `bin/ralph`

**Step 1: Add config resolution logic**

Add these functions to `bin/ralph`, above the click commands:

```python
import tomllib
import subprocess
from pathlib import Path
from typing import Any


DONE_MARKER = "<promise>DONE</promise>"
DEFAULT_RALPHDIR_NAME = "openspec/ralph"
GLOBAL_CONFIG_PATH = Path.home() / ".config" / "ralph" / "config.toml"


def find_git_root() -> Path | None:
    """Find the root of the current git repository."""
    result = subprocess.run(
        ["git", "rev-parse", "--show-toplevel"],
        capture_output=True, text=True,
    )
    if result.returncode == 0:
        return Path(result.stdout.strip())
    return None


def find_ralphdir(override: str | None = None) -> Path:
    """Resolve RALPHDIR: explicit override > git repo default."""
    if override:
        return Path(override)
    git_root = find_git_root()
    if git_root:
        return git_root / DEFAULT_RALPHDIR_NAME
    return Path.cwd() / DEFAULT_RALPHDIR_NAME


def load_toml(path: Path) -> dict[str, Any]:
    """Load a TOML file, returning empty dict if it doesn't exist."""
    if not path.exists():
        return {}
    with open(path, "rb") as f:
        return tomllib.load(f)


def deep_merge(base: dict, override: dict) -> dict:
    """Merge override into base, recursively for nested dicts."""
    result = base.copy()
    for key, value in override.items():
        if key in result and isinstance(result[key], dict) and isinstance(value, dict):
            result[key] = deep_merge(result[key], value)
        else:
            result[key] = value
    return result


def load_config(ralphdir: Path) -> dict[str, Any]:
    """Load and merge global + local config."""
    global_cfg = load_toml(GLOBAL_CONFIG_PATH)
    local_cfg = load_toml(ralphdir / "config.toml")
    return deep_merge(global_cfg, local_cfg)
```

**Step 2: Add a `--ralphdir` option to the CLI group and pass config via click context**

Update the `cli` group:

```python
@click.group()
@click.option("--ralphdir", default=None, help="Override RALPHDIR path.")
@click.pass_context
def cli(ctx, ralphdir):
    """Ralph Wiggum loop for Claude Code.

    Repeatedly runs Claude Code with fresh context until a task is complete.
    """
    ctx.ensure_object(dict)
    rd = find_ralphdir(ralphdir)
    ctx.obj["ralphdir"] = rd
    ctx.obj["config"] = load_config(rd)
```

**Step 3: Wire up the `expansions` command to read from config**

```python
@cli.command()
@click.pass_context
def expansions(ctx):
    """List defined expansions."""
    cfg = ctx.obj["config"]
    exps = cfg.get("expansions", {})
    if not exps:
        click.echo("No expansions defined.")
        return
    for name, value in sorted(exps.items()):
        preview = value.strip().replace("\n", " ")
        if len(preview) > 70:
            preview = preview[:67] + "..."
        click.echo(f"  @{name} -> {preview}")
```

**Step 4: Verify config loading**

Create a temporary test config and verify:

Run: `mkdir -p /tmp/ralph-test && cat > /tmp/ralph-test/config.toml << 'EOF'`
```toml
[expansions]
hello = "Hello, world!"
```
`EOF`

Run: `uv run --script bin/ralph --ralphdir /tmp/ralph-test expansions`
Expected: `  @hello -> Hello, world!`

Run: `rm -rf /tmp/ralph-test`

**Step 5: Commit**

```bash
git add bin/ralph
git commit -m "feat(ralph): config loading with global/local TOML merge"
```

---

### Task 3: Shorthand expansion

**Files:**
- Modify: `bin/ralph`

**Step 1: Add the expansion function**

```python
import re


def expand_shorthands(text: str, expansions: dict[str, str]) -> str:
    """Expand @sigil tokens in text using the expansions dict.

    Only expands known sigils. Unknown @words are left as-is.
    No recursive expansion.
    """
    def replacer(match: re.Match) -> str:
        name = match.group(1)
        if name in expansions:
            return expansions[name].strip()
        return match.group(0)  # leave unknown @words as-is

    return re.sub(r"@(\w+)", replacer, text)
```

**Step 2: Wire up the `expand` command**

```python
@cli.command()
@click.argument("plan_file", required=False)
@click.pass_context
def expand(ctx, plan_file):
    """Preview the expanded prompt."""
    ralphdir = ctx.obj["ralphdir"]
    cfg = ctx.obj["config"]

    if plan_file is None:
        plan_file = ralphdir / "plan.md"
    else:
        plan_file = Path(plan_file)

    if not plan_file.exists():
        click.echo(f"Plan file not found: {plan_file}", err=True)
        raise SystemExit(1)

    text = plan_file.read_text()
    expanded = expand_shorthands(text, cfg.get("expansions", {}))
    click.echo(expanded)
```

**Step 3: Verify expansion**

Run:
```bash
mkdir -p /tmp/ralph-test
cat > /tmp/ralph-test/config.toml << 'TOML'
[expansions]
beads = "Use beads (`bd`) to manage tasks."
done = "Output <promise>DONE</promise> when complete."
TOML
cat > /tmp/ralph-test/plan.md << 'MD'
# My Plan

@beads
@done

Do the thing. Contact @someone for help.
MD
uv run --script bin/ralph --ralphdir /tmp/ralph-test expand
```

Expected output:
```
# My Plan

Use beads (`bd`) to manage tasks.
Output <promise>DONE</promise> when complete.

Do the thing. Contact @someone for help.
```

Note: `@someone` is left as-is because it's not a defined expansion.

Run: `rm -rf /tmp/ralph-test`

**Step 4: Commit**

```bash
git add bin/ralph
git commit -m "feat(ralph): shorthand expansion with @sigil syntax"
```

---

### Task 4: The core loop (`ralph run`)

**Files:**
- Modify: `bin/ralph`

**Step 1: Implement the run command**

```python
import sys


def build_bead_prompt(bead_id: str) -> str:
    """Build a prompt for bead mode."""
    return (
        f"Resolve bead `{bead_id}` and all its child issues.\n"
        f"Use `bd show {bead_id}` to see the bead details.\n"
        f"Use `bd ready` to find available child tasks.\n"
        f"Work through them one at a time.\n"
        f"When all tasks are complete, output {DONE_MARKER} on its own line."
    )


def run_claude(prompt: str, allowed_tools: str | None, max_turns: int | None) -> subprocess.CompletedProcess:
    """Run claude -p with the given prompt."""
    cmd = ["claude", "-p", prompt]
    if allowed_tools:
        cmd.extend(["--allowedTools", allowed_tools])
    if max_turns:
        cmd.extend(["--max-turns", str(max_turns)])
    return subprocess.run(cmd, capture_output=False, text=True)


@cli.command()
@click.argument("plan_file", required=False)
@click.option("-b", "--bead", default=None, help="Run in bead mode with the given bead ID.")
@click.option("--max-iterations", type=int, default=None, help="Max loop iterations.")
@click.option("--max-turns", type=int, default=None, help="Max Claude turns per iteration.")
@click.option("--allowed-tools", default=None, help="Tools to auto-approve (passed to claude).")
@click.option("--dry-run", is_flag=True, help="Print expanded prompt and exit.")
@click.option("--verbose", is_flag=True, help="Show iteration details.")
@click.pass_context
def run(ctx, plan_file, bead, max_iterations, max_turns, allowed_tools, dry_run, verbose):
    """Run the ralph loop."""
    ralphdir = ctx.obj["ralphdir"]
    cfg = ctx.obj["config"]
    defaults = cfg.get("defaults", {})

    max_iterations = max_iterations or defaults.get("max_iterations", 20)
    max_turns = max_turns or defaults.get("max_turns", None)
    allowed_tools = allowed_tools or defaults.get("allowed_tools", None)
    expansions = cfg.get("expansions", {})

    # Build the prompt
    if bead:
        prompt = build_bead_prompt(bead)
        prompt = expand_shorthands(prompt, expansions)
    else:
        if plan_file is None:
            plan_path = ralphdir / "plan.md"
        else:
            plan_path = Path(plan_file)

        if not plan_path.exists():
            click.echo(f"Plan file not found: {plan_path}", err=True)
            click.echo(f"Run 'ralph init' to create one, or specify a file.", err=True)
            raise SystemExit(1)

        prompt = plan_path.read_text()
        prompt = expand_shorthands(prompt, expansions)

    if dry_run:
        click.echo(prompt)
        return

    # The loop
    for iteration in range(1, max_iterations + 1):
        if verbose:
            click.echo(f"\n{'='*60}")
            click.echo(f"Ralph iteration {iteration}/{max_iterations}")
            click.echo(f"{'='*60}\n")

        result = run_claude(prompt, allowed_tools, max_turns)

        # Check stdout for done marker (when captured) or just check return code
        # Since we're not capturing output (letting it stream to terminal),
        # we need Claude to write the marker to a file instead.
        # Alternative: capture output and check.
        # For now, we ask the user after each iteration.
        if result.returncode != 0:
            click.echo(f"\nClaude exited with code {result.returncode}", err=True)

        if verbose:
            click.echo(f"\nIteration {iteration} complete.")

        # Ask whether to continue
        if not click.confirm("\nContinue with another iteration?", default=True):
            click.echo("Stopped by user.")
            return

    click.echo(f"\nReached max iterations ({max_iterations}). Stopping.")
```

**Step 2: Verify with dry-run**

```bash
mkdir -p /tmp/ralph-test
cat > /tmp/ralph-test/config.toml << 'TOML'
[defaults]
max_iterations = 5

[expansions]
done = "Output <promise>DONE</promise> when complete."
TOML
cat > /tmp/ralph-test/plan.md << 'MD'
Fix the bug.
@done
MD
uv run --script bin/ralph --ralphdir /tmp/ralph-test run --dry-run
```

Expected:
```
Fix the bug.
Output <promise>DONE</promise> when complete.
```

Run: `uv run --script bin/ralph --ralphdir /tmp/ralph-test run -b BD-42 --dry-run`

Expected: The bead mode prompt mentioning BD-42.

Run: `rm -rf /tmp/ralph-test`

**Step 3: Commit**

```bash
git add bin/ralph
git commit -m "feat(ralph): core loop with plan file and bead mode"
```

---

### Task 5: `ralph init` command

**Files:**
- Modify: `bin/ralph`

**Step 1: Implement init**

```python
TEMPLATE_CONFIG = """\
[defaults]
max_iterations = 20
# max_turns = 10
# allowed_tools = "Bash,Read,Edit,Write,Glob,Grep"

[expansions]
done = "When all tasks are complete, output <promise>DONE</promise> on its own line."
beads = \"\"\"
Use the beads (`bd`) issue tracker to manage tasks.
Run `bd ready` to find available work.
\"\"\"
"""

TEMPLATE_PLAN = """\
# Plan

@done

Describe what you want Claude to accomplish here.
"""


@cli.command()
@click.pass_context
def init(ctx):
    """Initialize RALPHDIR with template plan and config."""
    ralphdir = ctx.obj["ralphdir"]

    if ralphdir.exists():
        click.echo(f"RALPHDIR already exists: {ralphdir}")
        if not click.confirm("Overwrite template files?", default=False):
            return

    ralphdir.mkdir(parents=True, exist_ok=True)

    config_path = ralphdir / "config.toml"
    if not config_path.exists():
        config_path.write_text(TEMPLATE_CONFIG)
        click.echo(f"Created {config_path}")
    else:
        click.echo(f"Skipped {config_path} (already exists)")

    plan_path = ralphdir / "plan.md"
    if not plan_path.exists():
        plan_path.write_text(TEMPLATE_PLAN)
        click.echo(f"Created {plan_path}")
    else:
        click.echo(f"Skipped {plan_path} (already exists)")

    click.echo(f"\nRALPHDIR initialized at {ralphdir}")
    click.echo("Edit plan.md with your task, then run: ralph run")
```

**Step 2: Verify init**

Run: `uv run --script bin/ralph --ralphdir /tmp/ralph-init-test init`
Expected: Creates the directory with config.toml and plan.md.

Run: `cat /tmp/ralph-init-test/config.toml` -- should show template config.
Run: `cat /tmp/ralph-init-test/plan.md` -- should show template plan.

Run: `uv run --script bin/ralph --ralphdir /tmp/ralph-init-test init`
Expected: Warns that RALPHDIR already exists, asks to overwrite.

Run: `rm -rf /tmp/ralph-init-test`

**Step 3: Commit**

```bash
git add bin/ralph
git commit -m "feat(ralph): init command with template plan and config"
```

---

### Task 6: Done marker detection via captured output

**Files:**
- Modify: `bin/ralph`

**Step 1: Refactor run_claude to capture output while still streaming**

The tricky part: we want Claude's output to stream to the terminal (so the user can watch), but also capture it to check for the done marker. Use `subprocess.Popen` with a tee-like approach.

```python
def run_claude_streaming(prompt: str, allowed_tools: str | None, max_turns: int | None) -> tuple[int, str]:
    """Run claude -p, streaming output to terminal and capturing it.

    Returns (return_code, captured_stdout).
    """
    cmd = ["claude", "-p", prompt]
    if allowed_tools:
        cmd.extend(["--allowedTools", allowed_tools])
    if max_turns:
        cmd.extend(["--max-turns", str(max_turns)])

    captured = []
    proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=None, text=True)

    for line in proc.stdout:
        sys.stdout.write(line)
        sys.stdout.flush()
        captured.append(line)

    proc.wait()
    return proc.returncode, "".join(captured)
```

**Step 2: Update the run loop to use automatic done detection**

Replace the `run_claude` call and the manual confirmation with:

```python
    for iteration in range(1, max_iterations + 1):
        if verbose:
            click.echo(f"\n{'='*60}")
            click.echo(f"Ralph iteration {iteration}/{max_iterations}")
            click.echo(f"{'='*60}\n")

        returncode, output = run_claude_streaming(prompt, allowed_tools, max_turns)

        if returncode != 0:
            click.echo(f"\nClaude exited with code {returncode}", err=True)

        if DONE_MARKER in output:
            click.echo(f"\nDone! Completed in {iteration} iteration(s).")
            return

        if verbose:
            click.echo(f"\nIteration {iteration}: no done marker, restarting with fresh context.")

    click.echo(f"\nReached max iterations ({max_iterations}). Stopping.")
```

**Step 3: Remove the old `run_claude` function**

Delete the simple `run_claude` function that used `subprocess.run`.

**Step 4: Verify**

Run: `uv run --script bin/ralph --ralphdir /tmp/ralph-test run --dry-run`
Expected: Still works (dry-run doesn't invoke Claude).

**Step 5: Commit**

```bash
git add bin/ralph
git commit -m "feat(ralph): stream output while capturing for done marker detection"
```

---

### Task 7: Final polish and link

**Files:**
- Modify: `bin/ralph`

**Step 1: Add version and clean up**

Add at the top of the module, after the docstring:

```python
__version__ = "0.1.0"
```

Add `--version` to the CLI group:

```python
@click.group()
@click.version_option(__version__, prog_name="ralph")
@click.option("--ralphdir", default=None, help="Override RALPHDIR path.")
@click.pass_context
def cli(ctx, ralphdir):
    ...
```

**Step 2: Verify the full CLI**

Run: `uv run --script bin/ralph --version`
Expected: `ralph, version 0.1.0`

Run: `uv run --script bin/ralph --help`
Expected: Help with all five commands listed.

Run: `uv run --script bin/ralph expansions`
Expected: "No expansions defined." (no config in current RALPHDIR).

**Step 3: Link to ~/bin**

Run: `bash link-bin.sh` (from repo root)
Verify: `ls -la ~/bin/ralph` -- should point to `bin/ralph`.

Run: `ralph --help`
Expected: Same output as before, but now callable directly.

**Step 4: Commit**

```bash
git add bin/ralph
git commit -m "feat(ralph): version flag and final polish"
```

---

### Summary of commands after implementation

```
ralph --help              # Show help
ralph --version           # Show version
ralph init                # Set up RALPHDIR
ralph expansions          # List @sigil expansions
ralph expand [file]       # Preview expanded prompt
ralph run [file]          # Run the loop
ralph run -b BD-42        # Run in bead mode
ralph run --dry-run       # Show prompt without running
ralph run --verbose       # Show iteration details
```
