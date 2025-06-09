local h = require("keymaps.helpers")

vim.keymap.set("n", "<leader>ld", function() h.telescope("lsp_definitions") end, { desc = "LSP Definitions" })
vim.keymap.set("n", "<leader>lr", function() h.telescope("lsp_references") end, { desc = "LSP References" })
vim.keymap.set("n", "<leader>li", function() h.telescope("lsp_implementations") end, { desc = "LSP Implementations" })
vim.keymap.set("n", "<leader>ls", function() h.telescope("lsp_document_symbols") end, { desc = "Document Symbols" })

local function FormatCode()
  require("conform").format({ lsp_fallback = true })
end
vim.keymap.set({ "n", "v" }, "<leader>lf", FormatCode, { desc = "Format code" })
vim.keymap.set("n", "<leader>lF", "<cmd>ConformInfo<CR>", { desc = "Formatters info" })
