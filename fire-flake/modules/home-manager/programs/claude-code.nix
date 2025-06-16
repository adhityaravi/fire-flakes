{ config, lib, pkgs, ... }:
let
  cfg = config.custom.claudeCode;
in {
  options.custom.claudeCode = {
    enable = lib.mkEnableOption "Enable Claude Code CLI";

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.claude-code;
      description = "Claude Code package to install.";
    };

    extraEnv = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {};
      description = "Additional environment variables for Claude Code.";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];
    home.sessionVariables = cfg.extraEnv;
  };
}
