{ pkgs, ... }:

pkgs.mkShell {
  name = "nix-flake-devshell";

  buildInputs = [
    pkgs.git
    pkgs.home-manager
    pkgs.nixpkgs-fmt   # Formatter for Nix
    pkgs.alejandra     # Better formatter for Nix
    pkgs.statix        # Linter for Nix
    pkgs.nh            # "Nice Home Manager" CLI helper (optional but great)
  ];

  shellHook = ''
    echo "🚀 Welcome to your Nix Flake Development Shell!"
    echo ""
    echo "🛠️ Available tools:"
    echo " - nixpkgs-fmt       (format Nix files)"
    echo " - alejandra         (better formatter)"
    echo " - statix check      (lint Nix files)"
    echo " - home-manager      (manage your home setup)"
    echo " - nh                (Nice Home Manager helper)"
    echo ""
    echo "💡 Commands you can run:"
    echo " - nix fmt .         (format the project)"
    echo " - statix check .    (lint the project)"
    echo " - home-manager switch --flake .#your-user"
  '';
}
