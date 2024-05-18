{ config, pkgs, modulesPath, ... }: 

{
    # xorg config
    services.xserver = {
        enable = true;
        desktopManager.pantheon.enable = true;
        displayManager = {
            lightdm.enable = true;
            lightdm.greeters.pantheon.enable = false;
        };
    };

    # remove bloatware that comes with the DE
    services.xserver.excludePackages = with pkgs; [
        xterm
    ];
}