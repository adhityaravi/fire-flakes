
local autosave = require("auto-save")

autosave.setup({
  enabled = true, -- start auto-save when the plugin is loaded
})

local M = {}

vim.g.auto_save_enabled = true -- on by default

function M.toggle()
  if vim.g.auto_save_enabled == nil then
    vim.g.auto_save_enabled = true
  else
    vim.g.auto_save_enabled = not vim.g.auto_save_enabled
  end

  if vim.g.auto_save_enabled then
    autosave.on()
  else
    autosave.off()
  end
end

return M

