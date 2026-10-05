# neonforge.nvim

Dark neon colorscheme for **C / C++ / Rust**: 66 syntax roles, every one a different hex colour,
optimised for perceptual separation (closest pair ΔE76 ≈ 15, contrast ≥ 5:1 on the background).

## Install (pick one)

**Native packages (no plugin manager)**
```
# Linux / macOS
mkdir -p ~/.local/share/nvim/site/pack/themes/start
unzip neonforge.nvim.zip -d ~/.local/share/nvim/site/pack/themes/start/

# Windows (PowerShell)
Expand-Archive neonforge.nvim.zip "$env:LOCALAPPDATA\nvim-data\site\pack\themes\start\"
```
Then in `init.lua`:
```lua
vim.cmd.colorscheme("neonforge")
```

**lazy.nvim (local dir)**
```lua
{ dir = "~/.config/nvim-plugins/neonforge.nvim", name = "neonforge", lazy = false, priority = 1000,
  config = function()
    require("neonforge").setup({ transparent = false, italic_comments = true })
    vim.cmd.colorscheme("neonforge")
  end }
```

## For maximum diversity
- Neovim >= 0.10, `:TSInstall c cpp rust`
- LSP: `clangd` and `rust-analyzer` (semantic tokens split struct/class/enum/trait/lifetime/params/etc.)
- `HiPhish/rainbow-delimiters.nvim` (7 more unique colours for nested brackets)
- Open `examples/sample.cpp` / `examples/sample.rs` to preview.

## Customise
`require("neonforge").setup({ overrides = { ["@function"] = { fg = "#ffffff" } } })`
All colours live in `lua/neonforge/palette.lua`.
