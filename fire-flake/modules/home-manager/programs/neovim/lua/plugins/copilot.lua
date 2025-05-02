require("copilot").setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = "<C-g>",
      accept_word = "<C-k>",
      accept_line = "<C-l>",
      next = "<C-;>",
      prev = "<C-,>",
      dismiss = "<C-x>",
    },
  },
  panel = {
    enabled = false,
  },
  filetypes = {
    lua = true,
    python = true,
    go = true,
    nix = true,
    sh = true,
    markdown = true,
    terraform = true,
    yaml = true,
    ["*"] = false,
  },
})

-- keybindings
vim.keymap.set("n", "<leader>ae", "<cmd>Copilot enable<CR>", { desc = "Copilot Enable" })
vim.keymap.set("n", "<leader>ad", "<cmd>Copilot disable<CR>", { desc = "Copilot Disable" })
vim.keymap.set("n", "<leader>as", "<cmd>Copilot status<CR>", { desc = "Copilot Status" })
