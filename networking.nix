{ config, pkgs, ... }:

{
  # hostname
  networking.hostName = "nrdeproseros";
  
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
