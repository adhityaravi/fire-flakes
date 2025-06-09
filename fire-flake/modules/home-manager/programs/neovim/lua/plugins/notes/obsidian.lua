local obsidian = require("obsidian")

local workspaces = vim.g.fireflake_obsidian_workspaces or {}

obsidian.setup({
  workspaces = workspaces,
  notes_subdir = "notes",
  daily_notes = {
    folder = "notes/dailies",
    date_format = "%Y-%m-%d",
    alias_format = "%B %-d, %Y",
  },
  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },
  new_notes_location = "notes_subdir",
  preferred_link_style = "wiki",
  sort_by = "modified",
  sort_reversed = true,
  templates = {
    folder = "templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
  },
  picker = {
    name = "telescope.nvim",
  },
  ui = {
    enable = true,
  },
})

pcall(function()
  require("telescope").load_extension("obsidian")
end)
