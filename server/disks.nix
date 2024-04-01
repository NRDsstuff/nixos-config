{ config, lib, pkgs, modulesPath, ... }:

{
  # my hard drive config
  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/dcb6fe91-32cc-4f40-853b-87fb2c9f1d43";
    fsType = "btrfs";
  };

  fileSystems."/boot" = { 
    device = "/dev/disk/by-uuid/4119-1A6B";
    fsType = "vfat";
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/ff6b0717-9a90-4a2f-92fd-502eddfe5d75"; } ];
}