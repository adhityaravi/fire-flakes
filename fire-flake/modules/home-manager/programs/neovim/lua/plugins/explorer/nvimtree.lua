require('nvim-tree').setup{}

-- Keymap
vim.keymap.set("n", "<leader>tn", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle FileExplorer", noremap = true, silent = true })

