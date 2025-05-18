{ config, pkgs, lib, nodeConfig ? {}, ... }:

let
  enable = nodeConfig.tailscale.enable or true;  # default to true
  hostname = nodeConfig.hostName or config.networking.hostName;
in
lib.mkIf enable {
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both"; # enables subnet routing and exit nodes
  };

  # Optional auto-auth using sops-managed auth key
  sops.secrets.tailscaleAuthKey = {
    sopsFile = ../../secrets/tailscale.yaml;
    restartUnits = [ "tailscaled.service" ];
  };

  systemd.services.tailscale-autoconnect = {
    description = "Auto-connect to Tailscale";
    after = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        ${pkgs.tailscale}/bin/tailscale up \
          --authkey $(< ${config.sops.secrets.tailscaleAuthKey.path}) \
          --hostname ${hostname} \
          --ssh
      '';
    };
  };
}

