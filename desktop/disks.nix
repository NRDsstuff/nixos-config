{ config, lib, pkgs, modulesPath, ... }:

{
    # my hard drive config
    fileSystems."/" = { 
        device = "/dev/disk/by-uuid/755aa083-c14d-4416-b748-bfac9ffa811d";
        fsType = "btrfs";
    };

    fileSystems."/boot" = { 
        device = "/dev/disk/by-uuid/EA26-EBF0";
        fsType = "vfat";
    };
      
    fileSystems."/extra" = { 
        device = "/dev/disk/by-uuid/3d2d4241-1e43-4bdc-859f-08a86ea170c2";
        fsType = "btrfs";
    };

    swapDevices = [ { device = "/dev/disk/by-uuid/33baf819-5392-4cbf-8f8d-cb0e6a17de49"; } ];
}