return {
  -- Core dependencies
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "echasnovski/mini.nvim", lazy = true },

  -- UX
  { "folke/which-key.nvim", event = "VeryLazy" },
  { "folke/noice.nvim", event = "VeryLazy", config = function() require("plugins.noice") end },
  { "anuvyklack/hydra.nvim", event = "VeryLazy", config = function() require("plugins.hydra") end },
  { "okuuva/auto-save.nvim", event = "VeryLazy", config = function() require("plugins.autosave") end },

  -- UI
  { "nvim-lualine/lualine.nvim", event = "VeryLazy", config = function() require("plugins.lualine") end },
  { "akinsho/toggleterm.nvim", cmd = "ToggleTerm", config = function() require("plugins.toggleterm") end },
  { "goolord/alpha-nvim", event = "VimEnter", config = function() require("plugins.alpha") end },
  { "folke/persistence.nvim", event = "BufReadPre", config = function() require("plugins.persistence") end },
  { "akinsho/bufferline.nvim", event = "VeryLazy", config = function() require("plugins.bufferline") end },
  { "mrjones2014/smart-splits.nvim", lazy = true, config = function() require("plugins.smartsplits") end },
  { "ggandor/leap.nvim", event = "BufReadPre", config = function() require("plugins.leap") end },

  -- Themes (loaded immediately so colorscheme works)
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "rose-pine/neovim", name = "rose-pine", priority = 1000 },
  { "folke/tokyonight.nvim", priority = 1000 },
  { "rebelot/kanagawa.nvim", priority = 1000 },
  { "nyoom-engineering/oxocarbon.nvim", priority = 1000 },
  { "sainnhe/everforest", priority = 1000 },
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  { "EdenEast/nightfox.nvim", priority = 1000 },
  { "sainnhe/edge", priority = 1000 },
  { "olimorris/onedarkpro.nvim", priority = 1000 },
  { "Mofiqul/dracula.nvim", priority = 1000 },
  { "loctvl842/monokai-pro.nvim", priority = 1000 },
  { "scottmckendry/cyberdream.nvim", priority = 1000 },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", event = { "BufReadPost", "BufNewFile" }, config = function() require("plugins.treesitter") end },

  -- LSP and completion
  { "neovim/nvim-lspconfig", event = { "BufReadPre", "BufNewFile" }, config = function() require("plugins.lsp") end },
  { "williamboman/mason.nvim", lazy = true },
  { "williamboman/mason-lspconfig.nvim", lazy = true },
  { "onsails/lspkind.nvim", lazy = true },

  { "hrsh7th/nvim-cmp", event = "InsertEnter", config = function() require("plugins.cmp") end },
  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "hrsh7th/cmp-buffer", lazy = true },
  { "hrsh7th/cmp-path", lazy = true },
  { "hrsh7th/cmp-cmdline", lazy = true },
  { "zbirenbaum/copilot.lua", event = "InsertEnter", config = function() require("plugins.copilot") end },

  -- Search and navigation
  { "nvim-telescope/telescope.nvim", cmd = "Telescope", config = function() require("plugins.telescope") end },
  { "nvim-telescope/telescope-project.nvim", lazy = true },
  { "nvim-telescope/telescope-file-browser.nvim", lazy = true },
  { "nvim-pack/nvim-spectre", cmd = "Spectre", config = function() require("plugins.spectre") end },
  { "cbochs/grapple.nvim", event = "VeryLazy", config = function() require("plugins.grapple") end },

  -- File explorer
  { "nvim-tree/nvim-tree.lua", cmd = "NvimTreeToggle", config = function() require("plugins.nvimtree") end },
  { "stevearc/oil.nvim", cmd = "Oil", config = function() require("plugins.oil") end },

  -- Debugging
  { "mfussenegger/nvim-dap", lazy = true, config = function() require("plugins.dap") end },
  { "mfussenegger/nvim-dap-python", lazy = true },
  { "leoluz/nvim-dap-go", lazy = true },
  { "rcarriga/nvim-dap-ui", lazy = true },
  { "nvim-neotest/neotest", lazy = true, config = function() require("plugins.neotest") end },
  { "nvim-neotest/neotest-go", lazy = true },
  { "nvim-neotest/neotest-python", lazy = true },
  { "nvim-neotest/neotest-plenary", lazy = true },
  { "kevinhwang91/nvim-bqf", ft = "qf", config = function() require("plugins.bqf") end },

  -- Git
  { "lewis6991/gitsigns.nvim", event = "BufReadPre", config = function() require("plugins.git") end },
  { "kdheepak/lazygit.nvim", cmd = "LazyGit" },
  { "pwntester/octo.nvim", cmd = "Octo", config = function() require("plugins.octo") end },
}
