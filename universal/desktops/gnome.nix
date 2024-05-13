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
        gnome-console
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

    # flatpak
    system.activationScripts.flatpakApps.text = ''
        ${pkgs.flatpak}/bin/flatpak install flathub app.drey.Dialect
        ${pkgs.flatpak}/bin/flatpak install flathub com.github.tchx84.Flatseal
        ${pkgs.flatpak}/bin/flatpak install flathub app.drey.EarTag
        ${pkgs.flatpak}/bin/flatpak install flathub dev.vencord.Vesktop
        ${pkgs.flatpak}/bin/flatpak install flathub io.github.Figma_Linux.figma_linux
        ${pkgs.flatpak}/bin/flatpak install flathub io.github.Foldex.AdwSteamGtk
        ${pkgs.flatpak}/bin/flatpak install flathub org.gnome.gitlab.somas.Apostrophe
        ${pkgs.flatpak}/bin/flatpak install flathub org.nickvision.tubeconverter
        ${pkgs.flatpak}/bin/flatpak install flathub org.telegram.desktop
        ${pkgs.flatpak}/bin/flatpak install flathub io.bassi.Amberol
        ${pkgs.flatpak}/bin/flatpak install flathub com.raggesilver.BlackBox
    '';
}