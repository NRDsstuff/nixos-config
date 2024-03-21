{}:

{
  # kernel modules
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # bootloader
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot"; 
    };
    grub = {
      devices = ["nodev"];  # Despite what the manpage indicates, setting device to "nodev" will still call grub-install if efiSupport is true
      efiSupport = true;
      enable = true;
      gfxmodeEfi = "2160x1440";
    };
  };
}