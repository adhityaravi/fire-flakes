-- Telescope colorscheme picker with persistence
local M = {}

local config_path = vim.fn.stdpath("config") .. "/colorscheme.txt"

function M.save(theme)
  local f = io.open(config_path, "w")
  if f then
    f:write(theme)
    f:close()
  end
end

function M.load()
  local f = io.open(config_path, "r")
  if f then
    local theme = f:read("*l")
    f:close()
    if theme then
      local ok, _ = pcall(vim.cmd.colorscheme, theme)
      if not ok then
        vim.notify("Failed to load colorscheme: " .. theme, vim.log.levels.ERROR)
      end
    end
  end
end

function M.pick()
  local actions = require("telescope.actions")
  local state = require("telescope.actions.state")
  local theme = state.get_selected_entry().value
  require("telescope.builtin").colorscheme {
    enable_preview = true,
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        vim.cmd.colorscheme(theme)
        M.save(theme)
        actions.close(prompt_bufnr)
      end)
      return true
    end
  }
  vim.notify("Colorscheme: " .. theme, vim.log.levels.INFO)
end

return M

