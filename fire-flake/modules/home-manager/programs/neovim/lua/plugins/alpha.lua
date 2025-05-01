local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  "███╗   ██╗███████╗ ██████╗  ██╗   ██╗██╗███╗   ███╗",
  "████╗  ██║██╔════╝██╔═══██╗ ██║   ██║██║████╗ ████║",
  "██╔██╗ ██║█████╗  ██║   ██║ ██║   ██║██║██╔████╔██║",
  "██║╚██╗██║██╔══╝  ██║   ██║ ╚██╗ ██╔╝██║██║╚██╔╝██║",
  "██║ ╚████║███████╗╚██████╔╝  ╚████╔╝ ██║██║ ╚═╝ ██║",
  "╚═╝  ╚═══╝╚══════╝ ╚═════╝    ╚═══╝  ╚═╝╚═╝     ╚═╝",
  "",
  "                 fire-flake edition                ",
}

dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
  dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
  dashboard.button("d", "  Browse files", ":Telescope file_browser<CR>"),
  dashboard.button("p", "  Projects", ":Telescope project<CR>"),
  dashboard.button("s", "󰄉  Restore session", ":lua require('persistence').load()<CR>"),
  dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua<CR>"),
  dashboard.button("g", "  Git UI", ":LazyGit<CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

dashboard.section.footer.val = function()
    local v = vim.version()
    return string.format("⚙  Neovim v%d.%d.%d  |  %s", v.major, v.minor, v.patch, os.date("%A, %d %B %Y"))
end

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
