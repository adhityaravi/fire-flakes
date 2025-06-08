require("toggleterm").setup({
  direction = "horizontal",
  size = function()
    return math.floor(vim.o.lines * 0.25)  -- 25% of screen height
  end,
  open_mapping = [[<C-\>]],
  start_in_insert = true,
  shade_terminals = true,
  shading_factor = 1,
  persist_size = false,
})

