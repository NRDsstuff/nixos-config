{ config, pkgs, modulesPath, ... }: 

{
    # xorg config
    services.xserver = {
        enable = true;
        displayManager = {
            lightdm.enable = true;
            pantheon.enable = true;
            lightdm.greeters.pantheon.enable = false;
        };
    };

    # remove bloatware that comes with the DE
    services.xserver.excludePackages = with pkgs; [
        xterm
    ];
    
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        oxygen
    ];

    environment.sessionVariables = {
        NIX_PROFILES = "${pkgs.lib.concatStringsSep " " (pkgs.lib.reverseList config.environment.profiles)}";
    };
}