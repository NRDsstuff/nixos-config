{ config, pkgs, ... }:

{
    programs.virt-manager.enable = true;
    users.extraGroups.vboxusers.members = [ "nrd" ];
    virtualisation = {
        libvirtd.enable = true;
        # virtualbox.host.enable = true;
        # virtualbox.host.enableExtensionPack = true;
        # virtualbox.guest.enable = true;
        # virtualbox.guest.draganddrop = true;
#         docker = {
#             enable = true;
#             storageDriver = "btrfs";
#             rootless = {
#                 enable = true;
#                 setSocketVariable = true;
#             };
#         };
    };
}
