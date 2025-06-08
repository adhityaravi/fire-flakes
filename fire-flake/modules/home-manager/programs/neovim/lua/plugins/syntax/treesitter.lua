require('nvim-treesitter.configs').setup {
    -- treesitter dependencies are installed through nix. refer modules/home-manager/programs/neovim/treesitter.nix for actual treesitter dependencies.
    auto_install = false,  -- 👈 prevents runtime install attempts

    highlight = { enable = true },
    indent = { enable = true },
  }
