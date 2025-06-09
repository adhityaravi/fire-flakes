require("octo").setup({
  enable_builtin = true,
})

-- Keymaps
vim.keymap.set("n", "<leader>ghi", "<cmd>Octo issue list<CR>", { desc = "GitHub: List Issues" })
vim.keymap.set("n", "<leader>ghp", "<cmd>Octo pr list<CR>", { desc = "GitHub: List Pull Requests" })
vim.keymap.set("n", "<leader>ghP", "<cmd>Octo pr create<CR>", { desc = "GitHub:Create Pull Request" })
vim.keymap.set("n", "<leader>ghc", "<cmd>Octo pr checkout<CR>", { desc = "GitHub: Checkout PR" })
vim.keymap.set("n", "<leader>ghs", "<cmd>Octo review start<CR>", { desc = "GitHub: Start Review" })
vim.keymap.set("n", "<leader>gha", "<cmd>Octo review approve<CR>", { desc = "GitHub: Approve PR" })
vim.keymap.set("n", "<leader>ghr", "<cmd>Octo review request_changes<CR>", { desc = "GitHub: Request Changes" })
vim.keymap.set("n", "<leader>ghm", "<cmd>Octo review comment<CR>", { desc = "GitHub: Add Review Comment" })
vim.keymap.set("n", "<leader>ghS", "<cmd>Octo review submit<CR>", { desc = "GitHub:Submit Review" })
vim.keymap.set("n", "<leader>ghl", "<cmd>Octo label add<CR>", { desc = "GitHub:Add Label" })
vim.keymap.set("n", "<leader>ghu", "<cmd>Octo reviewer add<CR>", { desc = "GitHub: Add Reviewer" })
vim.keymap.set("n", "<leader>ghg", "<cmd>Octo assignee add<CR>", { desc = "GitHub: Add Assignee" })
vim.keymap.set("n", "<leader>ghh", "<cmd>Octo reaction add +1<CR>", { desc = "GitHub: Add 👍 Reaction" })

