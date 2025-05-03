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

-- Bufferline keymaps 
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", { desc = "Pick buffer" })
vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { desc = "Close others" })
vim.keymap.set("n", "<leader>bl", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })
vim.keymap.set("n", "<leader>bh", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })

-- Copilot keymaps 
vim.keymap.set("n", "<leader>ae", "<cmd>Copilot enable<CR>", { desc = "Copilot Enable" }) -- deprecate over toggle
vim.keymap.set("n", "<leader>ad", "<cmd>Copilot disable<CR>", { desc = "Copilot Disable" }) -- deprecate over toggle
vim.keymap.set("n", "<leader>as", "<cmd>Copilot status<CR>", { desc = "Copilot Status" })

-- Git keymaps
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open Lazygit" })
vim.keymap.set("n", "<leader>gS", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
-- GitHub
-- List & create issues/PRs
vim.keymap.set("n", "<leader>ghi", ":Octo issue list<CR>", { desc = "GitHub: List Issues" })
vim.keymap.set("n", "<leader>ghp", ":Octo pr list<CR>", { desc = "GitHub: List Pull Requests" })
vim.keymap.set("n", "<leader>ghP", ":Octo pr create<CR>", { desc = "GitHub: Create Pull Request" })
vim.keymap.set("n", "<leader>ghc", ":Octo pr checkout<CR>", { desc = "GitHub: Checkout PR" })
-- Review actions
vim.keymap.set("n", "<leader>ghs", ":Octo review start<CR>", { desc = "GitHub: Start Review" })
vim.keymap.set("n", "<leader>gha", ":Octo review approve<CR>", { desc = "GitHub: Approve PR" })
vim.keymap.set("n", "<leader>ghr", ":Octo review request_changes<CR>", { desc = "GitHub: Request Changes" })
vim.keymap.set("n", "<leader>ghm", ":Octo review comment<CR>", { desc = "GitHub: Add Review Comment" })
vim.keymap.set("n", "<leader>ghS", ":Octo review submit<CR>", { desc = "GitHub: Submit Review" })
-- Metadata management (labels, reviewers, assignees)
vim.keymap.set("n", "<leader>ghl", ":Octo label add<CR>", { desc = "GitHub: Add Label" })
vim.keymap.set("n", "<leader>ghu", ":Octo reviewer add<CR>", { desc = "GitHub: Add Reviewer" })
vim.keymap.set("n", "<leader>ghg", ":Octo assignee add<CR>", { desc = "GitHub: Add Assignee" })
-- Reactions
vim.keymap.set("n", "<leader>ghh", ":Octo reaction add +1<CR>", { desc = "GitHub: Add 👍 Reaction" })

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

-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Open buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find in current buffer" })
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "Jump to mark" })
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope project<CR>", { desc = "Projects" })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope grapple tags<CR>", { desc = "Grapple tags" })
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope treesitter<CR>", { desc = "Symbols (Treesitter)" })

-- LSP
vim.keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", { desc = "LSP Definitions" })
vim.keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", { desc = "LSP References" })
vim.keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", { desc = "LSP Implementations" })
vim.keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document Symbols" })

-- Toggles
vim.keymap.set("n", "<leader>tc", ToggleTheme, { desc = "Toggle Color Theme" })
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Terminal Normal Mode" })
vim.keymap.set("n", "<leader>tp", ToggleCopilot, { desc = "Toggle Copilot" })
vim.keymap.set("n", "<leader>ta", ToggleAutoSave, { desc = "Toggle Autosave" })
vim.keymap.set("n", "<leader>tn", ":NvimTreeToggle<CR>", { desc = "Toggle FileExplorer", noremap = true, silent = true })

-- Quickfix
vim.keymap.set("n", "<leader>qo", ":copen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qc", ":cclose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qn", ":cnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qp", ":cprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>qq", ":lua vim.diagnostic.setqflist()<CR>:copen<CR>", { noremap = true, silent = true })

-- Debugging
-- DAP
vim.keymap.set("n", "<leader>dd", ":lua require'dap'.continue()<CR>", { silent = true, desc = "Start/Continue Debug" })
vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true, desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>do", ":lua require'dap'.step_over()<CR>", { silent = true, desc = "Step Over" })
vim.keymap.set("n", "<leader>di", ":lua require'dap'.step_into()<CR>", { silent = true, desc = "Step Into" })
vim.keymap.set("n", "<leader>du", ":lua require'dapui'.toggle()<CR>", { silent = true, desc = "Toggle DAP UI" })
-- Neotest
vim.keymap.set("n", "<leader>dt", ":lua require('neotest').run.run()<CR>", { silent = true, desc = "Run Nearest Test" })
vim.keymap.set("n", "<leader>df", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { silent = true, desc = "Run Test File" })
vim.keymap.set("n", "<leader>do", ":lua require('neotest').output.open({ enter = true })<CR>", { silent = true, desc = "Open Test Output" })
vim.keymap.set("n", "<leader>ds", ":lua require('neotest').summary.toggle()<CR>", { silent = true, desc = "Toggle Test Summary" })

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

