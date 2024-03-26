{ config, pkgs, ... }:

{ 
    # kernel modules
    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
    boot.supportedFilesystems = [ "ntfs" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];
    
    # bootloader  
    boot.loader = {
        systemd-boot = {
            enable = true;
            memtest86.enable = true;
            consoleMode = "max";
        };
        efi = {
            canTouchEfiVariables = true;
            efiSysMountPoint = "/boot"; 
        };
        grub.enable = false;
    };
}
