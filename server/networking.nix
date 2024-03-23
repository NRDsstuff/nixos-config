{ config, lib, pkgs, ... }:

{
    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.enp3s0.useDHCP = lib.mkDefault true;

    # ssh
    services.openssh = {
        enable = true;
        DenyUsers = [ "shareduser" ];
    };
    
    # hostname
    networking.hostName = "nrdeproseros";
    
    # Enable networking
    networking.networkmanager.enable = true;

    # firewall
    networking.firewall = {
        enable = true;
        allowedTCPPortRanges = [
            {
                from = 20;
                to = 22;
            }
            {
                from = 25555;
                to = 25565;
            }
        ];
        allowedUDPPortRanges = [
            {
                from = 20;
                to = 22;
            }
            {
                from = 25555;
                to = 25565;
            }
        ];
    };
}
