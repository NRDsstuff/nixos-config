{ config, pkgs, modulesPath, ... }: 

{
    # xorg config
    services.xserver = {
        enable = true;
        displayManager.sddm.enable = true;
        desktopManager.plasma6.enable = true;
    };

    # remove bloatware that comes with the DE
    services.xserver.excludePackages = with pkgs; [
        xterm
    ];
    
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        oxygen
    ];
}