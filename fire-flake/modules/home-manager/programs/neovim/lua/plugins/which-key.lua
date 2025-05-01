local wk = require("which-key")

wk.setup({
  preset = "helix",
  win = {
    border = "rounded",
  }
})

wk.add({
  { "<leader>h", group = "Git" },
})
