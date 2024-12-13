{ config, pkgs, modulesPath, ... }: 
let
    resourceDir = ../../resources;
in
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
        cheese # webcam tool
        gnome-music
        epiphany # web browser
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
    ]) ++ (with pkgs.gnome; [
        
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
        ${pkgs.flatpak}/bin/flatpak install flathub com.raggesilver.BlackBox
        ${pkgs.flatpak}/bin/flatpak install flathub de.haeckerfelix.Fragments
        ${pkgs.flatpak}/bin/flatpak install flathub com.github.neithern.g4music
    '';

    # apps & extensions
    environment.systemPackages = (with pkgs; [
        gnome-tweaks
        gnome-software
        dconf-editor
        quadrapassel
    ]) ++ (with pkgs.gnomeExtensions; [
        # gnome extensions
        # just-perfection
        extension-list
        alphabetical-app-grid
        forge
        app-hider
        blur-my-shell
        caffeine
        unmess
        # broken atm
        # pano
        clipboard-history
        gsconnect
        mpris-label
        tray-icons-reloaded
        undecorate
        window-is-ready-remover
    ]);

    # asuijkndloasuijd
    system.activationScripts.roundedCorners.text = ''
        ${pkgs.coreutils}/bin/cp ${resourceDir}/extensions/rounded-window-corners@fxgn /home/nrd/.local/share/gnome-shell/extensions || echo RWC already installed
    '';
}
