{ config, lib, pkgs, ... }:

let
  cfg = config.custom.git;
in

{
  options.custom.git = {
    enable = lib.mkEnableOption "Enable Git configuration";

    userName = lib.mkOption {
      type = lib.types.str;
      description = "Git user name for commits.";
    };

    userEmail = lib.mkOption {
      type = lib.types.str;
      description = "Git user email for commits.";
    };

    extraConfig = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      description = "Additional Git configuration attributes.";
    };

    aliases = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      description = "Git command aliases.";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = cfg.userName;
      userEmail = cfg.userEmail;

      extraConfig = cfg.extraConfig;
      aliases = cfg.aliases;
    };
  };
}
