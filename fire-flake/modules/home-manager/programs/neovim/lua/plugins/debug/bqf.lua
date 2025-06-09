require('bqf').setup({
  auto_enable = true,
  preview = {
    win_height = 15,
    win_vheight = 15,
    delay_syntax = 80,
    border_chars = { '│', '│', '─', '─', '┐', '┘', '└', '┌' },
  },
  func_map = {
    open = '<CR>',
    drop = 'o',
    split = 's',
    vsplit = 'v',
    tab = 't',
    toggle_mode = 'm',
    toggle_preview = 'P',
    preview_scroll_up = '<C-b>',
    preview_scroll_down = '<C-f>',
  },
})

-- Keymaps
vim.keymap.set("n", "<leader>qo", "<cmd>copen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qn", "<cmd>cnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qp", "<cmd>cprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qq", "<cmd>lua vim.diagnostic.setqflist()<CR><cmd>copen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qt", "<cmd>TodoQuickFix<CR>", { noremap = true, silent = true, desc = "Todo QuickFix" })

