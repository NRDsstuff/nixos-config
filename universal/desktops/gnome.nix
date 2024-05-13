{ config, pkgs, modulesPath, ... }: 

{
    # xorg config
    services.xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
    };

    # remove bloatware that comes with the DE
    services.xserver.excludePackages = with pkgs; [
        xterm
    ];
    
    environment.gnome.excludePackages = (with pkgs; [
        gnome-photos
        gnome-tour
        snapshot
    ]) ++ (with pkgs.gnome; [
        cheese # webcam tool
        gnome-music
        gedit # text editor
        epiphany # web browser
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
    ]);

    # qt theme 
    qt = {
        enable = true;
        platformTheme = "gnome";
        style = "adwaita-dark";
    };
    
    environment.sessionVariables = {
        NIX_PROFILES = "${pkgs.lib.concatStringsSep " " (pkgs.lib.reverseList config.environment.profiles)}";
    };
}