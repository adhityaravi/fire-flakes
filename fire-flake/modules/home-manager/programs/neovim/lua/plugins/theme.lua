local themes = {
  "catppuccin",
  "rose-pine",
  "tokyonight-moon",
  "kanagawa-wave",
  "oxocarbon",
  "everforest",
}

local theme_file = vim.fn.stdpath("config") .. "/theme.txt"

-- Load saved theme index or default to 1
local function load_theme_index()
  local f = io.open(theme_file, "r")
  if f then
    local index = tonumber(f:read("*a"))
    f:close()
    if index and index >= 1 and index <= #themes then
      return index
    end
  end
  return 1
end

-- Save the current theme index
local function save_theme_index(index)
  local f = io.open(theme_file, "w")
  if f then
    f:write(tostring(index))
    f:close()
  end
end

-- Global toggle function
local current = load_theme_index()
function ToggleTheme()
  current = current % #themes + 1
  local theme = themes[current]
  vim.cmd.colorscheme(theme)
  print("Theme: " .. theme)
  save_theme_index(current)
end

-- Load the theme on startup
vim.cmd.colorscheme(themes[current])

