{
  description = "A flake that sets up a fire dev environment 🔥";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
    };

    # Optional: if disabled, an attempt will be made to load local configuration file from the vars directory. 
    # Note: Only ssh auth is tested.
    fire-flake-config = {
      url = "git+ssh://git@github.com/adhityaravi/fire-flake-config-ivdi.git";
      flake = true;
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 

  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

    fireFlakeConfig = if inputs ? fire-flake-config then
      inputs.fire-flake-config.fireFlakeConfig
    else
      null;

    # Load user variables
    userVars = import ./lib/loadVars.nix {
      inherit (nixpkgs) lib;
      fireFlakeConfig = fireFlakeConfig;
    };

  in
  {
    # Dev shells
    devShells.${system} = {
      default = import ./devShell/default.nix { inherit pkgs; };
    };

    # Default home-manager configuration
    homeConfigurations = {
      default = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./profiles/users/default/home.nix
        ];

        extraSpecialArgs = {
          inherit userVars;
        };
      };
    };
  };
}
