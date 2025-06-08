vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- which-key setup
local wk = require("which-key")
wk.setup({
  preset = "helix",
  win = {
    border = "rounded",
  }
})
-- wk hydra mode wrong usage?
-- wk.show({
--   keys = "<C-w>",
--   loop = true,
-- })
wk.add({
  { "<leader>h", group = "hydras", icon = "󰕚"},
  { "<leader>g", group = "git", icon = "󰊢"},
  { "<leader>gh", group = "github", icon = ""},
  { "<leader>b", group = "buffers", icon = "󰈚"},
  { "<leader>l", group = "lsp", icon = "󰒕"},
  { "<leader>f", group = "fuzzy-find", icon = "󰭎"},
  { "<leader>a", group = "ai-assist", icon = ""},
  { "<leader>t", group = "toggles", icon = ""},
  { "<leader>d", group = "debug", icon = ""},
  { "<leader>r", group = "find-replace", icon = ""},
  { "<leader>p", group = "grapple", icon = "󰄛"},
  { "<leader>q", group = "quick-fix", icon = ""},
})

-- mini-clue setup. personally prefer which-key, but internet says this is better.
-- vim.keymap.set("n", "<leader>h", function() end, { desc = "󰕚 hydras" })
-- vim.keymap.set("n", "<leader>g", function() end, { desc = "󰊢 git" })
-- vim.keymap.set("n", "<leader>gh", function() end, { desc = " github" })
-- vim.keymap.set("n", "<leader>b", function() end, { desc = "󰈚 buffers" })
-- vim.keymap.set("n", "<leader>l", function() end, { desc = "󰒕 lsp" })
-- vim.keymap.set("n", "<leader>f", function() end, { desc = "󰭎 fuzzy-find" })
-- vim.keymap.set("n", "<leader>a", function() end, { desc = " ai-assist" })
-- vim.keymap.set("n", "<leader>t", function() end, { desc = " toggles" })
-- vim.keymap.set("n", "<leader>d", function() end, { desc = " debug" })
-- vim.keymap.set("n", "<leader>r", function() end, { desc = " find-replace" })
-- vim.keymap.set("n", "<leader>p", function() end, { desc = "󰄛 grapple" })
-- vim.keymap.set("n", "<leader>q", function() end, { desc = " quick-fix" })

-- helper wrappers for lazy plugins
local function Telescope(cmd)
  require("plugins.telescope")
  vim.cmd("Telescope " .. cmd)
end

local function ToggleTermCmd()
  require("plugins.toggleterm")
  vim.cmd("ToggleTerm")
end

local function NvimTreeToggle()
  require("plugins.nvimtree")
  vim.cmd("NvimTreeToggle")
end

local function OilToggle()
  require("plugins.oil")
  vim.cmd("Oil")
end

local function ToggleCopilotCmd()
  require("plugins.copilot")
  ToggleCopilot()
end

local function ToggleAutoSaveCmd()
  require("plugins.autosave")
  ToggleAutoSave()
end

local function ensure_dap()
  require("plugins.dap")
end

local function ensure_neotest()
  require("plugins.neotest")
end

-- Bufferline keymaps
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close others" })
vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })

-- Copilot keymaps
vim.keymap.set("n", "<leader>ae", "<cmd>Copilot enable<CR>", { desc = "Copilot Enable" }) -- deprecate over toggle
vim.keymap.set("n", "<leader>ad", "<cmd>Copilot disable<CR>", { desc = "Copilot Disable" }) -- deprecate over toggle
vim.keymap.set("n", "<leader>as", "<cmd>Copilot status<CR>", { desc = "Copilot Status" })

