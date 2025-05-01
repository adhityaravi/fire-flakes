require("bufferline").setup({
  options = {
    mode = "buffers",
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    modified_icon = "●",
    close_icon = "",
    separator_style = "slant", -- or "padded_slant", "thick"
    always_show_bufferline = true,
    sort_by = 'insert_after_current', -- New buffers appear next to current
    enforce_regular_tabs = true,      -- Makes tabs more uniform width
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
    },
    hover = {
      enabled = true,
      delay = 200,
      reveal = { "close" }
    },
    diagnostics_indicator = function(count, level, diagnostics_dict)
      local s = ""
      for e, n in pairs(diagnostics_dict) do
        local sym = (e == "error" and " ") or (e == "warning" and " ") or " "
        s = s .. n .. sym
      end
      return s
    end,
  },
})

-- keybindings
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", { desc = "Pick buffer" })
vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { desc = "Close others" })
vim.keymap.set("n", "<leader>bl", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })
vim.keymap.set("n", "<leader>bh", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })
