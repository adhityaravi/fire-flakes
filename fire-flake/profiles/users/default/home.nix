{ config, lib, pkgs, userVars, ... }:

{
  imports = [
    ../../../modules/home-manager/programs/git.nix
    ../../../modules/home-manager/programs/kitty.nix
    ../../../modules/home-manager/programs/neovim.nix
  ];

  home = {
    username = userVars.username;
    homeDirectory = userVars.homeDirectory;
    stateVersion = userVars.stateVersion;
  };

  # Git
  custom.git = {
    enable = true;
    userName = userVars.git.name;
    userEmail = userVars.git.email;
  };

  # Neovim
  custom.neovim = {
    enable = true;

    # Example: Add extra plugins
    extraPlugins = with pkgs.vimPlugins; [
      catppuccin-nvim
    ];

    # Example: Add extra Lua config
    extraLuaConfig = ''
      vim.cmd("colorscheme catppuccin")
      require("catppuccin").setup({})
    '';
  };

}
