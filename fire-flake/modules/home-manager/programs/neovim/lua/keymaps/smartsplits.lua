local ss = require("smart-splits")

-- Resize splits
vim.keymap.set("n", "<A-h>", ss.resize_left, { desc = "Resize split left" })
vim.keymap.set("n", "<A-l>", ss.resize_right, { desc = "Resize split right" })
vim.keymap.set("n", "<A-k>", ss.resize_up, { desc = "Resize split up" })
vim.keymap.set("n", "<A-j>", ss.resize_down, { desc = "Resize split down" })
-- Move between splits
vim.keymap.set("n", "<C-h>", ss.move_cursor_left, { desc = "Move to left split" })
vim.keymap.set("n", "<C-l>", ss.move_cursor_right, { desc = "Move to right split" })
vim.keymap.set("n", "<C-k>", ss.move_cursor_up, { desc = "Move to upper split" })
vim.keymap.set("n", "<C-j>", ss.move_cursor_down, { desc = "Move to lower split" })
-- Move buffer between splits
vim.keymap.set("n", "<leader>bh", ss.swap_buf_left, { desc = "Move buffer left" })
vim.keymap.set("n", "<leader>bl", ss.swap_buf_right, { desc = "Move buffer right" })
vim.keymap.set("n", "<leader>bk", ss.swap_buf_up, { desc = "Move buffer up" })
vim.keymap.set("n", "<leader>bj", ss.swap_buf_down, { desc = "Move buffer down" })
