{ config, pkgs, modulesPath, ... }:
let
    unstable = import <nixos-unstable> { config = { allowUnfree = true; };};
    resourceDir = ./../resources;
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
        ${pkgs.flatpak}/bin/flatpak install app.drey.Dialect
        ${pkgs.flatpak}/bin/flatpak install com.github.tchx84.Flatseal
        ${pkgs.flatpak}/bin/flatpak install app.drey.EarTag
        ${pkgs.flatpak}/bin/flatpak install dev.vencord.Vesktop
        ${pkgs.flatpak}/bin/flatpak install io.github.Figma_Linux.figma_linux
        ${pkgs.flatpak}/bin/flatpak install io.github.Foldex.AdwSteamGtk
        ${pkgs.flatpak}/bin/flatpak install org.gnome.gitlab.somas.Apostrophe
        ${pkgs.flatpak}/bin/flatpak install org.nickvision.tubeconverter
        ${pkgs.flatpak}/bin/flatpak install org.telegram.desktop
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
            nativeMessagingHosts.packages = [ unstable.firefoxpwa ];
        };
    };
    
    # idk
    environment.systemPackages = (with pkgs; [
        unstable.firefoxpwa
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
        unzip
        bun
        tuba
        nodejs
        lollypop
        obsidian
        vscode
        zulu8
        libreoffice
        inkscape
    ]) ++ (with pkgs.gnome; [
        # gnome packages
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

    # install custom icon packs, cursors and wallpapers
    system.activationScripts.themingResources.text = ''
        ${pkgs.coreutils}/bin/rm -rf /usr/share/icons
        ${pkgs.coreutils}/bin/rm -rf /usr/share/backgrounds
        ${pkgs.coreutils}/bin/rm -rf /usr/share/themes
        ${pkgs.coreutils}/bin/mkdir -p /usr # we can never be 100% sure
        ${pkgs.coreutils}/bin/mkdir -p /usr/share
        ${pkgs.coreutils}/bin/cp ${resourceDir}/icons /usr/share/icons -r
        ${pkgs.coreutils}/bin/cp ${resourceDir}/backgrounds /usr/share/backgrounds -r
        ${pkgs.coreutils}/bin/cp ${resourceDir}/themes /usr/share/themes -r
        ${pkgs.coreutils}/bin/chmod 777 -R /usr/share # ugh
    '';
}
