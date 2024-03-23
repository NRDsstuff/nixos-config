{ config, lib, pkgs, modulesPath, ... }:

{
  # my hard drive config
  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/22b300b6-35b3-4318-a2a1-dfeeac785616";
    fsType = "btrfs";
  };

  fileSystems."/boot" = { 
    device = "/dev/disk/by-uuid/A42D-9C42";
    fsType = "vfat";
  };
    
  fileSystems."/extra" = { 
    device = "/dev/disk/by-uuid/3d2d4241-1e43-4bdc-859f-08a86ea170c2";
    fsType = "btrfs";
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/33baf819-5392-4cbf-8f8d-cb0e6a17de49"; } ];
}