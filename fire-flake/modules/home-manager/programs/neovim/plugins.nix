{ pkgs }:

let
  treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: with plugins; [
    bash
    go
    python
    terraform
    nix
    lua
    json
    yaml
    markdown
  ]);
in

with pkgs.vimPlugins; [
  # Core dependencies
  plenary-nvim
  nvim-web-devicons
  mini-nvim
  which-key-nvim

  # UI
  lualine-nvim
  toggleterm-nvim
  alpha-nvim
  persistence-nvim
  bufferline-nvim
  smart-splits-nvim
  leap-nvim
  # theme
  catppuccin-nvim
  rose-pine
  tokyonight-nvim
  kanagawa-nvim
  oxocarbon-nvim
  everforest

  # Syntax highlighting
  treesitter

  # LSP support
  nvim-lspconfig
  mason-nvim
  mason-lspconfig-nvim
  lspkind-nvim

  # Autocompletion
  nvim-cmp
  cmp-nvim-lsp
  cmp-buffer
  cmp-path
  cmp-cmdline
  copilot-lua

  # Fuzzy finder
  telescope-nvim
  telescope-project-nvim
  telescope-file-browser-nvim
  nvim-spectre

  # File explorer
  nvim-tree-lua

  # Debugging
  nvim-dap
  nvim-dap-python
  nvim-dap-go
  nvim-dap-ui
  neotest
  neotest-go
  neotest-python
  neotest-plenary
  nvim-bqf

  # Git integration
  gitsigns-nvim
  lazygit-nvim
  octo-nvim
]
