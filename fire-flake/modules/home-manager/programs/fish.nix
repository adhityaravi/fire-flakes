{ config, lib, pkgs, ... }:

let
  cfg = config.custom.fish;

in {
  options.custom.fish = {
    enable = lib.mkEnableOption "Enable fish shell";
  };

  config = lib.mkIf cfg.enable {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        if type -q fortune && type -q cowsay && type -q lolcat
          fortune | cowsay -f tux | lolcat
        end
      '';
    };

    home.packages = with pkgs; [ fish fortune cowsay lolcat ];
  };
}
