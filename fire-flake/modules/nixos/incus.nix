{ pkgs, lib, nodeConfig ? {}, ... }:

let
  enabled = nodeConfig.incus.enable or false;
in
lib.mkIf enabled {
  # Enable Incus server
  services.incus = {
    enable = true;
    package = pkgs.incus;
  };

  # Optional: expose Incus client CLI
  environment.systemPackages = with pkgs; [
    incus
    incus-client
  ];

  # Allow Incus API port in firewall (if remote access / clustering is needed)
  networking.firewall.allowedTCPPorts = [ 8443 ]; # Incus HTTPS API port

  # Incus group for local user access
  users.groups.incus = { };

  # (Optional) user access via group
  users.users.root.extraGroups = [ "incus" ];

  # Mount dependencies (required for nested containers)
  boot.kernelModules = [ "kvm" "ip_tables" "overlay" "br_netfilter" "veth" ];

  # Required sysctl settings
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.bridge.bridge-nf-call-iptables" = 1;
    "net.bridge.bridge-nf-call-ip6tables" = 1;
  };

  # Optional: set Incus daemon to wait for network-online
  systemd.services.incus = {
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
  };

  # Optional: pre-seed incus config (for single-node workloads)
  # environment.etc."incus-preseed.yaml".text = ''
  #   config: {}
  #   networks: []
  #   storage_pools: []
  #   profiles: []
  # '';
  #
  # systemd.services.incus-preseed = {
  #   description = "Preseed Incus if not initialized";
  #   after = [ "incus.service" ];
  #   wantedBy = [ "multi-user.target" ];
  #   serviceConfig.Type = "oneshot";
  #   serviceConfig.ExecStart = ''
  #     ${pkgs.incus}/bin/incus info >/dev/null 2>&1 || \
  #     ${pkgs.incus}/bin/incus init < /etc/incus-preseed.yaml
  #   '';
  # };
}

