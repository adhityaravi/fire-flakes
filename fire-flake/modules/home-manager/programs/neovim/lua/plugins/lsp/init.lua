require('mason').setup()
require('mason-lspconfig').setup()

local lspconfig = require('lspconfig')

local servers = {
  "pyright",
  "gopls",
  "terraformls",
  "nixd",
  "bashls",
  "html",
  "jsonls",
  "yamlls",
  "lua_ls",
}

for _, lsp in ipairs(servers) do
  local opts = {}

  if lsp == "lua_ls" then
    opts = {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        }
      }
    }
  end

  lspconfig[lsp].setup(opts)
end

-- Keymaps
local function telescope(cmd)
  vim.cmd("Telescope " .. cmd)
end

vim.keymap.set("n", "<leader>ld", function() telescope("lsp_definitions") end, { desc = "LSP Definitions" })
vim.keymap.set("n", "<leader>lr", function() telescope("lsp_references") end, { desc = "LSP References" })
vim.keymap.set("n", "<leader>li", function() telescope("lsp_implementations") end, { desc = "LSP Implementations" })
vim.keymap.set("n", "<leader>ls", function() telescope("lsp_document_symbols") end, { desc = "Document Symbols" })

local function FormatCode()
  require("conform").format({ lsp_fallback = true })
end

vim.keymap.set({ "n", "v" }, "<leader>lf", FormatCode, { desc = "Format code" })
vim.keymap.set("n", "<leader>lF", "<cmd>ConformInfo<CR>", { desc = "Formatters info" })
