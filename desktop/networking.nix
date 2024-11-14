{ config, lib, pkgs, ... }:

{
    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.enp3s0.useDHCP = lib.mkDefault true;

    # ssh
    services.openssh.enable = true;
    
    # hostname
    networking.hostName = "nrdeproseros";
    
    # Enable networking
    networking.networkmanager.enable = true;

    # firewall
    networking.firewall = {
        enable = true;
        # for kde connect and desktop streaming
        allowedTCPPortRanges = [
            {
                from = 1716;
                to = 1764;
            }
            {
                from = 3131;
                to = 3131;
            }
            {
                from = 25555;
                to = 25565;
            }
        ];
        allowedUDPPortRanges = [
            {
                from = 1716;
                to = 1764;
            }
            {
                from = 3131;
                to = 3131;
            }
            {
                from = 25555;
                to = 25565;
            }
        ];
    };
}
