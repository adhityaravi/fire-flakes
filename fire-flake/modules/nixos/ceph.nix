{ lib, pkgs, nodeConfig ? {}, ... }:

let
  cephCfg = nodeConfig.ceph or {};
  enabled = cephCfg.enable or (cephCfg.mon or false || cephCfg.osd or false);
in
lib.mkIf enabled {
  # Basic Ceph services
  services.ceph = {
    enable = true;
    mon.enable = cephCfg.mon or false;
    osd.enable = cephCfg.osd or false;
  };

  # Load required kernel module
  boot.kernelModules = [ "rbd" ];

  # Set up Ceph's system users/groups if needed
  users.groups.ceph = { };
  users.users.ceph = {
    group = "ceph";
    isSystemUser = true;
  };

  # Optional: expose Ceph-related system packages
  environment.systemPackages = with pkgs; [
    ceph
  ];

  # Optional: allow Ceph traffic (adjust as needed for your network)
  networking.firewall.allowedTCPPorts = [
    6789 # Ceph MON default port
    3300 # Ceph MON v2 port
  ];
  networking.firewall.allowedTCPPortRanges = [
    { from = 6800; to = 7300; } # OSDs use a range
  ];

  # Optional: add service dependencies (e.g., wait for network)
  systemd.services.ceph-mon = lib.mkIf (cephCfg.mon or false) {
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
  };

  systemd.services.ceph-osd = lib.mkIf (cephCfg.osd or false) {
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
  };
}

