{ config, pkgs, ... }:
let
    unstable = import <nixos-unstable> { config = { allowUnfree = true; };};
in
{
    imports = [ <home-manager/nixos> ];

    # meow
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    
    # pooprietary
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.nvidia.acceptLicense = true;

    # flatpak 
    services.flatpak.enable = true;
    system.activationScripts.flathub.text = "${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo";
    system.activationScripts.flatpakApps.text = ''
        ${pkgs.coreutils}/bin/yes | ${pkgs.flatpak}/bin/flatpak install app.drey.Dialect
        ${pkgs.coreutils}/bin/yes | ${pkgs.flatpak}/bin/flatpak install com.github.tchx84.Flatseal
        ${pkgs.coreutils}/bin/yes | ${pkgs.flatpak}/bin/flatpak install app.drey.EarTag
        ${pkgs.coreutils}/bin/yes | ${pkgs.flatpak}/bin/flatpak install dev.vencord.Vesktop
        ${pkgs.coreutils}/bin/yes | ${pkgs.flatpak}/bin/flatpak install io.github.Figma_Linux.figma_linux
        ${pkgs.coreutils}/bin/yes | ${pkgs.flatpak}/bin/flatpak install io.github.Foldex.AdwSteamGtk
        ${pkgs.coreutils}/bin/yes | ${pkgs.flatpak}/bin/flatpak install org.gnome.gitlab.somas.Apostrophe
        ${pkgs.coreutils}/bin/yes | ${pkgs.flatpak}/bin/flatpak install org.nickvision.tubeconverter
    '';

    # set up ~
    system.activationScripts.extra.text = ''
        if [ -d "/extra" ]; then
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Videos && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Videos /home/nrd/Videos
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/3D && ${pkgs.coreutils}/bin/ln -s /extra/nrd/3D /home/nrd/3D
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Pictures && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Pictures /home/nrd/Pictures
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Templates && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Templates /home/nrd/Templates
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Music && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Music /home/nrd/Music
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Random && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Random /home/nrd/Random
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Coding && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Coding /home/nrd/Coding
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Nixos && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Nixos /home/nrd/Nixos
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Memes && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Memes /home/nrd/Memes
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Documents && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Documents /home/nrd/Documents
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Doom && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Doom /home/nrd/Doom
            ${pkgs.coreutils}/bin/rm -rf /home/nrd/Games && ${pkgs.coreutils}/bin/ln -s /extra/nrd/Games /home/nrd/Games
        else
            echo "/extra does not exist."
        fi
    '';

    # idk what to do
    home-manager.useGlobalPkgs = true;
    
    # nix pkgs
    programs = {
        nix-ld.enable = true;
        zsh.enable = true;
        firefox = {
            enable = true;
            preferences = {
                "widget.use-xdg-desktop-portal.file-picker" = 1;
            };
        };
    };
    
    # idk
    environment.systemPackages = (with pkgs; [
        thefuck
        wget
        home-manager
        dconf2nix
        android-tools
        killall
        gparted
    ]) ++ (with pkgs.gnome; [
        gnome-tweaks
        gnome-software
        dconf-editor
    ]);

    # nrd
    users.users.nrd.packages = (with pkgs; [
        # apps
        bun
        tuba
        nodejs
        lollypop
        obsidian
        vscode
        zulu8
        libreoffice
        telegram-desktop
        inkscape
    ]) ++ (with pkgs.gnome; [
        # gnome packages
    ]) ++ (with pkgs.gnomeExtensions; [
        # gnome extensions
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
    
    # SHUT THE FUCK UP
    nixpkgs.config.permittedInsecurePackages = [
        "electron-25.9.0" 
        "openssl-1.1.1w"
    ];
    
    # fonts lol
    fonts = {
        packages = with pkgs; [
            atkinson-hyperlegible
            noto-fonts-emoji
            noto-fonts-cjk
            noto-fonts
            fira-code-nerdfont
        ];
    };
}
