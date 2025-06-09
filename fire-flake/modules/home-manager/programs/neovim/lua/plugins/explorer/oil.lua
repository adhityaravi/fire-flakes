require("oil").setup({
  default_file_explorer = true,
  view_options = {
    show_hidden = true,
  },
  skip_confirm_for_simple_edits = true,
  delete_to_trash = true,
})

-- Keymap
vim.keymap.set("n", "<leader>to", "<cmd>Oil<CR>", { desc = "Toggle Oil", noremap = true, silent = true })

