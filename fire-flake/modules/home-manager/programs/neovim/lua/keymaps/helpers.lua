local M = {}

function M.telescope(cmd)
  require("plugins.search.telescope")
  vim.cmd("Telescope " .. cmd)
end

function M.toggle_term()
  require("plugins.ui.toggleterm")
  vim.cmd("ToggleTerm")
end

function M.nvimtree_toggle()
  require("plugins.explorer.nvimtree")
  vim.cmd("NvimTreeToggle")
end

function M.oil_toggle()
  require("plugins.explorer.oil")
  vim.cmd("Oil")
end

function M.toggle_copilot()
  require("plugins.completion.copilot")
  ToggleCopilot()
end

function M.toggle_autosave()
  require("plugins.ux.autosave")
  ToggleAutoSave()
end

function M.ensure_dap()
  require("plugins.debug.dap")
end

function M.ensure_neotest()
  require("plugins.debug.neotest")
end

return M
