{ config, pkgs, ... }:

{ 
  boot.loader = {
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
        menuentry "shitos 11" {
          insmod part_gpt
          insmod fat
          insmod search_fs_uuid
          insmod chain
          search --fs-uuid --set=root A42D-9C42
          chainloader /EFI/Microsoft/Boot/bootmgfw.efi
        }
      '';
    };
  };
}
