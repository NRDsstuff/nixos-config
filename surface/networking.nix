{ config, lib, pkgs, ... }:

{
    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.enp3s0.useDHCP = lib.mkDefault true;
    
    # hostname
    networking.hostName = "nrdetablet";
    
    # Enable networking
    networking.networkmanager.enable = true;

    # firewall
    networking.firewall = {
        enable = true;
        # for kde connect 
        allowedTCPPortRanges = [
            {
                from = 1716;
                to = 1764;
            }
        ];
        allowedUDPPortRanges = [
            {
                from = 1716;
                to = 1764;
            }
        ];
    };
}
