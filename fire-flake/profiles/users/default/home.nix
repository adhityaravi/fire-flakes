{ pkgs, config, ... }:

{
  imports = [
    ../../../modules/home-manager/programs/git.nix
  ];

  # Git
  custom.git = {
    enable = true;
    userName = config.custom.gitUserName;
    userEmail = config.custom.gitUserEmail;

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      color.ui = true;
    };

    aliases = {
      co = "checkout";
      br = "branch";
      ci = "commit";
      st = "status";
      lg = "log --oneline --graph --all";
    };
  };
}

