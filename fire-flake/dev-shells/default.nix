{ pkgs, ... }:

pkgs.mkShell {
  name = "dev-def"; # default development shell

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
    # Switch to fish shell if available
    if command -v fish >/dev/null 2>&1; then
      exec fish
    fi
 '';
}