-- Git keymaps
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open Lazygit" })
vim.keymap.set("n", "<leader>gS", function() Telescope("git_status") end, { desc = "Git status" })
vim.keymap.set("n", "<leader>gc", function() Telescope("git_commits") end, { desc = "Git commits" })
-- GitHub
-- List & create issues/PRs
vim.keymap.set("n", "<leader>ghi", "<cmd>Octo issue list<CR>", { desc = "GitHub: List Issues" })
vim.keymap.set("n", "<leader>ghp", "<cmd>Octo pr list<CR>", { desc = "GitHub: List Pull Requests" })
vim.keymap.set("n", "<leader>ghP", "<cmd>Octo pr create<CR>", { desc = "GitHub: Create Pull Request" })
vim.keymap.set("n", "<leader>ghc", "<cmd>Octo pr checkout<CR>", { desc = "GitHub: Checkout PR" })
-- Review actions
vim.keymap.set("n", "<leader>ghs", "<cmd>Octo review start<CR>", { desc = "GitHub: Start Review" })
vim.keymap.set("n", "<leader>gha", "<cmd>Octo review approve<CR>", { desc = "GitHub: Approve PR" })
vim.keymap.set("n", "<leader>ghr", "<cmd>Octo review request_changes<CR>", { desc = "GitHub: Request Changes" })
vim.keymap.set("n", "<leader>ghm", "<cmd>Octo review comment<CR>", { desc = "GitHub: Add Review Comment" })
vim.keymap.set("n", "<leader>ghS", "<cmd>Octo review submit<CR>", { desc = "GitHub:Submit Review" })
-- Metadata management (labels, reviewers, assignees)
vim.keymap.set("n", "<leader>ghl", "<cmd>Octo label add<CR>", { desc = "GitHub: Add Label" })
vim.keymap.set("n", "<leader>ghu", "<cmd>Octo reviewer add<CR>", { desc = "GitHub: Add Reviewer" })
vim.keymap.set("n", "<leader>ghg", "<cmd>Octo assignee add<CR>", { desc = "GitHub: Add Assignee" })
-- Reactions
vim.keymap.set("n", "<leader>ghh", "<cmd>Octo reaction add +1<CR>", { desc = "GitHub: Add 👍 Reaction" })

-- Smartsplit keymaps
local ss = require("smart-splits")
-- Resize splits
vim.keymap.set("n", "<A-h>", ss.resize_left, { desc = "Resize split left" })
vim.keymap.set("n", "<A-l>", ss.resize_right, { desc = "Resize split right" })
vim.keymap.set("n", "<A-k>", ss.resize_up, { desc = "Resize split up" })
vim.keymap.set("n", "<A-j>", ss.resize_down, { desc = "Resize split down" })
-- Move between splits (acts like <C-w> direction)
vim.keymap.set("n", "<C-h>", ss.move_cursor_left, { desc = "Move to left split" })
vim.keymap.set("n", "<C-l>", ss.move_cursor_right, { desc = "Move to right split" })
vim.keymap.set("n", "<C-k>", ss.move_cursor_up, { desc = "Move to upper split" })
vim.keymap.set("n", "<C-j>", ss.move_cursor_down, { desc = "Move to lower split" })
-- Move buffer between splits
vim.keymap.set("n", "<leader>bh", ss.swap_buf_left, { desc = "Move buffer left" })
vim.keymap.set("n", "<leader>bl", ss.swap_buf_right, { desc = "Move buffer right" })
vim.keymap.set("n", "<leader>bk", ss.swap_buf_up, { desc = "Move buffer up" })
vim.keymap.set("n", "<leader>bj", ss.swap_buf_down, { desc = "Move buffer down" })

-- Spider motions
local spider = require("spider")
vim.keymap.set({"n", "o", "x"}, "w", function() spider.motion("w") end, { desc = "Spider-w" })
vim.keymap.set({"n", "o", "x"}, "e", function() spider.motion("e") end, { desc = "Spider-e" })
vim.keymap.set({"n", "o", "x"}, "b", function() spider.motion("b") end, { desc = "Spider-b" })
vim.keymap.set({"n", "o", "x"}, "ge", function() spider.motion("ge") end, { desc = "Spider-ge" })

