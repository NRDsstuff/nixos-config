{ config, pkgs, ... }: 
let
    unstable = import <nixos-unstable> { config = { allowUnfree = true; };};
in
{
    # xorg config
    services = {
        xserver.enable = true;
        displayManager.sddm.enable = true;
        desktopManager.plasma6.enable = true;
    };

    # remove bloatware that comes with the DE
    services.xserver.excludePackages = with pkgs; [
        xterm
    ];
    
    environment.plasma6.excludePackages = with pkgs; [
    ];

    environment.sessionVariables = {
        NIX_PROFILES = "${pkgs.lib.concatStringsSep " " (pkgs.lib.reverseList config.environment.profiles)}";
    };

    # qt theme 
    qt = {
        enable = true;
        platformTheme = "kde";
        style = "breeze";
    };
}
