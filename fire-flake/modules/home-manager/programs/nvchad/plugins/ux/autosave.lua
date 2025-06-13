require("auto-save").setup({
  enabled = true, -- start auto-save when the plugin is loaded (i.e. after calling setup)
})

vim.g.auto_save_enabled = true -- on by default
function ToggleAutoSave()
  if vim.g.auto_save_enabled == nil then
    vim.g.auto_save_enabled = true
  else
    vim.g.auto_save_enabled = not vim.g.auto_save_enabled
  end

  if vim.g.auto_save_enabled then
    require("auto-save").on()
  else
    require("auto-save").off()
  end
end

-- Keymap
vim.keymap.set("n", "<leader>ta", ToggleAutoSave, { desc = "Toggle Autosave" })

