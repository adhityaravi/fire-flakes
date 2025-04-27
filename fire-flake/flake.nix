{
  description = "A flake that sets up a fire dev environment 🔥";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
    };

    # Optional: if enabled, an attempt will be made to load personal configurations from a git repo
    #fire-flake-config = {
    #  url = "git@github.com:adhityaravi/fire-flake-ivdi.git";
    #  flake = true
    #};
  };

  outputs = { self, nixpkgs, home-manager, ... }: 

  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

    # Load user variables
    userVars = import ./lib/loadVars.nix {
      inherit (nixpkgs) lib;
      fireFlakeConfig = fire-flake-config;
    };

  in
  {
    # Dev shells
    devShells.${system} = {
      default = import ./devShell/default.nix { inherit pkgs; };
    };

    # Default home-manager configuration
    homeConfigurations.${userVars.username} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./profiles/users/default/home.nix
        {
          home.username = userVars.username;
          home.homeDirectory = userVars.homeDirectory;
          home.stateVersion = userVars.stateVersion;

          custom.gitUserName = userVars.git.name;
          custom.gitUserEmail = userVars.git.email;
        }
      ];
    };
  };
}
