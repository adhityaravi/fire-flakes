require('ibl').setup()

-- Keymap
vim.keymap.set("n", "<leader>ti", "<cmd>IBLToggle<CR>", { desc = "Toggle IndentGuides" })
