{ pkgs, lib, nodeConfig ? {}, ... }:

let
  userCfg = nodeConfig.user or {};
in
lib.mkIf (userCfg.enable or false) {
  users.users.${userCfg.name or "admin"} = {
    isNormalUser = true;
    home = "/home/${userCfg.name or "admin"}";
    shell = pkgs.bashInteractive;
    description = "Provisioned Admin";
    extraGroups = [ "wheel" "networkmanager" "docker" ]; # Adjust as needed

    # WARNING: password will be hashed!
    hashedPassword = userCfg.hashedPassword;
    # Alternative:
    # initialHashedPassword = "...";  # For first boot only
  };

  users.groups.${userCfg.name or "admin"} = { };
}

