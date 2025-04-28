-- General settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

-- Load all plugin configs
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.telescope")
require("plugins.nvimtree")
require("plugins.dap")
require("plugins.git")
require("plugins.others")
