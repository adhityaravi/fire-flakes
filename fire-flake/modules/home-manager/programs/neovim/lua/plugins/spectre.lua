
require('spectre').setup({
  open_cmd = 'new',  -- open in vertical split (or use 'vsplit', 'tabnew', etc.)
  live_update = true, -- update result as you type
  is_insert_mode = true, -- start in insert mode
  line_sep_start = "┌-----------------------------------------",
  result_padding = "│ ",
  line_sep = "└-----------------------------------------",
})
