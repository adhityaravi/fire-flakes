{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName  = "Firstname Lastname";
    userEmail = "email@example.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "nvim";
      core.autocrlf = "input";
      push.autoSetupRemote = true;
      diff.colorMoved = "default";
    };

    aliases = {
      co = "checkout";
      br = "branch";
      ci = "commit";
      st = "status";
      lg = "log --oneline --graph --decorate --all";
    };
  };
}
