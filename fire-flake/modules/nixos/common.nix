{ pkgs, ... }:

{
  # Enable flakes and nix-command
  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Localisation
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  # Networking (override in node-specific config if needed)
  networking.useDHCP = true;

  # Allow unfree packages globally (e.g., btop, some NVIDIA stuff, zfs, etc.)
  nixpkgs.config.allowUnfree = true;

  # Quality-of-life shell enhancements
  environment.shellAliases = {
    ll = "ls -alF";
    la = "ls -A";
    l = "ls -CF";
  };

  # Enable bash completions
  programs.bash.enableCompletion = true;

  # Set system state version (locked to your NixOS release)
  system.stateVersion = "24.05";
}

