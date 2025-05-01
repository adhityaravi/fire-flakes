require("telescope").setup {}
require("telescope").load_extension("file_browser")
require("telescope").load_extension("project")

-- keybindings
local map = vim.keymap.set

-- File + Project related
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Grep in project" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Open buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Find in current buffer" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "Jump to mark" })
map("n", "<leader>fp", "<cmd>Telescope project<CR>", { desc = "Projects" }) -- if using telescope-project
map("n", "<leader>ft", "<cmd>Telescope treesitter<CR>", { desc = "Symbols (Treesitter)" })

-- Git
map("n", "<leader>hS", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
map("n", "<leader>hc", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })

-- LSP
map("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", { desc = "LSP Definitions" })
map("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", { desc = "LSP References" })
map("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", { desc = "LSP Implementations" })
map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document Symbols" })

