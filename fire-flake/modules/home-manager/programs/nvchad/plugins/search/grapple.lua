require("grapple").setup({
  scope = "git_branch",
})

-- Keymaps
vim.keymap.set("n", "<leader>pa", "<cmd>Grapple tag<CR>", { desc = "Grapple: Add tag" })
vim.keymap.set("n", "<leader>pr", "<cmd>Grapple untag<CR>", { desc = "Grapple: Remove tag" })
vim.keymap.set("n", "<leader>pm", "<cmd>Grapple toggle_tags<CR>", { desc = "Grapple: Toggle tag menu" })
vim.keymap.set("n", "<leader>pn", "<cmd>Grapple cycle_tags next<CR>", { desc = "Grapple: Next tag" })
vim.keymap.set("n", "<leader>pp", "<cmd>Grapple cycle_tags previous<CR>", { desc = "Grapple: Previous tag" })
vim.keymap.set("n", "<leader>ps", "<cmd>Grapple toggle_scopes<CR>", { desc = "Grapple: Toggle scope" })
