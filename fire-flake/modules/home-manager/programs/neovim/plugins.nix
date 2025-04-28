{ pkgs }:

with pkgs.vimPlugins; [
  plenary-nvim
  nvim-web-devicons
  nvim-lualine-lualine
  toggleterm-nvim
  nvim-treesitter
  nvim-lspconfig
  nvim-cmp
  cmp-nvim-lsp
  cmp-buffer
  cmp-path
  cmp-cmdline
  lspkind-nvim
  mason-nvim
  mason-lspconfig-nvim
  telescope-nvim
  nvim-tree-lua
  nvim-dap
  gitsigns-nvim
  nvim-dap-python
  nvim-dap-go
]
