local lazy = require("lazy")

lazy.setup(require("lazy.plugins"))

-- Load saved colorscheme after plugins are ready
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("plugins.colorscheme").load()
  end,
})
