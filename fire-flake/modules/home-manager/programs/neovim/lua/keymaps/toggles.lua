local h = require("keymaps.helpers")

vim.keymap.set("n", "<leader>tt", h.toggle_term, { desc = "Toggle Terminal" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Terminal Normal Mode" })
vim.keymap.set("n", "<leader>tp", h.toggle_copilot, { desc = "Toggle Copilot" })
vim.keymap.set("n", "<leader>ta", h.toggle_autosave, { desc = "Toggle Autosave" })
vim.keymap.set("n", "<leader>tn", h.nvimtree_toggle, { desc = "Toggle FileExplorer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>to", h.oil_toggle, { desc = "Toggle Oil", noremap = true, silent = true })
vim.keymap.set("n", "<leader>ti", "<cmd>IBLToggle<CR>", { desc = "Toggle IndentGuides" })
