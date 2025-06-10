{ config, lib, pkgs, ... }:

let
  cfg = config.custom.starship;
  settings = builtins.fromTOML (builtins.readFile ./settings.toml);
in {
  options.custom.starship = {
    enable = lib.mkEnableOption "Enable the starship prompt";
  };

  config = lib.mkIf cfg.enable {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      settings = settings;
    };
    home.packages = [ pkgs.starship ];
  };
}
