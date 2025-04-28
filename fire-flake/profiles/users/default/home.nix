{ config, lib, pkgs, userVars, ... }:

{
  imports = [
    ../../../modules/home-manager/programs/git.nix
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
}
