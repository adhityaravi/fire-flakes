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
