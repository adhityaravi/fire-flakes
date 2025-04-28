require('mason').setup()
require('mason-lspconfig').setup()

local lspconfig = require('lspconfig')

local servers = { "pyright", "gopls", "terraformls", "nixd", "bashls", "html", "jsonls", "yamlls" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {}
end
