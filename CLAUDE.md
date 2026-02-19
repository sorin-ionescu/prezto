# zprezto - Personal Dotfiles

This is a personal fork of [sorin-ionescu/prezto](https://github.com/sorin-ionescu/prezto). It is NOT an active upstream contributor.

## Critical Rules

- NEVER create pull requests against `sorin-ionescu/prezto`. All PRs go to `cmaher/prezto` only.
- NEVER push to or target any sorin-ionescu remote.

## Architecture

- `runcoms/` - Shared shell config (portable, no machine-specific paths or secrets)
- `conf/` - Shared tool config (e.g. gitconfig), symlinked as dotfiles by `link.sh`
- Machine-specific settings (PATH, signing keys, secrets, tool-specific paths) go in local files:
  - `~/.zshenv.local` - machine-specific env vars and PATH
  - `~/.zshrc.local` - machine-specific shell functions and aliases
  - `~/.gitconfig-local` - machine-specific git settings (signing key, gpg, lfs, url rewrites)

## Tools

- **`multi-ls`**: Use `multi-ls dir1 dir2 ...` (via Bash) instead of chaining `ls && echo --- && ls` when listing the contents of multiple directories.
- **`multi-find`**: Use `multi-find <head_count> [find_opts...] path1 [path2 ...]` (via Bash) instead of chaining `find ... | head && echo --- && find ... | head` when finding files across multiple directories.
