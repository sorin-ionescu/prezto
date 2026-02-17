# Deep Tree Exploration — Design

## Problem

When you need to systematically explore a deep hierarchy (taxonomy, directory tree, multi-level data structure), existing tools fall short:
- `dispatching-parallel-agents` handles flat, independent problems
- `beads:agents` handles sequential/parallel dispatch of existing issues
- Neither supports recursive, level-by-level expansion of a tree

Subagents can't spawn subagents, so true recursion is impossible. The solution is **wave-based BFS**: the orchestrator expands one level at a time, dispatching agents at each wave.

## Core Concepts

**Hierarchy prompt:** User describes their tree naturally — "for each X, explore each Y, then each Z." The skill parses this into levels.

**Wave-based BFS:** Orchestrator creates root items, dispatches agents for level 0. Agents explore their node and create child items for level 1. Orchestrator discovers children, dispatches next wave. Repeat until leaves.

**Context discipline:** Agents return 1-2 sentences. Each agent gets only its node's context + the hierarchy spec. Parent never explores inline.

**Sequential by default.** User can mark specific levels as parallel. Parallel levels need claim semantics.

**Tracking-agnostic.** Works with beads, markdown files, or plain summaries.

## Orchestration Loop

```
Parse hierarchy from prompt
  → Create root-level items
  → For each level:
      → Dispatch agents (sequential or parallel per user spec)
      → Each agent: explore node, create children, return 1-2 sentence summary
      → Discover child items
  → Until leaf level reached
  → Final summary
```

## Agent Prompt Template

Each agent gets:
- Its node name and level
- The full hierarchy spec
- What this level represents and what children to create
- Node-specific context (full text, directory contents, etc.)
- Instructions to return only 1-2 sentences

## Tracking Options

| Method | When | Child creation |
|--------|------|---------------|
| Beads | Multi-session, dependencies | `bd create --parent` |
| Markdown files | One-shot, human-readable | Directory tree mirroring hierarchy |
| Summaries only | Quick survey | Structured return, orchestrator aggregates |

## Decisions

- Standalone skill at `claude/skills/deep-tree-exploration/`
- Not in superpowers — project-local skill
- Rigid skill type — the BFS loop is the discipline
- Sequential default, parallel opt-in
- Tracking-agnostic
