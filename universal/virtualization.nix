{ config, pkgs, ... }:

{
    programs.virt-manager.enable = true;
    virtualisation = {
        libvirtd.enable = true;
        docker = { 
            enable = true;
            storageDriver = "btrfs";
            rootless = {
                enable = true;
                setSocketVariable = true;
            };
        };
    };
}