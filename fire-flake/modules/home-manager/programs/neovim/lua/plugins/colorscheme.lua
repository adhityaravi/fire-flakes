-- Colorscheme utilities with Telescope picker and persistence
local M = {}

-- location to persist the chosen theme
local config_path = vim.fn.stdpath("state") .. "/colorscheme"

local function write_theme(theme)
  if theme and #theme > 0 then
    vim.fn.mkdir(vim.fn.fnamemodify(config_path, ":h"), "p")
    vim.fn.writefile({ theme }, config_path)
  end
end

local function read_theme()
  if vim.fn.filereadable(config_path) == 1 then
    local t = vim.fn.readfile(config_path)[1]
    if t and #t > 0 then
      return t
    end
  end
end

function M.save(theme)
  write_theme(theme or vim.g.colors_name)
end

function M.load()
  local theme = read_theme()
  if theme then
    local ok, err = pcall(vim.cmd.colorscheme, theme)
    if not ok then
      vim.notify("Failed to load colorscheme: " .. theme .. " (" .. err .. ")", vim.log.levels.ERROR)
    end
  end
end

-- automatically persist on colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    M.save(vim.g.colors_name)
  end,
})

-- simple floating palette showing some highlight groups
function M.palette(timeout)
  local groups = {
    "Normal",
    "Comment",
    "Constant",
    "String",
    "Identifier",
    "Statement",
    "PreProc",
    "Type",
    "Special",
  }

  local lines = groups

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  for i, grp in ipairs(groups) do
    vim.api.nvim_buf_add_highlight(buf, -1, grp, i - 1, 0, -1)
  end

  local width = 0
  for _, grp in ipairs(groups) do
    width = math.max(width, #grp)
  end
  width = math.max(20, width + 2)
  local height = #groups
  local win = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    width = width,
    height = height,
    row = 1,
    col = vim.o.columns - width - 2,
    style = "minimal",
    border = "rounded",
  })

  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, { buffer = buf, silent = true })

  vim.defer_fn(function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, timeout or 3000)
end

function M.pick()
  local actions = require("telescope.actions")
  local state = require("telescope.actions.state")

  require("telescope.builtin").colorscheme {
    enable_preview = true,
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local entry = state.get_selected_entry()
        if entry then
          local theme = entry.value
          actions.close(prompt_bufnr)
          pcall(vim.cmd.colorscheme, theme)
          M.palette()
        else
          vim.notify("No colorscheme selected", vim.log.levels.WARN)
        end
      end)
      return true
    end,
  }
end

return M

