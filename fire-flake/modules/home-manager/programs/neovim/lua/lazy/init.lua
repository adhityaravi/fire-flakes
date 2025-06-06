local lazy = require("lazy")

-- don't attempt to install plugins; they are provided by Nix
lazy.setup(require("lazy.plugins"), {
  install = { missing = false },
})

-- Load saved colorscheme after plugins are ready
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("plugins.colorscheme").load()
  end,
})
