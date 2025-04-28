require('nvim-treesitter.configs').setup {
    ensure_installed = { "python", "go", "terraform", "nix", "lua", "bash", "json", "yaml", "markdown" },
    highlight = { enable = true },
  }
  