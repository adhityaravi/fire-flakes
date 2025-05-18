{ lib, nodeConfig ? {}, ... }:

let
  enabled = nodeConfig.zfs.enable or false;
  mountPoint = nodeConfig.zfs.mountPoint or "/data";
  poolName = nodeConfig.zfs.pool or "tank"; # fallback to "tank" if not defined
in
lib.mkIf enabled {
  boot.supportedFilesystems = [ "zfs" ];

  services.zfs = {
    autoSnapshot.enable = true;
    trim.enable = true;
  };

  # Mount the main pool if desired (can be managed in user-defined config too)
  fileSystems.${mountPoint} = {
    device = poolName;
    fsType = "zfs";
    options = [ "x-systemd.requires=zfs-mount.service" ];
  };
}

