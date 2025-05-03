
local Hydra = require("hydra")

Hydra({
  name = "Window Resize",
  mode = "n",
  body = "<leader>w", -- entry point to this hydra
  heads = {
    { "h", "<cmd>resize -2<CR>", { desc = "Shrink Horizontal" } },
    { "l", "<cmd>resize +2<CR>", { desc = "Expand Horizontal" } },
    { "k", "<cmd>vertical resize -2<CR>", { desc = "Shrink Vertical" } },
    { "j", "<cmd>vertical resize +2<CR>", { desc = "Expand Vertical" } },
    { "q", nil, { exit = true, desc = "Exit" } },
  }
})

