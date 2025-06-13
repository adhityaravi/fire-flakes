{
  config,
  lib,
  pkgs,
  userVars,
  inputs,
  ...
}: {
  imports = [
    ../../../modules/home-manager/programs/git.nix
    ../../../modules/home-manager/programs/kitty.nix
    ../../../modules/home-manager/programs/nvchad.nix
    ../../../modules/home-manager/programs/obsidian.nix
    ../../../modules/home-manager/programs/goose.nix
    ../../../modules/home-manager/programs/fish.nix
    ../../../modules/home-manager/programs/starship/starship.nix
    ../../../modules/home-manager/common.nix
  ];

  home = {
    username = userVars.username;
    homeDirectory = userVars.homeDirectory;
    stateVersion = userVars.stateVersion;
  };

  # Add your own tool selections if needed
  # Its also possible to override the default common tools. Not recommended.
  custom.common = {
    enable = true;
    # Example: add extra tools
    #userTools = with pkgs; [
    #  git
    #  jq
    #  curl
    #  wget
    #  direnv
    #  nixpkgs-fmt
    #  shellcheck
    #  tree
    #];
  };

  # Git
  custom.git = {
    enable = true;
    userName = userVars.git.name;
    userEmail = userVars.git.email;
  };

  # NvChad Neovim
  custom.nvchad = {
    enable = true;

    obsidianVaultPaths = userVars.obsidian.vaultPaths;

    # Example: Add extra plugins
    #extraPlugins = with pkgs.vimPlugins; [
    #  catppuccin-nvim
    #];

    # Example: Add extra Lua config
    #extraLuaConfig = ''
    #  vim.cmd("colorscheme catppuccin")
    #  require("catppuccin").setup({})
    #'';
  };

  # Obsidian
  custom.obsidian = {
    enable = true;
    vaultPaths = userVars.obsidian.vaultPaths;
  };

  # Goose CLI
  custom.goose = {
    enable = true;
    # lead model
    leadProvider = "github_copilot";
    leadModel = "gpt-4.1";
    # worker model
    provider = "anthropic";
    model = "claude-4-sonnet";
    #extraEnv = {
    #  GOOSE_TEMPERATURE = "0.7";
    #};
  };

  # Fish shell
  custom.fish.enable = true;

  # Starship prompt
  custom.starship.enable = true;
}