-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", function() Telescope("find_files") end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fr", function() Telescope("oldfiles") end, { desc = "Recent files" })
vim.keymap.set("n", "<leader>fg", function() Telescope("live_grep") end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", function() Telescope("buffers") end, { desc = "Open buffers" })
vim.keymap.set("n", "<leader>fh", function() Telescope("help_tags") end, { desc = "Help tags" })
vim.keymap.set("n", "<leader>fc", function() Telescope("current_buffer_fuzzy_find") end, { desc = "Find in current buffer" })
vim.keymap.set("n", "<leader>fd", function() Telescope("diagnostics") end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>fm", function() Telescope("marks") end, { desc = "Jump to mark" })
vim.keymap.set("n", "<leader>fp", function() Telescope("project") end, { desc = "Projects" })
vim.keymap.set("n", "<leader>fs", function() Telescope("grapple tags") end, { desc = "Grapple tags" })
vim.keymap.set("n", "<leader>fz", function() require("plugins.colorscheme").pick() end, { desc = "Themes" })
vim.keymap.set("n", "<leader>ft", function() Telescope("treesitter") end, { desc = "Symbols (Treesitter)" })
vim.keymap.set("n", "<leader>fT", "<cmd>TodoTelescope<CR>", { desc = "Search TODOs" })

-- LSP
vim.keymap.set("n", "<leader>ld", function() Telescope("lsp_definitions") end, { desc = "LSP Definitions" })
vim.keymap.set("n", "<leader>lr", function() Telescope("lsp_references") end, { desc = "LSP References" })
vim.keymap.set("n", "<leader>li", function() Telescope("lsp_implementations") end, { desc = "LSP Implementations" })
vim.keymap.set("n", "<leader>ls", function() Telescope("lsp_document_symbols") end, { desc = "Document Symbols" })
vim.keymap.set({"n", "v"}, "<leader>lf", function() require("conform").format({ lsp_fallback = true }) end, { desc = "Format code" })
vim.keymap.set("n", "<leader>lF", "<cmd>ConformInfo<CR>", { desc = "Formatters info" })

-- Toggles
vim.keymap.set("n", "<leader>tt", ToggleTermCmd, { desc = "Toggle Terminal" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Terminal Normal Mode" })
vim.keymap.set("n", "<leader>tp", ToggleCopilotCmd, { desc = "Toggle Copilot" })
vim.keymap.set("n", "<leader>ta", ToggleAutoSaveCmd, { desc = "Toggle Autosave" })
vim.keymap.set("n", "<leader>tn", NvimTreeToggle, { desc = "Toggle FileExplorer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>to", OilToggle, { desc = "Toggle Oil", noremap = true, silent = true })
vim.keymap.set("n", "<leader>ti", "<cmd>IBLToggle<CR>", { desc = "Toggle Indent Guides" })

-- Quickfix
vim.keymap.set("n", "<leader>qo", "<cmd>copen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qn", "<cmd>cnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qp", "<cmd>cprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qq", "<cmd>lua vim.diagnostic.setqflist()<CR><cmd>copen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qt", "<cmd>TodoQuickFix<CR>", { noremap = true, silent = true, desc = "Todo QuickFix" })

-- Debugging
-- DAP
vim.keymap.set("n", "<leader>dd", function() ensure_dap(); require'dap'.continue() end, { silent = true, desc = "Start/Continue Debug" })
vim.keymap.set("n", "<leader>db", function() ensure_dap(); require'dap'.toggle_breakpoint() end, { silent = true, desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>do", function() ensure_dap(); require'dap'.step_over() end, { silent = true, desc = "Step Over" })
vim.keymap.set("n", "<leader>di", function() ensure_dap(); require'dap'.step_into() end, { silent = true, desc = "Step Into" })
vim.keymap.set("n", "<leader>du", function() ensure_dap(); require'dapui'.toggle() end, { silent = true, desc = "Toggle DAP UI" })
-- Neotest
vim.keymap.set("n", "<leader>dt", function() ensure_neotest(); require('neotest').run.run() end, { silent = true, desc = "Run Nearest Test" })
vim.keymap.set("n", "<leader>df", function() ensure_neotest(); require('neotest').run.run(vim.fn.expand('%')) end, { silent = true, desc = "Run Test File" })
vim.keymap.set("n", "<leader>do", function() ensure_neotest(); require('neotest').output.open({ enter = true }) end, { silent = true, desc = "Open Test Output" })
vim.keymap.set("n", "<leader>ds", function() ensure_neotest(); require('neotest').summary.toggle() end, { silent = true, desc = "Toggle Test Summary" })

-- Spectre
vim.keymap.set("n", "<leader>rr", function() require("spectre").open() end, { desc = "Replace in Files (Spectre)" })
vim.keymap.set("n", "<leader>rw", function() require("spectre").open_visual({ select_word = true }) end, { desc = "Replace Word Under Cursor" })
vim.keymap.set("v", "<leader>rw", function() require("spectre").open_visual() end, { desc = "Replace Selection" })
vim.keymap.set("n", "<leader>rf", function() require("spectre").open_file_search() end, { desc = "Replace in Current File" })

-- Grapple
vim.keymap.set("n", "<leader>pa", "<cmd>Grapple tag<CR>", { desc = "Grapple: Add tag" })
vim.keymap.set("n", "<leader>pr", "<cmd>Grapple untag<CR>", { desc = "Grapple: Remove tag" })
vim.keymap.set("n", "<leader>pm", "<cmd>Grapple toggle_tags<CR>", { desc = "Grapple: Toggle tag menu" })
vim.keymap.set("n", "<leader>pn", "<cmd>Grapple cycle_tags next<CR>", { desc = "Grapple: Next tag" })
vim.keymap.set("n", "<leader>pp", "<cmd>Grapple cycle_tags previous<CR>", { desc = "Grapple: Previous tag" })
vim.keymap.set("n", "<leader>ps", "<cmd>Grapple toggle_scopes<CR>", { desc = "Grapple: Toggle scope" })
