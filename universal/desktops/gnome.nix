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
    system.activationScripts.gnomeFlatpakApps.text = ''
        ${pkgs.flatpak}/bin/flatpak install flathub app.drey.Dialect
        ${pkgs.flatpak}/bin/flatpak install flathub com.github.tchx84.Flatseal
        ${pkgs.flatpak}/bin/flatpak install flathub app.drey.EarTag
        ${pkgs.flatpak}/bin/flatpak install flathub io.github.Foldex.AdwSteamGtk
        ${pkgs.flatpak}/bin/flatpak install flathub org.nickvision.tubeconverter
        ${pkgs.flatpak}/bin/flatpak install flathub io.bassi.Amberol
        ${pkgs.flatpak}/bin/flatpak install flathub com.raggesilver.BlackBox
        ${pkgs.flatpak}/bin/flatpak install flathub de.haeckerfelix.Fragments
    '';

    environment.systemPackages = (with pkgs.gnome; [
        gnome-tweaks
        gnome-software
        dconf-editor
        quadrapassel
    ]) ++ (with pkgs.gnomeExtensions; [
        # gnome extensions
        just-perfection
        extension-list
        alphabetical-app-grid
        forge
        app-hider
        blur-my-shell
        caffeine
        unmess
        pano
        gsconnect
        mpris-label
        tray-icons-reloaded
        undecorate
        window-is-ready-remover
    ]);
}
