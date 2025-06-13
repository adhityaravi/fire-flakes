-- General settings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.fillchars:append({ vert = "│" }) -- or "┃", "▕", etc.
vim.o.shell = "fish" -- Set default shell to fish

-- Theme is configured by NvChad


-- UI plugins that must initialize on startup
require("plugins.explorer.oil")

-- remaining plugin configs
local modules = {
  "plugins.debug.dap",
  "plugins.debug.neotest",
  "plugins.ui.persistence",
  -- removed: lualine, bufferline
  "plugins.completion.copilot",
  "plugins.ui.smartsplits",
  "plugins.search.spectre",
  "plugins.search.grapple",
  "plugins.notes.obsidian",
  "plugins.completion.spider",
  "plugins.search.todocomments",
  "plugins.ui.leap",
  "plugins.git.octo",
  -- removed: noice
  "plugins.ux.autosave",
  "plugins.ux.kulala",
  "plugins.ux.goose",
  "plugins.debug.bqf",
  "plugins.ux.hydra",
  -- require("plugins.ux.miniclue")  -- whichkey alternative
}

for _, mod in ipairs(modules) do
  pcall(require, mod)
end
