{ config, lib, pkgs, modulesPath, ... }:

{
  # my hard drive config
  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/CHANGEME";
    fsType = "btrfs";
  };

  fileSystems."/boot" = { 
    device = "/dev/disk/by-uuid/CHANGEME";
    fsType = "vfat";
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/CHANGEME"; } ];
}