{ config, pkgs, lib, inputs, ... }:
let
  cfg = config.custom.nvchad;
  workspacesLua = builtins.concatStringsSep "\n" (
    map (path: "  { name = \"" + (builtins.baseNameOf path) + "\", path = \"~/" + path + "\" },")
      cfg.obsidianVaultPaths
  );
  extraConfig = ''
    vim.g.fireflake_obsidian_workspaces = {
${workspacesLua}
    }

    require("plugins")
    ${cfg.extraLuaConfig}
  '';
  extraPkgs = with pkgs; [
    pyright
    gopls
    terraform-ls
    nixd
    nodePackages.bash-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.yaml-language-server
    lua-language-server
  ];
  extraPlugins = ''
    return {
      "Pocco81/auto-save.nvim",
      "azorng/goose.nvim",
      "cbochs/grapple.nvim",
      "anuvyklack/hydra.nvim",
      "mistweaverco/kulala.nvim",
      "kdheepak/lazygit.nvim",
      "ggandor/leap.nvim",
      "onsails/lspkind.nvim",
      "echasnovski/mini.nvim",
      "kevinhwang91/nvim-bqf",
      "mfussenegger/nvim-dap",
      "leoluz/nvim-dap-go",
      "mfussenegger/nvim-dap-python",
      "rcarriga/nvim-dap-ui",
      "nvim-pack/nvim-spectre",
      "chrisgrieser/nvim-spider",
      "epwalsh/obsidian.nvim",
      "pwntester/octo.nvim",
      "stevearc/oil.nvim",
      "folke/persistence.nvim",
      "MeanderingProgrammer/render-markdown.nvim",
      "mrjones2014/smart-splits.nvim",
      "folke/todo-comments.nvim",
      "zbirenbaum/copilot.lua",
      "zbirenbaum/copilot-cmp",
    }
  '';
in {
  imports = [ inputs.nix4nvchad.homeManagerModule ];

  options.custom.nvchad = {
    enable = lib.mkEnableOption "Enable NvChad";
    extraLuaConfig = lib.mkOption {
      type = lib.types.lines;
      default = "";
      description = "Extra Lua config injected after core setup.";
    };
    obsidianVaultPaths = lib.mkOption {
      type = with lib.types; listOf str;
      default = [];
      description = "Paths to Obsidian vaults used by obsidian.nvim.";
    };
  };

  config = lib.mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    xdg.configFile."nvim/lua/plugins".source = ./nvchad/plugins;

    programs.nvchad = {
      enable = true;
      neovim = pkgs.neovim;
      extraPackages = extraPkgs;
      extraConfig = extraConfig;
      extraPlugins = extraPlugins;
    };
  };
}
