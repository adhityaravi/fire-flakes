require("bufferline").setup({
  options = {
    mode = "buffers",
    numbers = "none",
    separator_style = "slant", -- options: "thin", "slant", "padded_slant"
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    color_icons = true,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = (level:match("error") and " ") or (level:match("warning") and " ") or " "
      return " " .. icon .. count
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
        separator = true,
      },
    },
    hover = {
      enabled = true,
      delay = 150,
      reveal = { "close" }
    },
    style_preset = {
      require("bufferline").style_preset.minimal,
    },
    custom_areas = {
      right = function()
        return {
          { text = " " .. vim.fn.FugitiveHead(), fg = "#61afef" },
        }
      end
    },
  },
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
})

-- keybindings
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", { desc = "Pick buffer" })
vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { desc = "Close others" })
vim.keymap.set("n", "<leader>bl", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })
vim.keymap.set("n", "<leader>bh", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })
