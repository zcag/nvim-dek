# nvim-dek

Neovim plugin for [dek](https://github.com/zcag/dek) config file support.

Provides syntax highlighting for dek-specific TOML keys:

- `cmd`, `apply`, `check`, `foreach` → bash
- `templates.*`, `expr` → jinja2 (htmldjango)

## Requirements

- Neovim with tree-sitter TOML parser (`TSInstall toml`)

## Installation

**lazy.nvim:**
```lua
{ "zcag/nvim-dek" }
```

## Usage

### File extension

Name your dek config files with the `.dek.toml` extension — filetype is set automatically.

### Modeline

For any `.toml` file, add this to the first few lines:

```toml
# vim: ft=dek
```
