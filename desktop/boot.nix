{ config, pkgs, ... }:

{ 
    boot = {
        # kernel modules
        kernelParams = [ "intel_iommu=on" ];
        initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "uhci_hcd" "ehci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
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
                extraEntries = ''
                    menuentry "SapphireOS 11" {
                        insmod part_gpt
                        insmod fat
                        insmod search_fs_uuid
                        insmod chain
                        search --fs-uuid --set=root 5F9B-1E4B
                        chainloader /EFI/Microsoft/Boot/bootmgfw.efi
                    }
                '';
            };
        };
    };
}