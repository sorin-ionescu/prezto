---
description: Detect project tech stacks and set up relevant MCP indexing servers.
---

## Instructions

Proceed through each phase without asking for confirmation at every step. Stop and report only if something fails unexpectedly. If an MCP server fails to install, follow the fallback instructions and continue.

### Phase 1: Diagnostic Scan

Detect active technology stacks in the project root:

- **Rust**: Check for `Cargo.toml`
- **Godot**: Check for `project.godot`
- **Fennel**: Check for any `*.fnl` files (recursive scan)

Report which languages were found.

### Phase 2: MCP Server Registration

Based on detected languages, run the following. Track whether each succeeds or fails.

**If Rust is detected:**
```
claude mcp add code-index-mcp --command uvx --args code-index-mcp
```
Mark `code-index-mcp` as ACTIVE on success, FAILED on failure.

**If Godot is detected:**
```
claude mcp add godot --command npx --args "-y godot-mcp"
```
Note: If running multiple agents/worktrees, the user must specify the port for the open editor:
```
claude mcp add godot --command npx --args "-y godot-mcp" --env "GODOT_PORT=6006"
```
Mark `godot-mcp` as ACTIVE on success, FAILED on failure.

**If Fennel is detected:**
```
claude mcp add ctags --command uvx --args mcp-server-ctags
```
Mark `ctags` as ACTIVE on success, FAILED on failure.

### Phase 3: File Configuration

**`.code-indexignore`** — Create if Rust or Godot detected AND `code-index-mcp` is ACTIVE:
```
target/
.godot/
.git/
*.import
assets/
```

**`CLAUDE.md`** — Create if it doesn't exist. Append the appropriate strategy blocks based on Phase 2 results:

**Rust (ACTIVE):**
```
- **Rust Context**:
  - Use `code_index` tool to find struct definitions, trait implementations, and cross-file references.
  - Do NOT use standard `grep` for Rust types; `code_index` is semantically aware.
  - If looking for a trait impl, search for the trait name using `code_index`.
```

**Rust (FAILED):**
```
- **Rust Context**:
  - `code_index` is unavailable. Use standard `grep` and `glob` patterns.
  - Note that `grep` is not semantic; double-check imports and trait impl blocks manually.
```

**Godot (ACTIVE):**
```
- **Godot/GDScript Context**:
  - Use `godot_mcp` to inspect Scene Trees (`.tscn` files) and Node hierarchies.
  - Never try to read `.tscn` files as raw text; they are often binary or too verbose. Use the MCP tool to query node properties.
```

**Godot (FAILED):**
```
- **Godot/GDScript Context**:
  - `godot_mcp` is unavailable. Read `.tscn` files as text only if absolutely necessary.
  - Prefer reading attached `.gd` scripts to infer node structure.
```

**Fennel (ACTIVE):**
```
- **Fennel (Lisp) Context**:
  - Use `ctags_search` to find function definitions and macros in `.fnl` files.
  - Standard AST tools may fail on Fennel; rely on tags for navigation.
```

**Fennel (FAILED):**
```
- **Fennel (Lisp) Context**:
  - `ctags` is unavailable. Use `grep` to search for `(fn name` or `(macro name` patterns.
```

### Phase 4: Completion

Report:
- Which MCP servers were successfully added (ACTIVE).
- Which MCP servers failed (using fallback mode).
- Confirmation that `CLAUDE.md` has been updated with the appropriate strategies.
