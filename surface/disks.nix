{ config, pkgs, modulesPath, ... }:

{
  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/b09d22b9-fe38-412f-978b-82d4d1ecf505";
    fsType = "ext4";
  };

  fileSystems."/boot" = { 
    device = "/dev/disk/by-uuid/52DC-C04C";
    fsType = "vfat";
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/f954517c-ea84-472f-abda-3bf194378cab"; } ];
}