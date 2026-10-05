local M = {}

M.config = {
  transparent = false,     -- no background (use your terminal's)
  italic_comments = true,
  overrides = {},          -- { ["@function"] = { fg = "#ffffff" }, ... }
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load()
  if vim.g.colors_name then vim.cmd("hi clear") end
  if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "neonforge"

  local groups = require("neonforge.groups").get(M.config)
  for name, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, name, spec)
  end
  for name, spec in pairs(M.config.overrides) do
    vim.api.nvim_set_hl(0, name, spec)
  end

  local c, u = require("neonforge.palette").syntax, require("neonforge.palette").ui
  local term = {
    u.bg_hl, c.kw_exception, c.string, c.number, c.type_builtin, c.keyword, c.type, u.fg,
    u.line_nr, c.bool, c.string_path, c.function_call, c.class, c.kw_conditional, c.struct, "#ffffff",
  }
  for i, col in ipairs(term) do vim.g["terminal_color_" .. (i - 1)] = col end
end

return M
