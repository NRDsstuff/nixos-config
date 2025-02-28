{ config, lib, pkgs, modulesPath, ... }:

{
    # my hard drive config
    fileSystems."/" = { 
        device = "/dev/disk/by-uuid/739f6fea-2c77-4cf3-803b-ffb315e70490";
        fsType = "ext4";
    };

    fileSystems."/boot" = { 
        device = "/dev/disk/by-uuid/5F9B-1E4B";
        fsType = "vfat";
        options = [ "fmask=0022" "dmask=0022" ];
    };
      
    fileSystems."/extra" = { 
        device = "/dev/disk/by-uuid/dc13c33b-0fe0-492c-92cb-2f2bf5302a9a";
        fsType = "ext4";
    };

    fileSystems."/wingames" = { 
        device = "/dev/disk/by-uuid/E6DE4CEEDE4CB897";
        fsType = "ntfs-3g"; 
        options = [ "rw" ];
    };

    swapDevices = [ { device = "/dev/disk/by-uuid/01f831d8-9f52-4323-a077-a6db7b547904"; } ];
}
