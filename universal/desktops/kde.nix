{ config, pkgs, ... }: 
let
    unstable = import <nixos-unstable> {
        config = { allowUnfree = true; };
        services.x11.displayManager.sddm.kde = true;
        services.desktopManager.plasma = pkgs.plasma6;
    };
in
{
    # xorg config
    services.xserver.enable = true;

    config.services.environment.systemPackages.override = pkgsUnstable;

    # remove bloatware that comes with the DE
    services.xserver.excludePackages = with pkgs; [
        xterm
    ];
    
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        
    ];

    environment.sessionVariables = {
        NIX_PROFILES = "${pkgs.lib.concatStringsSep " " (pkgs.lib.reverseList config.environment.profiles)}";
    };
}