-- General settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.fillchars:append { vert = "│" } -- or "┃", "▕", etc.

-- Always load theme
require("plugins.colorscheme").load()

-- Load all plugin configs - order matters
-- #todo: lazyload

-- UI plugins that must initialize on startup
require("plugins.oil")
require("plugins.alpha")

-- helper for lazy loading modules on events
local function lazy_require(event, module, opts)
  vim.api.nvim_create_autocmd(event, vim.tbl_extend("force", opts or {}, {
    once = true,
    callback = function() require(module) end,
  }))
end

-- core plugins
lazy_require("BufReadPost", "plugins.treesitter")
lazy_require("BufReadPost", "plugins.lsp")
lazy_require("InsertEnter", "plugins.cmp")

-- fire VeryLazy event shortly after UI loads
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.defer_fn(function()
      vim.api.nvim_exec_autocmds("User", { pattern = "VeryLazy" })
    end, 100)
  end,
})

-- plugins that can wait
local lazy_plugins = {
  "plugins.telescope",
  "plugins.nvimtree",
  "plugins.dap",
  "plugins.neotest",
  "plugins.git",
  "plugins.persistence",
  "plugins.lualine",
  "plugins.bufferline",
  "plugins.copilot",
  "plugins.toggleterm",
  "plugins.smartsplits",
  "plugins.spectre",
  "plugins.grapple",
  "plugins.leap",
  "plugins.octo",
  "plugins.noice",
  "plugins.autosave",
  "plugins.bqf",
  "plugins.hydra",
  -- require("plugins.miniclue")  -- whichkey alternative
}

for _, mod in ipairs(lazy_plugins) do
  lazy_require("User", mod, { pattern = "VeryLazy" })
end

-- keymaps
require("keymap")

