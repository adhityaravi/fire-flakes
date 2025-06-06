return {
  -- Core dependencies
  { "nvim-lua/plenary.nvim", name = "plenary-nvim", lazy = true },
  { "nvim-tree/nvim-web-devicons", name = "nvim-web-devicons", lazy = true },
  { "echasnovski/mini.nvim", name = "mini-nvim", lazy = true },

  -- UX
  { "folke/which-key.nvim", name = "which-key-nvim", event = "VeryLazy" },
  { "folke/noice.nvim", name = "noice-nvim", event = "VeryLazy", config = function() require("plugins.noice") end },
  { "anuvyklack/hydra.nvim", name = "hydra-nvim", event = "VeryLazy", config = function() require("plugins.hydra") end },
  { "okuuva/auto-save.nvim", name = "auto-save-nvim", event = "VeryLazy", config = function() require("plugins.autosave") end },

  -- UI
  { "nvim-lualine/lualine.nvim", name = "lualine-nvim", event = "VeryLazy", config = function() require("plugins.lualine") end },
  { "akinsho/toggleterm.nvim", name = "toggleterm-nvim", cmd = "ToggleTerm", config = function() require("plugins.toggleterm") end },
  { "goolord/alpha-nvim", name = "alpha-nvim", event = "VimEnter", config = function() require("plugins.alpha") end },
  { "folke/persistence.nvim", name = "persistence-nvim", event = "BufReadPre", config = function() require("plugins.persistence") end },
  { "akinsho/bufferline.nvim", name = "bufferline-nvim", event = "VeryLazy", config = function() require("plugins.bufferline") end },
  { "mrjones2014/smart-splits.nvim", name = "smart-splits-nvim", lazy = true, config = function() require("plugins.smartsplits") end },
  { "ggandor/leap.nvim", name = "leap-nvim", event = "BufReadPre", config = function() require("plugins.leap") end },

  -- Themes (loaded immediately so colorscheme works)
  { "catppuccin/nvim", name = "catppuccin-nvim", priority = 1000 },
  { "rose-pine/neovim", name = "rose-pine", priority = 1000 },
  { "folke/tokyonight.nvim", name = "tokyonight-nvim", priority = 1000 },
  { "rebelot/kanagawa.nvim", name = "kanagawa-nvim", priority = 1000 },
  { "nyoom-engineering/oxocarbon.nvim", name = "oxocarbon-nvim", priority = 1000 },
  { "sainnhe/everforest", name = "everforest", priority = 1000 },
  { "ellisonleao/gruvbox.nvim", name = "gruvbox-nvim", priority = 1000 },
  { "EdenEast/nightfox.nvim", name = "nightfox-nvim", priority = 1000 },
  { "sainnhe/edge", name = "edge", priority = 1000 },
  { "olimorris/onedarkpro.nvim", name = "onedarkpro-nvim", priority = 1000 },
  { "Mofiqul/dracula.nvim", name = "dracula-nvim", priority = 1000 },
  { "loctvl842/monokai-pro.nvim", name = "monokai-pro-nvim", priority = 1000 },
  { "scottmckendry/cyberdream.nvim", name = "cyberdream-nvim", priority = 1000 },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", name = "treesitter", event = { "BufReadPost", "BufNewFile" }, config = function() require("plugins.treesitter") end },

  -- LSP and completion
  { "neovim/nvim-lspconfig", name = "nvim-lspconfig", event = { "BufReadPre", "BufNewFile" }, config = function() require("plugins.lsp") end },
  { "williamboman/mason.nvim", name = "mason-nvim", lazy = true },
  { "williamboman/mason-lspconfig.nvim", name = "mason-lspconfig-nvim", lazy = true },
  { "onsails/lspkind.nvim", name = "lspkind-nvim", lazy = true },

  { "hrsh7th/nvim-cmp", name = "nvim-cmp", event = "InsertEnter", config = function() require("plugins.cmp") end },
  { "hrsh7th/cmp-nvim-lsp", name = "cmp-nvim-lsp", lazy = true },
  { "hrsh7th/cmp-buffer", name = "cmp-buffer", lazy = true },
  { "hrsh7th/cmp-path", name = "cmp-path", lazy = true },
  { "hrsh7th/cmp-cmdline", name = "cmp-cmdline", lazy = true },
  { "zbirenbaum/copilot.lua", name = "copilot-lua", event = "InsertEnter", config = function() require("plugins.copilot") end },

  -- Search and navigation
  { "nvim-telescope/telescope.nvim", name = "telescope-nvim", cmd = "Telescope", config = function() require("plugins.telescope") end },
  { "nvim-telescope/telescope-project.nvim", name = "telescope-project-nvim", lazy = true },
  { "nvim-telescope/telescope-file-browser.nvim", name = "telescope-file-browser-nvim", lazy = true },
  { "nvim-pack/nvim-spectre", name = "nvim-spectre", cmd = "Spectre", config = function() require("plugins.spectre") end },
  { "cbochs/grapple.nvim", name = "grapple-nvim", event = "VeryLazy", config = function() require("plugins.grapple") end },

  -- File explorer
  { "nvim-tree/nvim-tree.lua", name = "nvim-tree-lua", cmd = "NvimTreeToggle", config = function() require("plugins.nvimtree") end },
  { "stevearc/oil.nvim", name = "oil-nvim", cmd = "Oil", config = function() require("plugins.oil") end },

  -- Debugging
  { "mfussenegger/nvim-dap", name = "nvim-dap", lazy = true, config = function() require("plugins.dap") end },
  { "mfussenegger/nvim-dap-python", name = "nvim-dap-python", lazy = true },
  { "leoluz/nvim-dap-go", name = "nvim-dap-go", lazy = true },
  { "rcarriga/nvim-dap-ui", name = "nvim-dap-ui", lazy = true },
  { "nvim-neotest/neotest", name = "neotest", lazy = true, config = function() require("plugins.neotest") end },
  { "nvim-neotest/neotest-go", name = "neotest-go", lazy = true },
  { "nvim-neotest/neotest-python", name = "neotest-python", lazy = true },
  { "nvim-neotest/neotest-plenary", name = "neotest-plenary", lazy = true },
  { "kevinhwang91/nvim-bqf", name = "nvim-bqf", ft = "qf", config = function() require("plugins.bqf") end },

  -- Git
  { "lewis6991/gitsigns.nvim", name = "gitsigns-nvim", event = "BufReadPre", config = function() require("plugins.git") end },
  { "kdheepak/lazygit.nvim", name = "lazygit-nvim", cmd = "LazyGit" },
  { "pwntester/octo.nvim", name = "octo-nvim", cmd = "Octo", config = function() require("plugins.octo") end },
}
