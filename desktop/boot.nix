{ config, pkgs, ... }:

{ 
    boot = {
        # kernel modules
        kernelParams = [ "intel_iommu=on" ];
        initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
        supportedFilesystems = [ "ntfs" ];
        initrd.kernelModules = [ ];
        kernelModules = [ "kvm-intel" ];
        extraModulePackages = [ ];
        kernelPackages = pkgs.linuxPackages_latest; 

        # bootloader
        loader = {
            systemd-boot = {
                enable = false;
                memtest86.enable = true;
                consoleMode = "max";
            };
            efi = {
                canTouchEfiVariables = true;
                efiSysMountPoint = "/boot"; 
            };
            grub = {
                devices = ["nodev"];  # Despite what the manpage indicates, setting device to "nodev" will still call grub-install if efiSupport is true
                efiSupport = true;
                enable = true;
                gfxmodeEfi = "1920x1080";
            };
        };
    };
}