local Hydra = require("hydra")

-- Windows resizing hydra (ex.)
Hydra({
  name = 'resize-[w]indows',
  mode = 'n',
  body = '<leader>hw',
  config = {
    color = 'teal',
    invoke_on_body = true,
    hint = {
      position = 'top-right',
      border = 'rounded',
      type = 'window',
    },
  },
  hint = [[
_h_: ←  _j_: ↓  _k_: ↑  _l_: →

        _q_: quit]],
  heads = {
    { 'h', '<cmd>vertical resize -2<CR>', { exit = false, desc = 'Shrink Width' } },
    { 'l', '<cmd>vertical resize +2<CR>', { exit = false, desc = 'Expand Width' } },
    { 'j', '<cmd>resize +2<CR>',         { exit = false, desc = 'Increase Height' } },
    { 'k', '<cmd>resize -2<CR>',         { exit = false, desc = 'Decrease Height' } },
    { 'q', nil, { exit = true, nowait = true, desc = 'Quit Hydra' } },
  }
})

