# Neovim Kickstart Configuration - Agent Guide

This is a Neovim configuration based on kickstart-modular.nvim. This is a personal configuration, not a distribution.

## Build/Test/Lint Commands
- **Format Lua code**: `stylua .` (or `stylua <file>`)
- **Check formatting**: `stylua --check .`
- **No traditional tests**: This is a Neovim config, test by running `:checkhealth` in Neovim
- **Reload config**: Restart Neovim or use `:source $MYVIMRC`

## Code Style Guidelines
- **Language**: Lua (Neovim configuration)
- **Indentation**: 2 spaces (NEVER tabs), configured in `.stylua.toml`
- **Line width**: Max 160 characters (stylua), code column guide at 100
- **Quotes**: Auto-prefer single quotes (`'string'` over `"string"`)
- **Function calls**: No parentheses for single string/table arguments (e.g., `require 'module'` not `require('module')`)
- **File endings**: Each file ends with modeline comment: `-- vim: ts=2 sts=2 sw=2 et`
- **Comments**: Use `--` for single line, `--[[  ]]` for multi-line blocks
- **Naming**: snake_case for functions/variables, descriptive names
- **Plugin structure**: Return a table/array from plugin files in `lua/kickstart/plugins/` or `lua/custom/plugins/`
- **Options**: Use `vim.o` for simple options, `vim.opt` for list-based options, `vim.g` for global variables
- **Keymaps**: Always include `desc` parameter for documentation; use `<leader>` (space) prefix for custom mappings
- **Autocommands**: Create named augroups with `clear = true` to prevent duplicates

## Configuration Structure
- `init.lua`: Main entry point, loads all modules
- `lua/options.lua`: Neovim options (`:help option-list`)
- `lua/keymaps.lua`: Keybindings and autocommands
- `lua/kickstart/plugins/`: Core plugin configurations
- `lua/custom/plugins/`: User custom plugins (safe from merge conflicts)
