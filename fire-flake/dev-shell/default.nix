{ pkgs, ... }:

pkgs.mkShell {
  name = "nix-flake-devshell";

  buildInputs = [
    # Core tooling
    pkgs.git
    pkgs.home-manager
    pkgs.ripgrep
    pkgs.fd
    pkgs.jq

    # Nix
    pkgs.nixpkgs-fmt    # Formatter for Nix
    pkgs.alejandra      # Better formatter for Nix
    pkgs.statix         # Linter for Nix
    pkgs.nil            # Nix LSP server
    pkgs.nh             # "Nice Home Manager" helper

    # Python
    pkgs.python3
    pkgs.ruff
    pkgs.pyright

    # Go
    pkgs.go
    pkgs.go-tools       # includes gofmt/goimports
    pkgs.gopls

    # Rust
    pkgs.rustc
    pkgs.cargo
    pkgs.rustfmt
    pkgs.clippy
    pkgs.rust-analyzer

    # Lua
    pkgs.lua
    pkgs.lua-language-server
    pkgs.stylua

    # YAML
    pkgs.yamlfmt
    pkgs.yaml-language-server

    # Markdown / general
    pkgs.nodejs
    pkgs.nodePackages.prettier
    pkgs.marksman
  ];

  shellHook = ''
    echo "🚀 Welcome to your Nix Flake Development Shell!"
    echo ""
    echo "🛠️ Language servers and formatters are available for:"
    echo "   • Nix    → alejandra, statix, nil"
    echo "   • Python → ruff, pyright"
    echo "   • Go     → gofmt/goimports, gopls"
    echo "   • Rust   → rustfmt, clippy, rust-analyzer"
    echo "   • Lua    → stylua, lua-language-server"
    echo "   • YAML   → yamlfmt, yaml-language-server"
    echo "   • Markdown → prettier, marksman"
    echo ""
    echo "💡 Common commands:"
    echo "   nix fmt ."
    echo "   statix check ."
    echo "   home-manager switch --flake .#your-user"
  '';
}
